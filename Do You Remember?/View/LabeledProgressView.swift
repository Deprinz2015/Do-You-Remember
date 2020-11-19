//
//  LabeledProgressView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 27.10.20.
//

import SwiftUI

struct LabeledProgressView: View {
    var title = ""
    var value: Float
    var min: Float = 0.0
    var max: Float
    var leftLabel: String?
    var rightLabel: String?
    
    var body: some View {
        VStack {
            ProgressView(title, value: value - min, total: max - min)
            HStack {
                if let leftLabel = leftLabel {
                    Text(leftLabel)
                }
                else {
                    Text("\(value, specifier: "%g")")
                }
                
                Spacer()
                
                if let rightLabel = rightLabel {
                    Text(rightLabel)
                }
                else {
                    Text("\(max, specifier: "%g")")
                }
            }
        }
    }
}

struct LabeledProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LabeledProgressView(title: "Level 3:", value: 100, min: 50, max: 200)
    }
}
