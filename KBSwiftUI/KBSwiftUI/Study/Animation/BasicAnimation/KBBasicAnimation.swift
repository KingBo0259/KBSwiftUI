//
//  KBBasicAnimation.swift
//  KBSwiftUI
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-basic-animation
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBBasicAnimation : View {
    @State var angle : Double = 0
    @State var borderThickNess : Length = 1
    
    var body: some View {
        Button(action: {
            self.angle += 45
            self.borderThickNess += 1
        }) {
            Text("Tap here")
                .padding()
                .border(Color.red,width: borderThickNess)
                .rotationEffect(.degrees(angle))
                .animation(.basic(duration: 3, curve: .easeOut))
        }
    }
}

#if DEBUG
struct KBBasicAnimation_Previews : PreviewProvider {
    static var previews: some View {
        KBBasicAnimation()
    }
}
#endif
