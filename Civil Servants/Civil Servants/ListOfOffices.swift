//
//  ListOfOffices.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import SwiftUI

struct ListOfOffices: View {
    
    let mayor =
        Mayor(mayor: "David Young", timeInOffice: "One Year", estimatedSalary: 60_000)
    
    let cityCouncilor = [CityCouncilor(name: "Jeff Lambson", timeInOffice: "First Year", estimatedSalary: 27_000), CityCouncilor(name: "Debby Lauret", timeInOffice: "First Year", estimatedSalary: 27_000), CityCouncilor(name: "Tom MacDonald", timeInOffice: "Third Year", estimatedSalary: 27_000)]
//
    let dhm = [DHM(area: "Orem", name: "Billy Bob", affiliation: .republican, estimatedSalary: 50_000)]
    
    var body: some View {
        NavigationStack {
            List {

                ForEach(cityCouncilor) { councilor in
                    NavigationLink("Councilor", value: DetailViewOfCivilServant(councilor: councilor))
                }
//
            
//
//
            }
            
        }
        
    }
}

struct ListOfOffices_Previews: PreviewProvider {
    static var previews: some View {
        ListOfOffices()
    }
}
