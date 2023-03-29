//
//  ListOfOffices.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import SwiftUI

struct ListOfOffices: View {
    
    let mayor =
    Mayor(name: "David Young", timeInOffice: "One Year", estimatedSalary: 60_000, publicPhoneNumber: "(801) 600-0429", picture: <#String#>)
    
    let cityCouncilor = [
        CityCouncilor(name: "Jeff Lambson", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 787-4306", picture: <#String#>),
        CityCouncilor(name: "Debby Lauret", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 319-8655", picture: <#String#>),
        CityCouncilor(name: "Tom MacDonald", timeInOffice: "Third Term", estimatedSalary: 27_000, publicPhoneNumber: "(801)318–3010", picture: <#String#>),
        CityCouncilor(name: "LaNae Millet", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 836-8733", picture: <#String#>),
        CityCouncilor(name: "Terry Peterson", timeInOffice: "First Term", estimatedSalary: 27_000, publicPhoneNumber: "(801) 916-0812", picture: <#String#>)
    ]
    //
    let hm = [
        HM(area: "Utah County", name: "Stephanie Gricius", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-901-8251", picture: <#String#>),
        HM(area: "Utah County", name: "Jefferson Moss", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-250-6738", picture: <#String#>),
        HM(area: "Utah County", name: "A. Cory Maloy", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-477-0019", picture: <#String#>),
        HM(area: "Utah County", name: "Kay J. Christofferson", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-592-5709", picture: <#String#>),
        HM(area: "Utah County", name: "Brady Brammer", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-709-1790", picture: <#String#>),
        HM(area: "Utah County", name: "Jon Hawkins", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-368-2534", picture: <#String#>),
        HM(area: "Utah County", name: "Val L. Peterson", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-224-4473", picture: <#String#>),
        HM(area: "Utah County", name: "Nelson T. Abbott", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-358-3269", picture: <#String#>),
        HM(area: "Utah County", name: "Keven J. Stratton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-836-6010", picture: <#String#>),
        HM(area: "Utah County", name: "Tyler Clancy", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-598-0052", picture: <#String#>),
        HM(area: "Utah County", name: "Marsha Judkins", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-669-6962", picture: <#String#>),
        HM(area: "Utah County", name: "Norman K Thurston", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "801-477-5348", picture: <#String#>),
        HM(area: "Utah County", name: "Stephen L. Whyte", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-271-8435", picture: <#String#>),
        HM(area: "Utah County", name: "Jefferson S. Burton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-225-0575", picture: <#String#>),
        HM(area: "Utah County", name: "Douglas R. Welton", affiliation: "R", estimatedSalary: 50_000, publicPhoneNumber: "385-977-3870", picture: <#String#>),
        
        
    ]
    
    let sheriff = SheriffsOffice(name: "Sherrifson", estimatedSalary: 70_000, publicPhoneNumber: "12", picture: <#String#>)
    
    let schoolBoard = [
        SchoolBoardMember(name: "Stacy", term: "First Term", estimatedSalary: 68_000, publicPhoneNumber: "13", picture: <#String#>),
        SchoolBoardMember(name: "Sarah", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "18", picture: <#String#>),
        SchoolBoardMember(name: "Mark", term: "Second Term", estimatedSalary: 68_000, publicPhoneNumber: "22", picture: <#String#>)
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
