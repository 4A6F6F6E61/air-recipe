//
//  HomeView.swift
//  air recipe
//
//  Created by Joona Brückner on 2023-05-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseUtils())
    }
}
