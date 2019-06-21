//
//  KBLoginPage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBLoginPage : View {
    @State var username:String = ""
    @State var password:String = ""
    var body: some View {
        VStack{
             ImageStore.shared.image(name: "charleyrivers_feature", size: 200)
                  .cornerRadius(50)
                  .padding()
            
            
            Group {
                HStack(alignment:.center){
                    Image(systemName: "person")
                    TextField($username,placeholder: Text("Please enter you  username"))
                        .textFieldStyle(.roundedBorder).padding(.trailing,32)
                }.padding(.bottom,10)
             
                Group{
                    HStack{
                        Image(systemName: "lock")
                        SecureField($password, placeholder: Text("Please enter you password"))
                            .textFieldStyle(.roundedBorder)
                        Image(systemName: "eye")
                    }
                }
                
               
             
            }
            
            Button(action: {
                
            }) {
                Text("Login")
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
            Spacer()
            
        }.padding()
    }
}

#if DEBUG
struct KBLoginPage_Previews : PreviewProvider {
    static var previews: some View {
        KBLoginPage()
    }
}
#endif
