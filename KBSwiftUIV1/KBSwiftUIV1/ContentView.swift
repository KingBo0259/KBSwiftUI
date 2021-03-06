//
//  ContentView.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/11.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var enableLogging = false
    @State var selectedColor = 0
    @State var colors = ["Red", "Green", "Blue"]
    @State var multilineText = ""
    
    var body: some View {
        return  NavigationView{
            VStack(alignment:.center) {
                Group{
                    KBMultilineTextView(text: $multilineText)
                        .frame(width:100,height: 60)
                    Button(action: {}) {
                        Text("Tap here")
                    }
                    
                    Text("Hacking with Swift")
                        .background(Color.black)
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(12)
                    
                    //顺序很重要。。。
                    Text("Hacking with Swift")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Text("Line")
                }
                
                Text("Line")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(6)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(8)
                
                Group{
                    
                    Text("Line").padding(.top,15)
                    
                    Text("Line").scaleEffect(2)
                    Text("Line").scaleEffect(x: 1, y: 5)
                    Text("Line2").scaleEffect(2, anchor: UnitPoint(x: 1, y: 0.5))
                    Text("Line")
                }
                
                Text("Line")
                Text("Line")//最多只有10个元素排列
                Stepper(onIncrement: {
                    
                }, onDecrement: {
                    
                }) {
                    Text("Setp")
                }
                Spacer()
            }.background(Color.blue)
                .navigationBarTitle((Text("测试页面12")
                    .color(.red)
                    .font(.largeTitle)
                    .underline()),displayMode: .inline)
            
            //主题颜色设置
        }.background(Image("happy"))
            
            .foregroundColor(Color.pink)
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
