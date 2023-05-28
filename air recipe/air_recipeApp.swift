//
//  air_recipeApp.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

@main
struct air_recipeApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
