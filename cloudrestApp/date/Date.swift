//
//  Date.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import Foundation

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // get start date
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: self)!
        
        return range.compactMap { day -> Date in
            calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
