//
//  DogViewController.swift
//  API Project
//
//  Created by Robert Steed on 12/7/22.
//

import UIKit

class DogViewController: UIViewController {
    
    struct DogResponse: Codable {
      let message: String
      let status: String
    }

    enum DogItemError: Error, LocalizedError {
        case imageNotFound
        case imageDataMissing
    }
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonPressed(_ sender: Any) {
        Task {
             let response = try await fetchDogResponse()
             let image = try await fetchImage(from: URL(string: response.message)!)
             dogImageView.image = image
           }
    }
    

    func fetchDogResponse() async throws -> DogResponse {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
         throw DogItemError.imageDataMissing
        }
        let decoder = JSONDecoder()
        return try decoder.decode(DogResponse.self, from: data)
      }
    
    
    
      func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
         throw DogItemError.imageDataMissing
        }
        //
        guard let image = UIImage(data: data) else {
         throw DogItemError.imageDataMissing
        }
        return image
       }
    
    
}
