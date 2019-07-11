//
//  KBBasicForm.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBBasicForm : View {
    @State var enableLogging = false
    
    @State var selectedColor = 0
    @State var colors = ["Red", "Green", "Blue"]
    @State var username :String=""
    var body: some View {
        Form {
            Text("please see here:  https://www.hackingwithswift.com/quick-start/swiftui/basic-form-design")
            Text("我的beta 版本好像无法识别Form 关键字 ")
            SegmentedControl(selection: $selectedColor) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0]).tag($0)
                }
            }
            
            Toggle(isOn: $enableLogging) {
                Text("Enable Logging")
            }
            
            Button(action: {
                // activate theme!
            }) {
                Text("Save changes")
            }
            Spacer()
            TextField("hello", text: $username)
            TextField("hello", text: $username)

            Group{
                TextField("hello", text: $username)
                TextField("hello", text: $username)
                TextField("hello", text: $username)
                TextField("hello", text: $username)
                TextField("hello", text: $username)
                TextField("hello", text: $username)
            }
         
        }
    }
}

#if DEBUG
struct KBBasicForm_Previews : PreviewProvider {
    static var previews: some View {
        KBBasicForm()
    }
}
#endif
