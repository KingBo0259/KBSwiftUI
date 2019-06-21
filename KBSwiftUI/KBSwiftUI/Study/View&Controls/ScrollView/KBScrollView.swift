//
//  KBScrollView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBScrollView : View {
    var body: some View {
        VStack{
            ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: false, showsHorizontalIndicator: true, showsVerticalIndicator: true){
                HStack{
                    ForEach (1...10) { index   in
                        ZStack(alignment:.bottom){
                            Image("happy")
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .center)
                            Text("\(index)").color(.black)
                        }
                      
                        
                    }
                }
            }.background(Color.yellow)
            
        }
     
    }
}

#if DEBUG
struct KBScrollView_Previews : PreviewProvider {
    static var previews: some View {
        KBScrollView()
    }
}
#endif
