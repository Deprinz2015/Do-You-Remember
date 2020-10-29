//
//  ContentView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AchievementsView()
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("Achievements")
                }
            
            Text("Statistics")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Statistics")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
