//
//  DetailViewOfSchoolBoard.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/17/23.
//

import SwiftUI

struct DetailViewOfSchoolBoard: View {
    
    var schoolBoard: SchoolBoardMember
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailViewOfSchoolBoard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfSchoolBoard(schoolBoard: SchoolBoardMember(member: "", term: ""))
    }
}
