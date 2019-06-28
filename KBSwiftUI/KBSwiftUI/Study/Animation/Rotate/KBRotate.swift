//
//  KBRotate.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBRotate : View {
    @State var routation :Double = 0
    @State var moveX : Length = 0
    
    var body: some View {
        VStack(spacing:50){
            Text("UP we go").rotationEffect(.degrees(-30))
            Text("UP we go").rotationEffect(.degrees(+30))
            Text("UP we go").rotationEffect(.radians(.pi))
        Text("Slider:\(routation)").rotationEffect(.degrees(routation))
            
            Slider(value: $routation, from: 0, through: 360, by: 1.0).padding()
            
            Text("EPISODE LLVM ")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .rotation3DEffect(.degrees(40), axis: (x: 1, y: 0, z: 1))
            
            
            Text("Move")
                .offset(x: moveX)
                .animation(.spring())
              Slider(value: $moveX, from: -360, through: 360, by: 10.0).padding()
        }


    }
}

#if DEBUG
struct KBRotate_Previews : PreviewProvider {
    static var previews: some View {
        KBRotate()
    }
}
#endif
