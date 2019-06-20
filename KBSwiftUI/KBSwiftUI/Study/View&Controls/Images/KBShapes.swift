//
//  KBShapes.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBShapes : View {
    var body: some View {
        VStack{
            Circle()
                .fill(Color.red)
                .frame(width:150,height:150)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width:150,height: 150)
        
            Text("hello ")
                .background(Rectangle()
                .fill(Color.red)
                .frame(width:100,height:20)
            )
        
            
        }
     
        
    }
}

#if DEBUG
struct KBShapes_Previews : PreviewProvider {
    static var previews: some View {
        KBShapes()
    }
}
#endif
