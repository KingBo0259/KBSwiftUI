//
//  KBSlider.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSlider : View {
    @State var celsius :Double = 0
    var body: some View {
        VStack{
            Slider(value: $celsius, from: 0.0, through: 100, by: 1)
            Text("current value :\(celsius)")
        }
    }
}

#if DEBUG
struct KBSlider_Previews : PreviewProvider {
    static var previews: some View {
        KBSlider()
    }
}
#endif
