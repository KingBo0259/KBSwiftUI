//
//  ContentView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/13.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var enableLogging = false
    
    @State var selectedColor = 0
    @State var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            Group{
                Text("Line")
                Text("Line")
                Text("Line")
            }
        
            Text("Line")
            Text("Line")
            Text("Line")
            Text("Line")
            Text("Line")
            Text("Line")
            Text("Line")
             Text("Line")//最多只有10个元素排列
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
