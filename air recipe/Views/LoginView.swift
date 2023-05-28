//
//  LoginView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI

struct LoginView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    var body: some View {
        ScrollView {
            Column {
                TextField("Email", text: $emailTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                TextField("Passowrd", text: $passwordTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                Button {
                    // login
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
    }}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
