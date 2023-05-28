//
//  WelcomeView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Column {
            Text("1")
            NavigationLink {
                LoginView()
            } label: {
                Text("Login")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            NavigationLink {
                RegisterView()
            } label: {
                Text("Register")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }.padding(14)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}

typealias Stack  = ZStack;
typealias Column = VStack;
typealias Row    = HStack;
