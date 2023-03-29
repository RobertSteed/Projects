//
//  ListOfOffices.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import SwiftUI

struct ListOfOffices: View {
    
    let mayor =
    Mayor(name: "David Young", timeInOffice: "One Year", estimatedSalary: 60_000, publicPhoneNumber: "(801) 600-0429", picture: "David Young")
    
    let cityCouncilor = [
        CityCouncilor(name: "Jeff Lambson", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 787-4306", picture: "Jeff Lambson"),
        CityCouncilor(name: "Debby Lauret", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 319-8655", picture: "Debby Lauret"),
        CityCouncilor(name: "Tom MacDonald", timeInOffice: "Third Term", estimatedSalary: 27_000, publicPhoneNumber: "(801)318–3010", picture: "Tom MacDonald"),
        CityCouncilor(name: "LaNae Millet", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 836-8733", picture: "LaNae Millet"),
        CityCouncilor(name: "Terry Peterson", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 916-0812", picture: "Terry Peterson")
    ]
    //
    let hm = [
        HM(area: "Utah County", name: "Stephanie Gricius", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-901-8251", picture: "Stephanie Gricius"),
        HM(area: "Utah County", name: "Jefferson Moss", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-250-6738", picture: "Jefferson Moss"),
        HM(area: "Utah County", name: "A. Cory Maloy", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-477-0019", picture: "A. Cory Maloy"),
        HM(area: "Utah County", name: "Kay J. Christofferson", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-592-5709", picture: "Kay J. Christofferson"),
        HM(area: "Utah County", name: "Brady Brammer", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-709-1790", picture: "Brady Brammer"),
        HM(area: "Utah County", name: "Jon Hawkins", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-368-2534", picture: "Jon Hawkins"),
        HM(area: "Utah County", name: "Val L. Peterson", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-224-4473", picture: "Val L. Peterson"),
        HM(area: "Utah County", name: "Nelson T. Abbott", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-358-3269", picture: "Nelson T. Abbott"),
        HM(area: "Utah County", name: "Keven J. Stratton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-836-6010", picture: "Keven J. Stratton"),
        HM(area: "Utah County", name: "Tyler Clancy", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-598-0052", picture: "Tyler Clancy"),
        HM(area: "Utah County", name: "Marsha Judkins", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-669-6962", picture: "Marsha Judkins"),
        HM(area: "Utah County", name: "Norman K Thurston", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-477-5348", picture: "Norman K Thurston"),
        HM(area: "Utah County", name: "Stephen L. Whyte", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-271-8435", picture: "Stephen L. Whyte"),
        HM(area: "Utah County", name: "Jefferson S. Burton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-225-0575", picture: "Jefferson S. Burton"),
        HM(area: "Utah County", name: "Douglas R. Welton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-977-3870", picture: "Douglas R. Welton"),
        
        
    ]
    
    let sheriff = SheriffsOffice(name: "Mike Smith", estimatedSalary: 70_000, publicPhoneNumber: "(801) 851-4000 ", picture: "Mike Smith")
    
    let schoolBoard = [
        SchoolBoardMember(name: "Julie King", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Julie King"),
        SchoolBoardMember(name: "Joylin Lincoln", term: "First Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Joylin Lincoln"),
        SchoolBoardMember(name: "Stacy Bateman", term: "First Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Stacy Bateman"),
        SchoolBoardMember(name: "Sarah Beeson", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Sarah Beeson"),
        SchoolBoardMember(name: "Mark Clement", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Mark Clement"),
        SchoolBoardMember(name: "Sara Hacken", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Sara Hacken"),
        SchoolBoardMember(name: "Ada Wilson", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "801-610-8400", picture: "Ada Wilson")
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
