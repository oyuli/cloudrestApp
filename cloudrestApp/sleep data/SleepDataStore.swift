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
        entries(for: month).map {$0.sleepEnd.timeIntervalSince($0.sleepStart)}
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
}
