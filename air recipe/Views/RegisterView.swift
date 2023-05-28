//
//  RegisterView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var confirmTextField: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            Column {
                TextField("Email", text: $emailTextField)
                    .autocorrectionDisabled(true)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                SecureField("Passowrd", text: $passwordTextField)
                    .autocorrectionDisabled(true)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                SecureField("Confirm Password", text: $confirmTextField)
                    .autocorrectionDisabled(true)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                Button {
                    register()
                } label: {
                    Text("Register")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14).navigationTitle("Register")
        }
    }
    
    private func register() {
        if (passwordTextField != confirmTextField) {
            print("Passwords don't match")
            return
        }
        if (passwordTextField.isEmpty ||
            passwordTextField.isEmpty ||
            confirmTextField.isEmpty) {
            print("Empty Fields")
            return
        }
        Auth.auth().createUser(withEmail: emailTextField, password: passwordTextField) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
