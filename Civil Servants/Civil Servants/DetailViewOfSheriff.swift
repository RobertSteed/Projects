//
//  DetailViewOfSheriff.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/17/23.
//

import SwiftUI

struct DetailViewOfSheriff: View {
    
    var sheriff: SheriffsOffice
    
    var body: some View {
        
        Image("RA1")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
        List {
            Text("\(sheriff.name)")
            Text("Estimated Salary: $\(sheriff.estimatedSalary)")
        }
    }
}

struct DetailViewOfSheriff_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfSheriff(sheriff: SheriffsOffice(name: "", estimatedSalary: 0))
    }
}
