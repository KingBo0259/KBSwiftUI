//
//  KBEnvironmentObject.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBEnvironmentObject : View {
    @EnvironmentObject var settings : KBUserSettings
    @EnvironmentObject var settings1 : KBUserSettings //不论哪个数据 都是绑定到全局 对象之中，会自动全局

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 5){
                Group{
                    Text("EnvironmentObject ,score:\(settings.score)")
                    Text("EnvironmentObject ,score1:\(settings1.score)")
                    
                    Button(action: {
                        self.settings.score += 1
                    }) {
                        Text("increase Score")
                        }
                        .padding()
                        .background(Color.red) //颜色一定要早cornerRadius 之前调用
                        .cornerRadius(12)
                    
                    NavigationButton(destination: KBEnvironmentObjectDetail()) {
                        Text("show  detail View")
                    }.navigationBarTitle(Text("Environment Object"),displayMode: .automatic)
                    
                    }.padding()
                
            }
        }
        
    }
}

struct KBEnvironmentObjectDetail:View {
    @EnvironmentObject var settings :KBUserSettings
    
    var body:some View {
        VStack{
            Group{
                Text("Score: \(settings.score)")
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("increase Score")
                }
            }
        }
    }
}

#if DEBUG
struct KBEnvironmentObject_Previews : PreviewProvider {
    static var previews: some View {
        KBEnvironmentObject().environmentObject(KBUserSettings())
    }
}
#endif
