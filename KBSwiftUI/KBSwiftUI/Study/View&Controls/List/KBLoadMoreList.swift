//
//  KBLoadMoreList.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBLoadMoreList : View {
    @State private var datas = [String](repeating: "row1", count: 20)
    
    
 
    
    var body: some View {
        List{
            ForEach(datas.identified(by: \.self)){
                Text($0)
            }
            Button(action: {
              
            }) {
                Text("load more")
                }.onAppear(){
                    print("onAppear")
                    DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 10)) {
                        self.loadMore()
                    }
                }.onDisappear(){
                     print("onDisAppear")
            }
        }
    }
    
    func loadMore() {
        guard self.datas.count <= 50 else {
            return
        }
        let array = [String](repeating: "Load more", count: 10)
        self.datas.append(contentsOf: array)
    }
}

#if DEBUG
struct KBLoadMoreList_Previews : PreviewProvider {
    static var previews: some View {
        KBLoadMoreList()
    }
}
#endif
