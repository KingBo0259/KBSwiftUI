//
//  KBZStack.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBZStack : View {
    var body: some View {
        VStack{
            ZStack{
                Image("happy")
                Text("hacking with swift")
                    .font(.subheadline)
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            
            ZStack(alignment: .bottom){
                Image("happy")
                Text("hacking with swift")
                    .font(.subheadline)
                    .background(Color.black)
                    .foregroundColor(.white)
            
                
            }
        }
      
    }
}

#if DEBUG
struct KBZStack_Previews : PreviewProvider {
    static var previews: some View {
        KBZStack()
    }
}
#endif
