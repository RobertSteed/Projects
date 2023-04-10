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
        ZStack{
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.vertical)
                .overlay(
                    List {
                        Image("\(sheriff.picture)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                        
                        Text("\(sheriff.name)")
                        Text("Estimated Salary: $\(sheriff.estimatedSalary)")
                    }.scrollContentBackground(.hidden)
                )
        }
    }
}

struct DetailViewOfSheriff_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfSheriff(sheriff: SheriffsOffice(name: "", estimatedSalary: 0, publicPhoneNumber: "", picture: ""))
    }
}
