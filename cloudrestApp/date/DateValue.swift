//
//  DateValue.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

// date struct
struct DateValue: Identifiable {
    var id = UUID().uuidString // unique identifier to conform to the Identifiable protocol
    var day: Int // date in number format
    var date: Date
}
