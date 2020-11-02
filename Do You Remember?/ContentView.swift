//
//  ContentView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        TabView {
            HomeView(user: user)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AchievementsView(user: $user)
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("Achievements")
                }
            
            StatisticsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Statistics")
                }
            
            EditUserView(user: $user)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
