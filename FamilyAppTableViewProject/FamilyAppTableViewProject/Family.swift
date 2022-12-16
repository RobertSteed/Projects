//
//  Family.swift
//  FamilyAppTableViewProject
//
//  Created by Robert Steed on 11/14/22.
//

import Foundation

struct Family {
    var names: String
    var ages: String
    var description: String

    static func familyMembers() -> [Family] {
        return [Family(names: "Mom and Dad", ages: "54 and 55", description: "They live in Alaska. My dad is a big hunter and my Mom is an amazing cook and baker. They are both very intelligent and I love them both."),
                Family(names: "Skylor and Hollie", ages: "32 and 31", description: "They live in China with their son. He has a Youtube channel and works in IT and she is an English teacher"),
                Family(names: "Taylor and Tyler", ages: "31 and 33", description: "They live in Texas with their three girls. She has an earring business and he works in the solar industry"),
                Family(names: "Braxton and Kaitlin", ages: "27 and 27", description: "They live in Cedar Hills. He is going to school and she works in HR"),
                Family(names: "Robert and Katelyn", ages: "24 and 25", description: "We live in Orem. I am going to school and working. Katie is working in HR")]
    }

}

//struct Person {
//    var name: String
//    var age: String
//    var description: String
//}
//
//struct Family {
//    var members: [Person]
//
//    static func familyMembers() -> [Family] {
//        return [
//            Family(members: [
//                Person(name: "mom", age: 54, description: ""),
//                Person(name: "dad", age: 55, description: "")
//            ])
////            Family(names: "Mom and Dad", ages: "54 and 55", description: "They live in Alaska. My dad is a big hunter and my Mom is an amazing cook and baker. They are both very intelligent and I love them both."),
//        ]
//    }
//
//}
