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
        ZStack{
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.vertical)
                .overlay(
                    
                    
                    List {
                        Image("\(schoolBoard.picture)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                        Text("\(schoolBoard.name)")
                        Text("Time in Office: \(schoolBoard.term)")
                        Text("Estimated Salary: $\(schoolBoard.estimatedSalary)")
                    }.scrollContentBackground(.hidden)
                )
        }
        
    }
}
    
    struct DetailViewOfSchoolBoard_Previews: PreviewProvider {
        static var previews: some View {
            DetailViewOfSchoolBoard(schoolBoard: SchoolBoardMember(name: "", term: "", estimatedSalary: 0, publicPhoneNumber: "", picture: ""))
        }
    }

