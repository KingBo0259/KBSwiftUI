//
//  KBDartAndLightMode.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBDartAndLightMode : View {
   
    var body: some View {
        Text("Mode Change")
    }
}

#if DEBUG
struct KBDartAndLightMode_Previews : PreviewProvider {
    static var previews: some View {
        Group{
             KBDartAndLightMode()
                    .environment(\.colorScheme,.light)
            
            KBDartAndLightMode()
                .environment(\.colorScheme,.dark)
        }
       
    }
}
#endif
