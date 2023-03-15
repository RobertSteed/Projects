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
        Text("\(councilor?.name)")
        Text("\(councilor?.timeInOffice)")
        Text("\(councilor?.estimatedSalary)")
    }
}

struct DetailViewOfCivilServant_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfCivilServant(councilor: CityCouncilor(name: "", timeInOffice: "", estimatedSalary: 0))
    }
}
