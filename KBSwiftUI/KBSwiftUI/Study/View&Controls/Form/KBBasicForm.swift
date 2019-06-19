//
//  KBBasicForm.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBBasicForm : View {
    var body: some View {
        VStack {
            Text("please see here:  https://www.hackingwithswift.com/quick-start/swiftui/basic-form-design")
            Text("我的beta 版本好像无法识别Form 关键字 ")
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
