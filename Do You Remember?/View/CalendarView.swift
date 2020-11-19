//
//  CalendarView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 07.11.20.
//

import SwiftUI
import ElegantCalendar

struct CalendarView: View {
    var user: User
    @ObservedObject var calendarManager: ElegantCalendarManager
    
    init(user: User) {
        self.user = user
        self.calendarManager = ElegantCalendarManager(configuration: CalendarConfiguration(startDate: Date(timeIntervalSinceNow: -100000000), endDate: Date()))
    }
    
    
    var body: some View {
        ElegantCalendarView(calendarManager: calendarManager)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(user: User())
    }
}
