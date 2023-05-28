//
//  Recipe.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI

struct Recipe: Identifiable {
    var id          : String
    var name        : String
    var ingredients : String
    var instructions: String
    
    static func fromFirestore(json: [String: Any]) -> Recipe {
        return Recipe(
            id: json["id"] as? String ?? UUID().uuidString,
            name: json["name"] as? String ?? "",
            ingredients: json["ingredients"] as? String ?? "",
            instructions: json["instructions"] as? String ?? ""
        )
    }
}
