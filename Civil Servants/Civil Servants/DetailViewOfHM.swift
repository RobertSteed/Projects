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
        ZStack {
        LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
        
     
        List {
            Image("\(hm.picture)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            Text("\(hm.name)")
            Text("Time in Office: \(hm.affiliation)")
            Text("Time in Office: \(hm.area)")
            Text("Estimated Salary: $\(hm.estimatedSalary)")
            
        }.scrollContentBackground(.hidden)
        )
        
    }
    }
}

struct DetailViewOfHM_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfHM(hm: HM(area: "", name: "", affiliation: "", estimatedSalary: 0, publicPhoneNumber: "", picture: ""))
    }
}
