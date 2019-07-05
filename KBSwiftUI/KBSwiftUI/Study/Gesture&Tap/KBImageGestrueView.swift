//
//  KBImageGestrueView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/7/5.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBImageGestrueView : View {
    @State var scaleEffect :Length = 1.0
    @State var angle : Angle = Angle(degrees: 0)
    var body: some View {
        VStack {
            Group{
                Text("放大/缩小(MagnificationGesture)")
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaleEffect(scaleEffect)
                    .gesture(
                        MagnificationGesture(minimumScaleDelta: 0.1)
                            .onChanged({ (value) in
                                print("onChange:\(value)")
                                withAnimation {
                                    self.scaleEffect = value >= 1.0 ?value :1.0
                                }
                            }).onEnded({ (value) in
                                withAnimation {
                                    self.scaleEffect = 1.0
                                }
                            })
                        )
            }
            
            Group{
                Text("旋转(RotationGesture)")
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .rotationEffect(angle)
                    .gesture(RotationGesture().onChanged({ (angle) in
                        print(angle)
                        self.angle = angle
                        
                    }))
            }
          
        }
      
    }
}

#if DEBUG
struct KBImageGestrueView_Previews : PreviewProvider {
    static var previews: some View {
        KBImageGestrueView()
    }
}
#endif
