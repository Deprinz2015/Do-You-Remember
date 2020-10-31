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
                
                Section {
                    Button("Add 200 Points (For Debugging only)") {
                        self.user.progress += 200
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
