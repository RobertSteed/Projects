//
//  ListOfMeetings.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/21/23.
//

import SwiftUI

struct ListOfMeetings: View {
    
    let meetings = [
                    TimesAndLocationsForMeetings(date: "04/11/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "04/25/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "05/09/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "05/23/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "06/13/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "6/27/23", location: "Orem City Center, 56 North State Street, Orem, Utah", time: "3:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "05/09/23", location: " 575 North 100 East American Fork, UT 84003", time: "6:00 PM", name: "School Board"),
                    TimesAndLocationsForMeetings(date: "06/20/23", location: " 575 North 100 East American Fork, UT 84003", time: "6:00 PM", name: "School Board"),
                    TimesAndLocationsForMeetings(date: "07/11/23", location: " 575 North 100 East American Fork, UT 84003", time: "6:00 PM", name: "School Board"),
                    TimesAndLocationsForMeetings(date: "08/08/23", location: " 575 North 100 East American Fork, UT 84003", time: "6:00 PM", name: "School Board"),
                    TimesAndLocationsForMeetings(date: "04/12/23", location: "State Capitol", time: "8:00 AM", name: "House Members"),
                    TimesAndLocationsForMeetings(date: "05/03/23", location: "State Capitol", time: "3:00 PM", name: "House Members"),
                    TimesAndLocationsForMeetings(date: "08/03/23", location: "State Capitol", time: "3:00 PM", name: "House Members")]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.vertical)
                    .overlay(
                List {
                    Section {
                        ForEach(meetings, id: \.self) { meeting in
                            NavigationLink(destination: DetailOfMeetings(meetings: meeting),
                                           label: {
                                VStack {
                                    Text("\(meeting.name)")
                                    Text(" \(meeting.date)")
                                }
                            })
                        }
                    }
                } .navigationTitle("List of Meetings")
                    .scrollContentBackground(.hidden)
            )
            }
        }
    }
}
 

struct ListOfMeetings_Previews: PreviewProvider {
    static var previews: some View {
        ListOfMeetings()
    }
}
