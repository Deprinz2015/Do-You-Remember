//
//  HomeView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct HomeView: View {
    var user: User
    
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
                }
                .navigationTitle(user.homeTitle.isEmpty ? "My Love" : user.homeTitle)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User())
    }
}
