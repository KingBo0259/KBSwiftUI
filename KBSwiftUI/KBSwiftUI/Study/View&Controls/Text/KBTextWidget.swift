//
//  KBTextWidget.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBTextWidget : View {
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
             Text("I am undlerLine").underline(true,color: .red)
             Text("I am baselineOffset").bold().baselineOffset(2)
            Text("I am baselineOffset").strikethrough()
    
            Text("I am baselineOffset").scaledToFit()
          
            Text("border")
            .padding()
            .border(Color.red,width: 4,cornerRadius: 16)
            //https://www.hackingwithswift.com/quick-start/swiftui/how-to-stack-modifiers-to-create-more-advanced-effects
            Text("Line")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.orange)
                .cornerRadius(6)
                .padding()
                .background(Color.yellow)
                .cornerRadius(8)
            
            Text("shadow")
                .shadow(color: .red, radius: 5, x: 5, y: 5)

        })
    
    }
}

#if DEBUG
struct KBTextWidget_Previews : PreviewProvider {
    static var previews: some View {
        KBTextWidget()
    }
}
#endif
