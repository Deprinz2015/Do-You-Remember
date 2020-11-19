//
//  EditUserView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import SwiftUI

struct SettingsView: View {
    @Binding var user: User
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Names e.g. 'Tom & Hailey'", text: $user.homeTitle)
                    Text(user.imageName)
                }
                
                Section {
                    DatePicker("When did you get together?", selection: $user.beginDate, in: ...Date(), displayedComponents: .date)
                }
                
                if user.level >= 4 {
                    Section {
                        Button("Memories") {
                            print("Redirect to memories")
                        }
                    }
                }
                
                Section(header: Text("For debugging purposes")) {
                    Button("Add 200 Points") {
                        self.user.progress += 200
                    }
                    Button("Reset Points") {
                        self.user.progress = 0
                        self.user.level = 1
                    }
                    Button("Reset Everything") {
                        self.user.reset()
                        UserDefaults.standard.setValue(true, forKey: "ResetAchievements")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(user: .constant(User()))
    }
}
