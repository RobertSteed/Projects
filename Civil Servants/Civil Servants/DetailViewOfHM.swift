//
//  DetailViewOfHM.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/16/23.
//

import SwiftUI

struct DetailViewOfHM: View {
    
    
    
    let hm: HM
    
    var body: some View {
        
        Image("RA1")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
        List {
            Text("\(hm.name)")
            Text("Time in Office: \(hm.affiliation)")
            Text("Time in Office: \(hm.area)")
            Text("Estimated Salary: $\(hm.estimatedSalary)")
            
        }
    }
}

struct DetailViewOfHM_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfHM(hm: HM(area: "", name: "", affiliation: "", estimatedSalary: 0))
    }
}
