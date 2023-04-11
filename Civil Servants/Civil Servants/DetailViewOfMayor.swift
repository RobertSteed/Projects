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
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.vertical)
                .overlay(
                    
                    List {
                        Image("\(mayor.picture)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                        Text("\(mayor.name)")
                        Text("Time in Office: \(mayor.timeInOffice)")
                        Text("Estimated Salary: $\(mayor.estimatedSalary)")
                        Link("\(mayor.publicPhoneNumber)", destination: URL(string: "tel:\(mayor.publicPhoneNumber)")!)
                    } .scrollContentBackground(.hidden)
                )
        }
    }
}
struct DetailViewOfMayor_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfMayor(mayor: Mayor(name: "", timeInOffice: "", estimatedSalary: 0, publicPhoneNumber: "", picture: ""))
    }
}
