//
//  KBLoginPage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

class KBLoginModel:  BindableObject{
    var didChange = PassthroughSubject<Void,Never>()
    var username = ""{
        didSet{
             setButtonEnable()
            self.didChange.send(())
        }
    }
    
    
    var password = ""{
        didSet {
            setButtonEnable()
            self.didChange.send(())
        }
    }
    var loginButtonEnable = false
    
    private func setButtonEnable()  {
         loginButtonEnable = !username.isEmpty  &&  password.count > 3
    }
    
    fileprivate func loginTap(){
        print("start to login : \n userName \(username) \n password:\(password)")
    }
}


struct KBLoginPage : View {
    @ObjectBinding var userMobel = KBLoginModel()
    var body: some View {
        VStack{
             ImageStore.shared.image(name: "charleyrivers_feature", size: 200)
                  .cornerRadius(50)
                  .padding()
            
            
            Group {
                HStack(alignment:.center){
                    Image(systemName: "person")
                    TextField($userMobel.username,placeholder: Text("Please enter you  username"))
                        .textFieldStyle(.roundedBorder).padding(.trailing,32)
                }.padding(.bottom,10)
             
                Group{
                    HStack{
                        Image(systemName: "lock")
                        SecureField($userMobel
                            .password, placeholder: Text("Please enter you password"))
                            .textFieldStyle(.roundedBorder)
                        Image(systemName: "eye")
                    }
                }
             
            }
            
            Button(action: {
                print("tap")
                self.userMobel.loginTap()
            }) {
                Text("Login")
                    .color(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
                    .background( userMobel.loginButtonEnable
                        ? Color.blue : Color.gray)
                      .cornerRadius(5)          .disabled(false)
                }
            
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
