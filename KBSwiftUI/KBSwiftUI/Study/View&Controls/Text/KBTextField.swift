//
//  KBTextField.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine
class KBTextFieldModel: BindableObject{
    var didChange = PassthroughSubject<Void,Never>()
    
    var myMaxInput = "" {
        didSet {
            if myMaxInput.count > 6 {
                myMaxInput =  String(myMaxInput.prefix(6))
            }
            didChange.send(())
        }
    }
}

struct KBTextField : View {
    @State var username :String = ""
    @State var password :String = ""
    @ObjectBinding var model = KBTextFieldModel()
 
    var body: some View {
        VStack {
            Group{
                TextField($username,placeholder: Text("please  input username"))
                
                TextField($username,placeholder: Text("please  input password")).textFieldStyle(.plain)
               
                SecureField($password,placeholder: Text("Please input password"))
                    .textFieldStyle(.roundedBorder)
                
                  TextField($password,placeholder: Text("please  input password")).textFieldStyle(.roundedBorder)
                
                  TextField($model.myMaxInput,placeholder: Text("Max Length 6")).textFieldStyle(.roundedBorder)
                
              
             
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
