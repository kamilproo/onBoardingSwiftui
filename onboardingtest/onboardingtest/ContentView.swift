//
//  ContentView.swift
//  onboardingtest
//
//  Created by kamil on 15.09.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ModelView()
    var body: some View {
        OnBoardingHome()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


