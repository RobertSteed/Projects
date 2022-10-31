//
//  FoodTableViewController.swift
//  mealTracker
//
//  Created by Robert Steed on 10/25/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        return [Meal (name: "Breakfast", food: [Food(name: "Cereal", description: "Frosted Flakes"), Food(name: "Orange Juice", description: "Freshly Squeezed"), Food(name: "Waffles", description: "Best Breakfast Item")]),
                      Meal (name: "Lunch", food: [Food(name: "Sandwich", description: "Ham and Cheese"), Food(name: "Dr Pepper", description: "23 flavors"), Food (name: "Doritos Dinamite ", description: "Better than Takkis")]),
                            
                            Meal (name: "Dinner", food: [Food(name: "Steak", description: "Rare and Juicy"), Food(name: "Baked Broccoli", description: "slighty crispy"), Food(name: "Water", description: "Cold and Crisp")] )]
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let food = meals[indexPath.section].food[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(food.name)"
        content.secondaryText = "\(food.description)"
        cell.contentConfiguration = content
        

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}

