//
//  ListOfOffices.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import SwiftUI

struct ListOfOffices: View {
    
    let mayor =
    Mayor(name: "David Young", timeInOffice: "One Year", estimatedSalary: 60_000)
    
    let cityCouncilor = [CityCouncilor(name: "Jeff Lambson", timeInOffice: "First Year", estimatedSalary: 27_000), CityCouncilor(name: "Debby Lauret", timeInOffice: "First Year", estimatedSalary: 27_000), CityCouncilor(name: "Tom MacDonald", timeInOffice: "Third Year", estimatedSalary: 27_000)]
    //
    let hm = [
        HM(area: "Orem", name: "Billy Bob", affiliation: "R", estimatedSalary: 50_000),
        HM(area: "Provo", name: "Dirty Dan", affiliation: "D", estimatedSalary: 50_000),
        HM(area: "Salem", name: "PinheadLarry", affiliation: "I", estimatedSalary: 50_000)
    ]
    
    let sheriff = SheriffsOffice(name: "Sherrifson", estimatedSalary: 70_000)
    
    let schoolBoard = [
        SchoolBoardMember(name: "Stacy", term: "First Term", estimatedSalary: 68_000),
        SchoolBoardMember(name: "Sarah", term: "Second Term", estimatedSalary: 68_000),
        SchoolBoardMember(name: "Mark", term: "Second Term", estimatedSalary: 68_000)
    ]
    
    
    var body: some View {
        
        let withIndex = cityCouncilor.enumerated().map({ $0 })
        
        NavigationStack {
            List {
                Section {
                    ForEach(cityCouncilor, id: \.self) { councilor in
                        NavigationLink(destination: DetailViewOfCouncilor(councilor: councilor),
                                       label: {
                            Text("\(councilor.name)")
                        })
                    }
                } header: {
                    Text("City Council")
                }
                Section {
                    NavigationLink("\(mayor.name)", destination: DetailViewOfMayor(mayor: mayor))
                }
            header: {
                Text("Mayor")
            }
                
                Section {
                    ForEach(hm) { hM in
                        NavigationLink(destination: DetailViewOfHM(hm: hM), label: {
                            Text("\(hM.name)")
                        })
                    }
                } header: {
                    Text("House Members")
                }
                
                Section {
                    ForEach(schoolBoard) { schoolBoardMember in
                        NavigationLink(destination: DetailViewOfSchoolBoard(schoolBoard: schoolBoardMember), label: {
                            Text("\(schoolBoardMember.name)")
                        })
                    }
                } header: {
                    Text("School Board")
                }
                
                Section {
                    NavigationLink("\(sheriff.name)", destination: DetailViewOfSheriff(sheriff: sheriff))
                }
            header: {
                Text("Sheriffs Office")
            }
                
                
            } .navigationTitle("Elected Officials")
            
        }
                        
    }
}

struct ListOfOffices_Previews: PreviewProvider {
    static var previews: some View {
        ListOfOffices()
    }
}
