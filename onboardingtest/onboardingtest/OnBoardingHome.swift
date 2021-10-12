//
//  OnBoardingHome.swift
//  onboardingtest
//
//  Created by kamil on 15.09.2021.
//

import SwiftUI

struct OnBoardingHome: View {
    @StateObject var model = ModelView()
    @State var current = 0
    @State var show = false
    @Namespace var animations
    init() {
        UITableView.appearance().bounces = false
    }
    var body: some View {
        ZStack {
        VStack {
            HStack {
                
            if model.currentStep >= 1 {
                Button(action: {
                    model.removeStep(step: model.currentStep)
                    if (model.currentStep - 1  >= 0) {
                        model.currentStep -= 1
                    } else {
                        model.currentStep = 0
                    }
                }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 20, height: 27)
                    .foregroundColor(.black)
                }
                Spacer()
            } else {
                Button(action: {
                    model.removeStep(step: model.currentStep)
                    if (model.currentStep - 1  >= 0) {
                        model.currentStep -= 1
                    } else {
                        model.currentStep = 0
                    }
                }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 20, height: 27)
                    .foregroundColor(.white)
                }
                Spacer()
                    
            }
            }.padding(.leading,20)
            .padding(.top)
            
            TabView(selection: $model.currentStep) {
            ForEach(0..<model.onBoarding.count) { data in
                VStack {
                    Image(model.onBoarding[data].image)
                        .resizable()
                        .frame(width: 250, height: 250)
                    VStack(spacing: 10) {
                    Text(model.onBoarding[data].title)
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                    Text(model.onBoarding[data].subtitle)
                        .font(.callout)
                        .fontWeight(.light)
                    }
                }.tag(data)
            }
            }.padding()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut) // 2
                    .transition(.slide)
            ZStack {
            StrokedRectangle().environmentObject(model)
                Button(action: {
                    if self.model.currentStep < model.onBoarding.count - 1 {
                    model.currentStep += 1
                    } else {
                    }
                    model.appendStep()
                    
                }) {
                    
                    if model.currentStep == 2 {
                        Button(action: {
                            show.toggle()
                        }) {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .animation(.easeOut(duration: 0.5))
                        }
                    } else {
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .animation(.easeOut(duration: 0.5))
                    }
                }.padding(.bottom, 35)
            }.padding()
        }.opacity(show ? 0 : 1)
            if show {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    Welcome(animation: animations, show: $show)
                        .matchedGeometryEffect(id: "id", in: animations)
                }
                
            }
        }
       
}
}


struct Welcome: View {
    var animation: Namespace.ID
    @Binding var show: Bool
    var body: some View {
        VStack {
        Text("Welcome")
            .font(.title2)
            .matchedGeometryEffect(id: "id", in: animation)
        }
            
    }
}

struct OnBoardingHome_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHome()
    }
}


struct StrokedRectangle: View {
    @EnvironmentObject var model: ModelView
    let animationDuration: TimeInterval = 0.5
    var body: some View {
        VStack {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .foregroundColor(.gray)
                .opacity(0.1)
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.35, to: 0.72)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .foregroundColor(.yellow)
            
            //48
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.18, to: model.passedStep.contains(1) ? 0.48 : 0.18)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .animation(Animation.easeInOut(duration: animationDuration))
                .foregroundColor(.yellow)
            // 0.25
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.01, to: model.passedStep.contains(2) ? 0.25 : 0.01)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotation3DEffect(
                    .degrees(0),
                    axis: (x: 1, y: 1.0, z: 0.0)
                )
                .rotationEffect(.degrees(180))
                .animation(Animation.easeInOut(duration: animationDuration))
                .foregroundColor(.yellow)
                
            
            
        }.frame(width: 200, height: 65)
            
            
            Button(action: {
                
            }) {
                Text("Skip")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }.padding(.top, 5)
        }
    }
}
