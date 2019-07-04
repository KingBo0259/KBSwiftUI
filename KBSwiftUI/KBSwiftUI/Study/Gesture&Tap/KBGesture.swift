//
//  KBGesture.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI


struct KBDragView : View {
    var body:some View {
        
    }
}

struct KBGesture : View {
    @State private var  scale:Length = 1.0
    @State private var longScale:Length = 1.0
  
    var body: some View {
        VStack {
                Group{
                    Image("happy")
                        .scaleEffect(scale)
                        .gesture(
                            TapGesture()
                                .onEnded { _ in
                                    self.scale += 0.1
                            }
                    )
                    
                    Text("tap Gesture, Scale:\(self.scale)")
                }
                Group{
                    Image("happy")
                        .gesture(
                                LongPressGesture(minimumDuration: 2, maximumDistance: 6)
                                    .onEnded { _ in
                                        self.longScale += 0.1
                                }
                            )
                    
                    Text("longPress  Gesture, Scale:\(self.longScale)")
                }
            
                Group{
                    Image("happy")
                        .gesture(
                            DragGesture(minimumDistance: 50)
                                .onEnded { _ in
                                    print("Dragged!")
                            }
                    )
                    
                    Text("Drag  Gesture")
                }
            }
        }
    
}

#if DEBUG
struct KBGesture_Previews : PreviewProvider {
    static var previews: some View {
        KBGesture()
    }
}
#endif
