//
//  KBSectionList.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSectionList : View {
    var body: some View {
        List{
            Text("I am baselineOffset")
             Text("I am baselineOffset1")
            Section(header: Text("12")) {
                KBSectionRow()
            }
 
            Section(header: Text("section1 ")) {
                ForEach (0..<5){ _ in
                     KBSectionRow()
                }
            }
            Section(header: Text("section2"),footer: Text("Section2 footer")) {
                KBSectionRow()
                KBSectionRow()
                KBSectionRow()
                KBSectionRow()
            }
 
        }.listStyle(.grouped)
    }
}

struct KBSectionRow :View{
    var body:some View{
        Text("Row ")
    }
}

#if DEBUG
struct KBSectionList_Previews : PreviewProvider {
    static var previews: some View {
        KBSectionList()
    }
}
#endif
