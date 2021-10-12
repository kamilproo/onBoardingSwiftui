//
//  SwiftUIView.swift
//  onboardingtest
//
//  Created by kamil on 15.09.2021.
//

import SwiftUI

class ModelView: ObservableObject {
    
    @Published var onBoarding: [OnboardingMetaData] = [
    
     
        OnboardingMetaData(image: "p1", title: "Let's start something big together", subtitle: "Here you will find many interesting ideas"),
        OnboardingMetaData(image: "p2", title: "Find best solution for your life", subtitle: "The best trends and examples from life"),
        OnboardingMetaData(image: "p3", title: "Enjoy being your result", subtitle: "Choose what you like and start changing your life")
    
    ]
    
    let animationDuraction: TimeInterval = 0.5
    @Published var animationProgress = false
    @Published var passedStep: [Int] = [0]
    @Published var currentStep = 0 {
        didSet {
            Timer.scheduledTimer(withTimeInterval: animationDuraction + 0.5, repeats: false){ _ in
                self.animationProgress = false
            }
        }
    }
    
    @Published var scale: CGFloat = 0
    @Published var forward = true
    
    
    func appendStep() {
        self.passedStep.append(self.currentStep)
    }
    
    func removeStep(step: Int) {
        self.passedStep = self.passedStep.filter {
            $0 != step
        }
    }
    
    
    
}
