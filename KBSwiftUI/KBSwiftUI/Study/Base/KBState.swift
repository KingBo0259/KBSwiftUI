//
//  KBState.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/14.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBState : View {
    @State var randomVale:String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Button(action: {
                arc4random()
                let value = arc4random()%100 + 1
                self.randomVale = "\(value)"
            }) {
                Text("Random Number")
            }.padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
           
            
            Text(randomVale.count>0 ? randomVale :"show random value(1~100)")
            Spacer()
        }.padding()
    }
}

#if DEBUG
struct KBState_Previews : PreviewProvider {
    static var previews: some View {
        KBState()
    }
}
#endif
