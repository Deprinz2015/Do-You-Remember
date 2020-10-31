//
//  EditUserView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import SwiftUI

struct EditUserView: View {
    @Binding var user: User
    
    @State private var homeTitle = ""
    @State private var imageName = "couple"
    @State private var beginDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Names", text: $homeTitle)
                    Text(imageName)
                }
                
                Section {
                    DatePicker("Since when are you together?", selection: $beginDate, displayedComponents: .date)
                }
                
                Button("Save") {
                    user.homeTitle = self.homeTitle.isEmpty ? "My Love" : self.homeTitle
                    user.imageName = self.imageName.isEmpty ? "couple" : self.imageName
                    
                    print("In Form: \(self.homeTitle), in user: \(user.homeTitle)")
                    
                    user.beginDate = beginDate
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
