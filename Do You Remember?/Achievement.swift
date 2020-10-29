//
//  Achievement.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 26.10.20.
//

import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    var title = "Achievement"
    var description = "Description Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    var finished = false
    var maxProgress = 200.0
    var currentProgress = 100.0
    var points = 100
}
