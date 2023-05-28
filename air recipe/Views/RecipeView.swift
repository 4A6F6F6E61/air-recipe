//
//  RecipeView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

struct RecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var firebaseUtils: FirebaseUtils
    @State var ingTextField: String
    @State var insTextField: String
    @State var editIng: Bool = false
    @State var editIns: Bool = false
    @State var edited: Bool = false
    
    init(recipe: Recipe) {
        self.recipe = recipe
        ingTextField = recipe.ingredients
        insTextField = recipe.instructions
    }
    
    var body: some View {
        ScrollView {
            Column {
                Row {
                    TextField("Ingredients", text: $ingTextField, axis: .vertical)
                        .autocorrectionDisabled(true)
                        .disabled(!editIng)
                    Button {
                        if (self.editIng) {
                            doneIng()
                        }
                        self.editIng.toggle()
                    } label: {
                        Text(editIng ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                            .foregroundColor(Color.blue)
                    }
                }   .padding(17)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                Row {
                    TextField("Instructions", text: $insTextField, axis: .vertical)
                        .autocorrectionDisabled(true)
                        .disabled(!editIns)
                    Button {
                        if (self.editIns) {
                            doneIns()
                        }
                        self.editIns.toggle()
                    } label: {
                        Text(editIns ? "Done" : "Edit").font(.system(size: 20)).fontWeight(.light)
                            .foregroundColor(Color.blue)
                    }
                }   .padding(17)
                    .background(.regularMaterial)
                    .cornerRadius(10)
            }
            .padding(14)
        }
        .navigationTitle(recipe.name)
        .onDisappear {
            if edited {
                firebaseUtils.fetchRecipes()
            }
        }
    }
    
    private func doneIng() {
        let db = Firestore.firestore()
        let ref = db.collection("Recipes").document(recipe.id)
        ref.setData(["ingredients": ingTextField], merge: true)
        edited = true
    }
    private func doneIns() {
        let db = Firestore.firestore()
        let ref = db.collection("Recipes").document(recipe.id)
        ref.setData(["instructions": insTextField], merge: true)
        edited = true
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeView(
                recipe: Recipe(
                    id: "0",
                    name: "Test Name",
                    ingredients: """
                    Test Ingredients
                    jajaja
                    """,
                    instructions: "Test Instructions"
                )
            )
        }
            .environmentObject(FirebaseUtils())
    }
}
