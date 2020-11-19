//
//  ContentView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab = 0
    @State private var user = User()
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView(user: user)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            AchievementsView(user: user)
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("Achievements")
                }.tag(1)
            
            if user.level >= 3 {
                CalendarView(user: user)
                    .tabItem {
                        Image(systemName: "calendar.circle")
                        Text("Calendar")
                    }.tag(2)
            }
            
            StatisticsView(user: user)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Statistics")
                }.tag(3)
            
            SettingsView(user: $user)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(4)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
