//
//  KBStaticList.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI


struct KBStaticList : View {
    var body: some View {
        List{
            Text("row 1")
            Text("row 2")
            Text("row 3")
        }
      
    }
}

#if DEBUG
struct KBStaticList_Previews : PreviewProvider {
    static var previews: some View {
        KBStaticList()
    }
}
#endif
