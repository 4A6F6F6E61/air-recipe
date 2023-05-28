//
//  ContentView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var loggedIn: Bool = false
    
    var body: some View {
        if loggedIn {
            HomeView()
        } else {
            NavigationView {
                WelcomeView()
                    .onAppear {
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil {
                                loggedIn.toggle()
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
