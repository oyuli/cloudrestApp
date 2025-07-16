//
//  SleepData.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import Foundation

struct SleepEntry: Identifiable, Codable {
    var id: UUID = UUID()
    let date: Date
    let sleepStart: Date
    let sleepEnd: Date
    let sleepQuality: Int
    let activities: Activities
}

struct Activities: Codable {
    var guidedBreathing: Bool
    var exercised: Bool
    var listenedToMusic: Bool
    var ateBeforeBed: Bool
    var scrolledDevices: Bool
    var drankCaffeine: Bool
}
