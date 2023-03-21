//
//  MeetingDetails.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/21/23.
//

import SwiftUI

struct DetailOfMeetings: View {
    
    var meetings: TimesAndLocationsForMeetings
    
    var body: some View {
        List {
            Text("Date: \(meetings.date)")
            Text("Time: \(meetings.time)")
            Text("Location: \(meetings.location)")
            
        } .navigationTitle(meetings.name)
    }
}

struct DetailOfMeetings_Previews: PreviewProvider {
    static var previews: some View {
       DetailOfMeetings(meetings: TimesAndLocationsForMeetings(date: "", location: "", time: "", name: ""))
    }
}
