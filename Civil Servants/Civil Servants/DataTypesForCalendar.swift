//
//  DataTypesForCalendar.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/20/23.
//

import Foundation


struct ScheduleItem: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String?
}

struct CalendarViewModel: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let date: String
    var items: [ScheduleItem]
}
