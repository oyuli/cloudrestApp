//
//  SleepDataStore.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import Foundation
import Combine

class SleepDataStore: ObservableObject {
    @Published var entries: [SleepEntry] = []
    
    func addEntry(_ entry: SleepEntry) {
        if let index = entries.firstIndex(where: {Calendar.current.isDate($0.date, inSameDayAs: entry.date)}) {
            entries[index] = entry
        } else {
            entries.append(entry)
        }
    }
    func entries(for month: Date) -> [SleepEntry] {
        entries.filter {
            Calendar.current.isDate($0.date, equalTo: month, toGranularity: .month)
        }
    }
    
    // sleep time in seconds
    func sleepDurations(for month: Date) -> [TimeInterval] {
        entries(for: month).map { correctedSleepDuration(for: $0) }
    }
    func maxSleepDuration(for month: Date) -> TimeInterval? {
        sleepDurations(for: month).max()
    }
    func minSleepDuration(for month: Date) -> TimeInterval? {
        sleepDurations(for: month).min()
    }
    
    // activities
    func mostFrequentActivities(for month: Date) -> [String] {
        let activitiesList = entries(for: month).flatMap { entry -> [String] in
            var activities = [String]()
            if entry.activities.guidedBreathing {activities.append("guided breathing")}
            if entry.activities.exercised {activities.append("exercised")}
            if entry.activities.listenedToMusic {activities.append("listened to music")}
            if entry.activities.ateBeforeBed {activities.append("ate before bed")}
            if entry.activities.drankCaffeine {activities.append("drank caffeine")}
            if entry.activities.scrolledDevices {activities.append("scrolled devices")}
            return activities
        }
        let counts = Dictionary(activitiesList.map { ($0, 1) }, uniquingKeysWith: +)
        let maxCount = counts.values.max() ?? 0
        return counts.filter { $0.value == maxCount }.map { $0.key}
    }
    
    // summary
    struct MonthlySleepSummary {
        let averageDuration: Double
        let maxDuration: Double
        let averageQuality: Int
        let topPositiveActivities: [String]
        let topNegativeActivity: String?
    }
    
    func summarizeSleep(forMonth month: Date) -> MonthlySleepSummary? {
        let monthStart = month.startOfMonth()
        let monthEntries = entries.filter {
            Calendar.current.isDate($0.date, equalTo: monthStart, toGranularity: .month)
        }
        guard !monthEntries.isEmpty else
        {return nil}
        
        var totalDuration: TimeInterval = 0
        var maxDuration: TimeInterval = 0
        var totalQuality = 0
        
        var activityEffect: [String: [TimeInterval]] = [
            "guidedBreathing": [],
            "exercised": [],
            "listenedToMusic": [],
            "ateBeforeBed": [],
            "scrolledDevices": [],
            "drankCaffeine": []
        ]
        
        let activityNames: [String: String] = [
            "guidedBreathing": "guided breathing",
            "exercised": "exercising",
            "listenedToMusic": "listening to music",
            "ateBeforeBed": "eating before bed",
            "scrolledDevices": "scrolling on devices",
            "drankCaffeine": "drinking caffeine"
        ]
        
        for entry in monthEntries {
            let duration = correctedSleepDuration(for: entry)
            totalDuration += duration
            maxDuration = max(maxDuration, duration)
            totalQuality += entry.sleepQuality
            
            // organize by duration
            if entry.activities.guidedBreathing { activityEffect["guidedBreathing"]?.append(duration)}
            if entry.activities.exercised { activityEffect["exercised"]?.append(duration)}
            if entry.activities.listenedToMusic { activityEffect["listenedToMusic"]?.append(duration)}
            if entry.activities.ateBeforeBed { activityEffect["ateBeforeBed"]?.append(duration)}
            if entry.activities.scrolledDevices { activityEffect["scrolledDevices"]?.append(duration)}
            if entry.activities.drankCaffeine { activityEffect["drankCaffeine"]?.append(duration)}
        }
        
        let avgDuration = totalDuration / Double(monthEntries.count)
        let avgQuality = totalQuality / monthEntries.count
        
        // rank activities
        let positiveActivities = ["guidedBreathing", "exercised", "listenedToMusic"]
        let negativeActivities = ["ateBeforeBed", "scrolledDevices", "drankCaffeine"]
        
        func average(_ values: [TimeInterval]) -> TimeInterval {
            guard !values.isEmpty else {return 0}
            return values.reduce(0, +) / Double(values.count)
        }
        
        let topPositives = positiveActivities
            .compactMap { activity in
                let avg = average(activityEffect[activity] ?? [])
                return avg > 0 ? (activity, avg) : nil
            }
            .sorted(by: { $0.1 < $1.1 })
            .prefix(2)
            .compactMap { activityNames[$0.0] }
        
        let topNegativeTuple = negativeActivities
            .compactMap { activity in
                let avg = average(activityEffect[activity] ?? [])
                return avg > 0 ? (activity, avg) : nil
            }
            .sorted(by: { $0.1 < $1.1 })
            .first
        
        let topNegative = topNegativeTuple.map { activityNames[$0.0] ?? $0.0 }
        
        return MonthlySleepSummary(
            averageDuration: avgDuration,
            maxDuration: maxDuration,
            averageQuality: avgQuality,
            topPositiveActivities: topPositives,
            topNegativeActivity: topNegative
        )
    }
    
    // streak
    func currentStreak() -> Int {
        let loggedDays = Set(entries.map { Calendar.current.startOfDay(for: $0.date) })
        let today = Calendar.current.startOfDay(for: Date())
        
        var streak = 0
        var dayToCheck = today
        
        while loggedDays.contains(dayToCheck) {
            streak += 1
            guard let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: dayToCheck) else { break }
            dayToCheck = previousDay
        }
        
        return streak
    }
}

// dates
extension Date {
    func startOfMonth() -> Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
}

// fix the negative sleeping times, account for going past 12 am or pm
private func correctedSleepDuration(for entry: SleepEntry) -> TimeInterval {
    var end = entry.sleepEnd
    if end < entry.sleepStart {
        end = Calendar.current.date(byAdding: .day, value: 1, to: end)!
    }
    return end.timeIntervalSince(entry.sleepStart)
}
