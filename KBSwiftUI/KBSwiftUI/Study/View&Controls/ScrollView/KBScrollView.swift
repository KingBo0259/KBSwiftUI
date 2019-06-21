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
        VStack(spacing:25){
            ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: false, showsHorizontalIndicator: true, showsVerticalIndicator: true){
                HStack{
                    ForEach (1...10) { index   in
                        VStack{
                            Image("happy")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)

                           Text("\(index)")
                                .color(.black)
                                .background(Color.red)
                        }
                        }
                }
            }.frame(height: 150)
         
         
 
            Divider()
            Text("发现Scroll 内容没有填充满整高").color(.gray)
            Divider()
            HStack(spacing: 1) {
            
            GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            ForEach(0..<15) { index in
                                VStack{
                                    Image("happy")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                                    Spacer()
                                    Text("\(index)")
                                        .color(.black)
                                        .background(Color.red)
                                    Spacer()
                                }
                            }
                            }.relativeWidth(1)
                            .frame(width: geometry.size.width)
                    }.frame(height: 250)
                }
            }
            
            Divider()
            
            GeometryReader { geometry in
                ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: false, showsHorizontalIndicator: true, showsVerticalIndicator: true) {
                    HStack {
                        ForEach(0..<15) { index in
                            VStack{
                                Image("happy")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                                Spacer()
                                Text("\(index)")
                                    .color(.black)
                                    .background(Color.red)
                            }
                        }
                        }
                    } .frame(height: 150)
            }
 
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
