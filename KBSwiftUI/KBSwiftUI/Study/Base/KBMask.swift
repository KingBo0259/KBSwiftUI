//
//  KBMask.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBMask : View {
    var body: some View {
        VStack{
            Image("happy")
                .resizable()
                .frame(width: 300, height: 120)
                .mask(Text("WAV")
                    .font(Font.system(size:120).weight(.black))).background(Color.red)
            Text("Image Blur").blur(radius: 1)
        }
     
       
    }
}

#if DEBUG
struct KBMask_Previews : PreviewProvider {
    static var previews: some View {
        KBMask()
    }
}
#endif
