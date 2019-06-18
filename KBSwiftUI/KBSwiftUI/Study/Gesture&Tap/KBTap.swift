//
//  KBTap.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBTap : View {
    @State private  var textValue = "Tap me once"
    @State private var  secondTexTValue = "Tap me twice"
    var body: some View {
        VStack {
            Group{
                Text(self.textValue)
                    .tapAction {
                        self.textValue = "I have be tap "
                }
                
                Text(self.secondTexTValue)
                    .tapAction(count: 2) {
                        self.secondTexTValue = " I haveg be tap twice"
                }
            }.padding()
        }
    }
}

#if DEBUG
struct KBTap_Previews : PreviewProvider {
    static var previews: some View {
        KBTap()
    }
}
#endif
