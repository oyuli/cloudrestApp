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
    
}
