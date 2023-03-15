//
//  DetailViewOfCivilServant.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/9/23.
//

import SwiftUI

struct DetailViewOfCivilServant: View, Hashable {
    
   
    
    
    let councilor: CityCouncilor?
 
    
    var body: some View { 
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailViewOfCivilServant_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfCivilServant(councilor: CityCouncilor(name: "", timeInOffice: "", estimatedSalary: 0))
    }
}
