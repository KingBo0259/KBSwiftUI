//
//  KBViewLifecycleEvents.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBViewLifecycleEvents : View {
    var body: some View {
        NavigationView{
            NavigationButton(destination: KBViewLifeDetailView()) {
                     Text( "点击显示明细")
                    }
                Divider()
                Text("Note: In the current beta onAppear() works great but onDisappear() doesn’t seem to get called.")
                    .lineLimit(5)
                    .foregroundColor(.red)
                    .font(.footnote)
            
            
             
           
            }.onAppear {
                print("first on Appear")
            }.onDisappear {
                print("firs on Disappear")
            }

    }
}


struct KBViewLifeDetailView:View {
    var body: some View {
        VStack{
            Text("Second View")
            Divider()
            Text("Note: In the current beta onAppear() works great but onDisappear() doesn’t seem to get called.")
                .lineLimit(5)
                .foregroundColor(.red)
                .font(.footnote)
            }
            .onAppear {
                  print("Second On Appear")
                }
            .onDisappear {
                 print("Second  on Disappear( 由于beta 版本m，目前不会被触发)")
                }
    }
}
#if DEBUG
struct KBViewLifecycleEvents_Previews : PreviewProvider {
    static var previews: some View {
        KBViewLifecycleEvents()
    }
}
#endif
