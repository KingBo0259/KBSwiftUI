//
//  KBTextField.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBTextField : View {
    @State var username :String = ""
    @State var password :String = ""
    var body: some View {
        VStack {
            Group{
                TextField($username,placeholder: Text("please  input username"))
                
                TextField($username,placeholder: Text("please  input password")).textFieldStyle(.plain)
               
                SecureField($password,placeholder: Text("Please input password"))
                    .textFieldStyle(.roundedBorder)
                
                  TextField($password,placeholder: Text("please  input password")).textFieldStyle(.roundedBorder)
                
              
             
            }.padding()
         
        }.padding()
    }
}

#if DEBUG
struct KBTextField_Previews : PreviewProvider {
    static var previews: some View {
        KBTextField()
    }
}
#endif
