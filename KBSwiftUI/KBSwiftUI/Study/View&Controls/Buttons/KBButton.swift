//
//  KBButton.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBButton : View {
    var body: some View {
        VStack {
            Group {
                Button(action: {
                    print("click")
                }){
                    Text("Simple Button")
                }
                Divider()
                
                
                Button(action: {
                    print("click")
                }){
                    Text("Gradient Button")
                }.padding()
                    .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue,.yellow,.pink]), startPoint: .leading, endPoint: .trailing), cornerRadius: 5)
                Divider()
                
                Button(action: {
                    print("click")
                }){
                    Text("shadow Button")
                    }.padding()
                    .background(Color.pink)
                    .cornerRadius(12)
                    .shadow(color: Color.black, radius: 13, x: 5, y: 5)
                
                Divider()
                
                Button(action: {
                    
                }) {
                    Text("Image background")
                    }
                    .foregroundColor(.red)
                    .padding().background(Image("happy").resizable())
                Divider()
                
                Button(action: {
                    
                }) {
                    Text("填满整行")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
                    .background(Color.yellow)
                    .cornerRadius(12)
                    .padding()
            }
            
            Group{
                Button(action: {
                    
                }) {
                    HStack{
                          Image(systemName: "tortoise.fill")
                         Text("左边图片")
                    }
                }.padding()
                .foregroundColor(.white)
                .background(Color.purple)
                
                
                Button(action: {
                    
                }) {
                    VStack{
                        Image(systemName: "hare.fill")
                        Text("上图下文字")
                    }
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                
                Button(action: {
                    
                }) {
                    HStack{
                         Text("右图左文字")
                        Image(systemName: "person.icloud")
                       
                    }
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                
                Button(action: {
                    
                }) {
                    HStack{
                        Text("右图做文字")
                        Image(systemName: "moon.fill")
                        
                    }
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                
            }
        }
       
    }
}

#if DEBUG
struct KBButton_Previews : PreviewProvider {
    static var previews: some View {
        KBButton()
    }
}
#endif
