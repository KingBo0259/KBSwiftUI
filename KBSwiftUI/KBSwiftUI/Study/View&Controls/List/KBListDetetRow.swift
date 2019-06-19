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
        NavigationView {
            List{
                ForEach(users.identified(by: \.self)){
                    user in
                    Text(user)
                    }
                    .onDelete(perform:delete)
                    .onMove(perform:move(from:to:))
                
            }.navigationBarItems(trailing: EditButton())
        }
    }
    
    func move(from source:IndexSet, to destination:Int)  {
        // sort the indexes low to high
        let reversedSource = source.sorted()
        // then loop from the back to avoid reordering problems
        for index in reversedSource.reversed() {
            // for each item, remove it and insert it at the destination
         
            users.insert(users.remove(at: index), at: destination)
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
