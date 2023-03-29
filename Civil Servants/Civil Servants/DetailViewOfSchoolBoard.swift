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
        
        Image("RA1")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
        List {
            Text("\(schoolBoard.name)")
            Text("Time in Office: \(schoolBoard.term)")
            Text("Estimated Salary: $\(schoolBoard.estimatedSalary)")
        }
    }
}

struct DetailViewOfSchoolBoard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewOfSchoolBoard(schoolBoard: SchoolBoardMember(name: "", term: "", estimatedSalary: 0, publicPhoneNumber: ""))
    }
}
