//
//  KBListDetetRow.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBListDetetRow : View {
    @State var users = ["Kingbo","Paul","Anglelababay","Cocoachina"]
    var body: some View {
        List{
            ForEach(users.identified(by: \.self)){
                user in
                Text(user)
                }.onDelete(perform:delete)
        }
    }
    
    
    func delete(at offsets:IndexSet)  {
        if let first = offsets.first {
            users.remove(at: first)
        }
    }
}

#if DEBUG
struct KBListDetetRow_Previews : PreviewProvider {
    static var previews: some View {
        KBListDetetRow()
    }
}
#endif
