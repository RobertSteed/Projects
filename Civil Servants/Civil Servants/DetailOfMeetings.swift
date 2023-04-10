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
        LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
        List {
            VStack {
                Text("Date: \(meetings.date)")
                    .padding()
                Text("Time: \(meetings.time)")
                    .padding()
                Text("Location: \(meetings.location)")
                    .padding()
                
            }
            
        } .navigationTitle(meetings.name)
            .scrollContentBackground(.hidden)
        )
    }
}

struct DetailOfMeetings_Previews: PreviewProvider {
    static var previews: some View {
       DetailOfMeetings(meetings: TimesAndLocationsForMeetings(date: "", location: "", time: "", name: ""))
    }
}
