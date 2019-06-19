//
//  KBAlertView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBAlertView : View {
    @State var showingAlert = false
    var body: some View {
        VStack {
//            Text("我是测试alert").presentation($showingAlert) { () -> Alert in
//                Alert(title: Text("I am present message 2"), message: Text("wear sunscreen2"), dismissButton: .default(Text("Got it!")))
//                }
            
            Button(action: {
                self.showingAlert = true
            }) {
                Text("show Alert")
                }.presentation($showingAlert) { () -> Alert in
                    //由于第一个存在。这里就不会被触发
                    Alert(title: Text("I am present message"), message: Text("wear sunscreen"), primaryButton: .default(Text("Got it!")),secondaryButton: .cancel())
            }
        }
        
    }
}

#if DEBUG
struct KBAlertView_Previews : PreviewProvider {
    static var previews: some View {
        KBAlertView()
    }
}
#endif
