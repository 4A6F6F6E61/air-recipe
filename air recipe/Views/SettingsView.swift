//
//  SettingsView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var firebaseUtils: FirebaseUtils
    var body: some View {
        NavigationView {
            List {
                Button {
                    firebaseUtils.signOut()
                } label: {
                    Text("Sign out")
                }
            }
                .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(FirebaseUtils())
    }
}
