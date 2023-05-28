//
//  FirebaseUtils.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

class FirebaseUtils: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var userSession: FirebaseAuth.User?
    //@Published var currentUser: User?
    
    init() {
        fetchRecipes()
        userSession = Auth.auth().currentUser
    }
    
    func fetchRecipes() {
        recipes.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(Auth.auth().currentUser?.uid ?? "bX7sxdJs0sO7WXsM75QDV8uKrPz2").collection("Recipes")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    var data = document.data()
                    data.updateValue(document.documentID, forKey: "id")
                    self.recipes.append(
                        Recipe.fromFirestore(json: data)
                    )
                }
            }
        }
    }
    func signOut() {
        // sets user session to nil so we show login view
        self.userSession = nil
        
        // signs user out on server
        try? Auth.auth().signOut()
    }

}
