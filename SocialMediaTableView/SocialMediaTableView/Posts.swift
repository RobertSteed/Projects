//
//  Posts.swift
//  SocialMediaTableView
//
//  Created by Robert Steed on 11/15/22.
//

import Foundation

struct Posts {
    var username: String
    var date: Date
    var message: String
    
    // date object, formatter.string(from) timeINterval since 1970
    
    static func samplePosts() -> [Posts] {
        return [Posts(username: "TheRealDonaldTrump", date: Date(), message: "This Post is definitely, most definitely, the greatest post of all time. Everybody says it! Its true. Dont listen to the fake news"), Posts(username: "WeekendAtBidens", date: Date(), message: "Trudenashabadenadedapressure!!"), Posts(username: "NancyPeelosi", date: Date(), message: "Its Hammer Time"), Posts(username: "MitchyMconnelly", date: Date(), message: "Its very important to save all tortises, those on four legs and two"), Posts(username: "AFetteringMan", date: Date(), message: "mmmm... how did I... who?"), Posts(username: "DrOZZZZZZ", date: Date(), message: "what does the middle class need? More crutete"), Posts(username: "PutinInThePutin", date: Date(), message: "Oops"), Posts(username: "ZelDelInsky", date: Date(), message: "Lol get rekt kek"), Posts(username: "Chief Warren", date: Date(), message: "1/1064 are also the chances of me being able to say something intelligent"), Posts(username: "CuomoBros", date: Date(), message: "We dont have a sexual harrassment problem. Women just cant get enough of us.")]
    }
}



