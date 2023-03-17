//
//  DetailViewOfMayor.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/16/23.
//

import SwiftUI

struct DetailViewOfMayor: View {
    
    let mayor: Mayor
    
    var body: some View {
        
        Image("RA1")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
        List {
            Text("\(mayor.name)")
            Text("Time in Office: \(mayor.timeInOffice)")
            Text("Estimated Salary: $\(mayor.estimatedSalary)")
        }
    }
}
struct DetailViewOfMayor_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfMayor(mayor: Mayor(name: "", timeInOffice: "", estimatedSalary: 0))
    }
}
