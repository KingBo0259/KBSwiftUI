//
//  KBSpringAnimation.swift
//  KBSwiftUI
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-spring-animation
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSpringAnimation : View {
    @State var showingWelcome = false
    
    @State var angle:Double = 0
    @State var opacity :Double = 1
    var body: some View {
        VStack{
            Toggle(isOn: $showingWelcome) {
                Text("默认绑定  Toggle Lable")
            }
            Toggle(isOn: $showingWelcome.animation(.basic())) {
                Text("Basic绑定  Toggle Lable")
            }
            
            Toggle(isOn: $showingWelcome.animation(.spring())) {
                Text("Spring动画效果绑定 Toggle Lable")
            }
            
            if  showingWelcome {
                Text("I am toggle")
            }
            
            Button(action: {
                withAnimation {
                    self.opacity -= 0.2
                }
            }) {
                Text("Tap here ").padding().opacity(opacity)
            }
            
            Button(action: {
                self.angle  += 45
            }) {
                Text("Tap here")
                    .padding()
                    .rotationEffect(.degrees(angle))
                    .animation(.spring())
            }
            
            Button(action: {
                self.angle  += 45
            }) {
                Text("Tap here")
                    .padding()
                    .rotationEffect(.degrees(angle))
                    .animation(.spring(mass: 1, stiffness: 1, damping: 0.1, initialVelocity: 2))
            }
        }.padding()
       
    }
}

#if DEBUG
struct KBSpringAnimation_Previews : PreviewProvider {
    static var previews: some View {
        KBSpringAnimation()
    }
}
#endif
