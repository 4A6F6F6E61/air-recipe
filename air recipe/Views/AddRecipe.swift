//
//  AddRecipe.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

struct AddRecipe: View {
    @State var nameTextField: String = ""
    @State var ingredientsTextField: String = ""
    @State var instructionsTextField: String = ""
    @EnvironmentObject var firebaseUtils: FirebaseUtils
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let db = Firestore.firestore();
    
    var body: some View {
        ScrollView {
            Column {
                TextField("Name", text: $nameTextField)
                    .autocorrectionDisabled(true)
                    .padding(18)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                TextField("Ingredients", text: $ingredientsTextField, axis: .vertical)
                    .autocorrectionDisabled(true)
                    .padding(18)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .lineLimit(5...10)
                TextField("Instructions", text: $instructionsTextField, axis: .vertical)
                    .autocorrectionDisabled(true)
                    .padding(18)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .lineLimit(4...8)
                Button {
                    add()
                } label: {
                    Text("Done")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(14)
        }
        .navigationTitle("Add Recipe")
    }
    
    private func add() {
        if (instructionsTextField.isEmpty ||
            nameTextField.isEmpty ||
            ingredientsTextField.isEmpty) {
            print("Empty Fields")
            return
        }
        var ref: DocumentReference? = nil
        ref = db.collection("Users").document(Auth.auth().currentUser?.uid ?? "bX7sxdJs0sO7WXsM75QDV8uKrPz2").collection("Recipes").addDocument(data: [
            "name": nameTextField,
            "ingredients": ingredientsTextField,
            "instructions": instructionsTextField
        ]) { error in
            guard error == nil else {
                print(error as Any)
                return
            }
            firebaseUtils.recipes.append(Recipe(id: ref!.documentID, name: nameTextField, ingredients: ingredientsTextField, instructions: instructionsTextField))
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddRecipe()
                .environmentObject(FirebaseUtils())
        }
    }
}
