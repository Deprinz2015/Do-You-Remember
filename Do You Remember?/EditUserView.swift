//
//  EditUserView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import SwiftUI

struct EditUserView: View {
    var user = User(level: 2, progress: 4300, beginDate: Date())
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView()
    }
}
