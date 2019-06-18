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
