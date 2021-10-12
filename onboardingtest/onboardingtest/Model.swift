//
//  Model.swift
//  onboardingtest
//
//  Created by kamil on 15.09.2021.
//

import SwiftUI


struct OnboardingMetaData: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var subtitle: String
}
