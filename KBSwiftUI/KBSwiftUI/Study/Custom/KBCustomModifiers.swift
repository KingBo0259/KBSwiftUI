//
//  KBCustomModifiers.swift
//  KBSwiftUI
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-custom-modifiers
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBPrimaryLabel:ViewModifier {
    func body(content:  Content) -> some View{
        content.padding()
               .background(Color.red)
               .foregroundColor(.white)
               .font(.largeTitle)
    }
}

struct KBCustomModifiers : View {
    var body: some View {
        Text("Custom style").modifier(KBPrimaryLabel())
    }
}

#if DEBUG
struct KBCustomModifiers_Previews : PreviewProvider {
    static var previews: some View {
        KBCustomModifiers()
    }
}
#endif
