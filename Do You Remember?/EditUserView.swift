//
//  EditUserView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import SwiftUI

struct EditUserView: View {
    @Binding var user: User
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Names e.g. 'Tom & Hailey'", text: $user.homeTitle)
                    Text(user.imageName)
                }
                
                Section {
                    DatePicker("Since when are you together?", selection: $user.beginDate, in: ...Date(), displayedComponents: .date)
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
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(user: .constant(User()))
    }
}
