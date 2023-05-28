//
//  LoginView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            Column {
                TextField("Email", text: $emailTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                SecureField("Passowrd", text: $passwordTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                Button {
                    login()
                } label: {
                    Text("Login")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14).navigationTitle("Login")
        }
    }
    private func login() {
        if (passwordTextField.isEmpty ||
            passwordTextField.isEmpty) {
            print("Empty Fields")
            return
        }
        Auth.auth().signIn(withEmail: emailTextField, password: passwordTextField) { result, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
