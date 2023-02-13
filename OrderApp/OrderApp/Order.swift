//
//  Order.swift
//  OrderApp
//
//  Created by Robert Steed on 12/21/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
