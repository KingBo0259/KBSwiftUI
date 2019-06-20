//
//  KBTabView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI




struct PlaceForm : View {
    var body: some View {
        List {
            VStack {
                VStack {
                    VStack {
                        Text("Turtle Rock")
                            .font(.title)
                            .color(.black)
                    }
                    HStack {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                    }
                    .padding()
            }
            }.listStyle(.grouped)
        
    }
}


struct KBTabView : View {
    @State private  var tabSelect = 0

    var body: some View {
         TabbedView(selection:$tabSelect) {
            Text("这里为什么Image 和Text 一起布局有问题呢？？ SwiftUI bug？")
               
               .lineLimit(nil) .padding().tabItemLabel(Text("首页").color((self.tabSelect == 0 ? .blue : Color.yellow)))
                .animation(.spring())
                .tag(0)
            
            Text("Tab1")
                .tabItemLabel(Image("tab_home")
                                .resizable())
                .tag(1)
       
             List{
                Text("12 ")
                Text("123")
                }
                .tabItemLabel(Text("tab3"))
                .tag(2)
            
            PlaceForm().tabItemLabel(
                Image(systemName: "bolt.fill")
                ).tag(3)
            
        }
    }
}

#if DEBUG
struct KBTabView_Previews : PreviewProvider {
    static var previews: some View {
        KBTabView()
    }
}
#endif
