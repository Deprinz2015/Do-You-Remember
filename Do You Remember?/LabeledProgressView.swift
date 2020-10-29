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
    var max: Float
    var leftLabel = ""
    var rightLabel = ""
    
    var body: some View {
        VStack {
            ProgressView(title, value: value, total: max)
            HStack {
                Text(leftLabel)
                Spacer()
                Text(rightLabel)
            }
        }
    }
}

struct LabeledProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LabeledProgressView(value: 100, max: 100)
    }
}
