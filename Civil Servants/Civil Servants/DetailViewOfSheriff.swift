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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailViewOfSheriff_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfSheriff(sheriff: SheriffsOffice(sheriff: "", estimatedSalary: 0))
    }
}
