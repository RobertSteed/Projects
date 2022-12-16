//
//  API Code.swift
//  API Project
//
//  Created by Robert Steed on 12/7/22.
//

import Foundation

class RepresentativeDataCollecter {
    
    struct DogImage {
        var message: String
        var status: String
    }
    
    
    
    struct RepresentativeResponse: Codable {
        var results: [Rep]
    }
    
    struct Rep: Codable {
        var name: String
        var party: String
        var state: String
        var link: String
    }
    
    enum RepresentativeItemError: Error, LocalizedError {
        case  itemDataMissing
    }
    
    func fetchRepresentativeResponse(zip: String) async throws -> [Rep] {
        let url = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(zip)&output=json")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RepresentativeItemError.itemDataMissing
        }
        let decoder = JSONDecoder()
        var responseRep = try decoder.decode(RepresentativeResponse.self, from: data)
        return responseRep.results
    }
    
    func fetchData(from url: URL) async throws -> String {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RepresentativeItemError.itemDataMissing
        }
        
        guard let answer = String(data: data, encoding: .utf8) else {
            throw RepresentativeItemError.itemDataMissing
        }
        return answer
    }
}
//
//    let dog = Dog(name: "Rex", owner: "Etgar")
//
//    let jsonEncoder = JSONEncoder()
//    let jsonData = try jsonEncoder.encode(dog)
//    let json = String(data: jsonData, encoding: String.Encoding.utf16)
//
//    // Decode
//    let jsonDecoder = JSONDecoder()
//    let secondDog = try jsonDecoder.decode(Dog.self, from: jsonData)

