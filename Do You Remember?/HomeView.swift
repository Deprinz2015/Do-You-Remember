//
//  HomeView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct HomeView: View {
    @State private var user = User(level: 1, progress: 0, beginDate: Date())
    
    var imageName = "couple"
    var title = "My Love"
    var levelText = "You are on Level 2!"
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    ZStack(alignment: .bottom) {
                        Image(user.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: geo.size.height / 2)
                        
                        Color.black
                            .frame(height: 75)
                            .opacity(0.6)
                        
                        Text(user.formattedDate)
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text("You are on Level \(user.level)!")
                        .font(.title)
                        .padding()
                    
                    LabeledProgressView(title: "Level \(user.level + 1):", value: Float(user.progress), min: Float(user.progressForLastLevel), max: Float(user.progressForNextLevel))
                        .padding()
                    
                    Spacer()
                    
                    Button("Add 200 Points (For Debugging only)") {
                        self.user.progress += 200
                    }
                }
                .navigationTitle(title)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
