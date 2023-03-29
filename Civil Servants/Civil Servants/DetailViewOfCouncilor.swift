//
//  DetailViewOfCivilServant.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/9/23.
//

import SwiftUI

struct DetailViewOfCouncilor: View, Hashable {
    let councilor: CityCouncilor
 
    
    var body: some View {
        
        Image("RA1")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
        List {
            Text("\(councilor.name)")
            Text("Time in Office: \(councilor.timeInOffice)")
            Text("Estimated Salary: $\(councilor.estimatedSalary)")
        }
    }
}

struct DetailViewOfCivilServant_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfCouncilor(councilor: CityCouncilor(name: "", timeInOffice: "", estimatedSalary: 0, publicPhoneNumber: ""))
    }
}
