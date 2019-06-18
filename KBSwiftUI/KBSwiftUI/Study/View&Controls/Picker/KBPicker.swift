//
//  KBPicker.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBPicker : View {
    var colors = ["Red","Green","Blue","Black","White"]
    @State private var selectorColor = 0
    var body: some View {
        VStack{
            Picker(selection: $selectorColor, label: Text("Please Choose a Color")) {
                ForEach(0..<colors.count
                ){
                    Text(self.colors[$0]).tag($0)
                }
            }
            Text("You Selected : \(colors[selectorColor])")
        }
    }
}

#if DEBUG
struct KBPicker_Previews : PreviewProvider {
    static var previews: some View {
        KBPicker()
    }
}
#endif
