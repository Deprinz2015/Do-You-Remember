//
//  HomeView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

struct HomeView: View {
    
    var imageName = "couple"
    var title = "My Love"
    var levelText = "You are on Level 2!"
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    ZStack(alignment: .bottom) {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: geo.size.height / 2)
                        
                        Color.black
                            .frame(height: 75)
                            .opacity(0.6)
                        
                        Text("13.02.2018")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text(levelText)
                        .font(.title)
                        .padding()
                    
                    LabeledProgressView(title: "Level 3:", value: 4300, max: 5000, leftLabel: "4300", rightLabel: "5000")
                        .padding()
                    
                    Spacer()
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
