//
//  ListView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

struct ListView: View {
    @EnvironmentObject var firebaseUtils: FirebaseUtils
    var db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(firebaseUtils.recipes, id: \.id) { recipe in
                    NavigationLink {
                            RecipeView(recipe: recipe)
                    } label: {
                            Text(recipe.name)
                    }
                }
            .onDelete(perform: deleteRecipe)
            }
            .navigationTitle("Recipes")
            .background(.background)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                        AddRecipe()
                    } label: {
                        Label("add", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteRecipe(offsets: IndexSet) -> Void {
        offsets.map {
            let item = firebaseUtils.recipes[$0]
            firebaseUtils.recipes.remove(at: $0)
            return item
        }.forEach({ r in
            db.collection("Users").document(Auth.auth().currentUser?.uid ?? "bX7sxdJs0sO7WXsM75QDV8uKrPz2").collection("Recipes").document(r.id).delete() { error in
                guard error == nil else {
                    firebaseUtils.recipes.append(r)
                    print(error)
                    return
                }
            }
        })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseUtils())
    }
}
