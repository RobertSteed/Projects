//
//  ListOfMeetings.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/21/23.
//

import SwiftUI

struct ListOfMeetings: View {
    
    let meetings = [TimesAndLocationsForMeetings(date: "04/02/23", location: "City Hall, Orem", time: "7:00 PM", name: "City Council"),
                    TimesAndLocationsForMeetings(date: "04/06/23", location: "City Hall, Orem", time: "6:00 PM", name: "Mayors Office"),
                    TimesAndLocationsForMeetings(date: "04/12/23", location: "City Hall, Provo", time: "8:00 PM", name: "Sheriffs Office"),
                    TimesAndLocationsForMeetings(date: "04/17/23", location: "Lone Peak High School", time: "5:30 PM", name: "School Board"),
                    TimesAndLocationsForMeetings(date: "04/21/23", location: "State Municipal Building, American Fork", time: "8:00 PM", name: "House Members")]
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(meetings, id: \.self) { meeting in
                        NavigationLink(destination: DetailOfMeetings(meetings: meeting),
                                       label: {
                            Text("\(meeting.name)")
                        })
                    }
                }
            } .navigationTitle("List of Meetings")
        }
    }
}
 

struct ListOfMeetings_Previews: PreviewProvider {
    static var previews: some View {
        ListOfMeetings()
    }
}
