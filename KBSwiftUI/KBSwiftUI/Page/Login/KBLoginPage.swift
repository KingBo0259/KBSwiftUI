//
//  KBLoginPage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

 let  KBUserNameMaxLenght = 15
 let  KBPasswordMaxLenght = 6

class KBLoginModel:  BindableObject{
    var didChange = PassthroughSubject<Void,Never>()
    var username = ""{
        didSet{
            if  username.count > KBUserNameMaxLenght {
                username = String(username.prefix(KBUserNameMaxLenght))
            }
            setButtonEnable()
            didChange.send(())
        }
    }
    
    var showPassword = false {
        didSet {
            self.didChange.send(())
        }
    }
    
    var password = ""{
      
        didSet {
            if password.count > KBPasswordMaxLenght {
                password = String(password.prefix(KBPasswordMaxLenght))
            }
            setButtonEnable()
            didChange.send(())
        }
    }
    var loginButtonEnable = false
    
    private func setButtonEnable()  {
         loginButtonEnable = !username.isEmpty  &&  password.count > 0
    }
    
    fileprivate func loginTap(){
        UIApplication.shared.keyWindow?.endEditing(true)
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
                    Image(systemName: "person").padding()
                    TextField($userMobel.username,placeholder: Text("Please enter you  username"))
                        .textFieldStyle(.roundedBorder).padding(.trailing,32)
                }.padding(.bottom,10)
             
                Group{
                    HStack{
                        Image(systemName: "lock").padding()
                        
                        if !userMobel.showPassword {
                            SecureField($userMobel
                                .password, placeholder: Text("Please enter you password"))
                                .textFieldStyle(.roundedBorder)
                        }else {
                            TextField($userMobel
                                .password, placeholder: Text("Please enter you password"))
                                .textFieldStyle(.roundedBorder)
                        }
                    
                    
                        Image(systemName: userMobel.showPassword ? "eye.slash" : "eye")
                            .gesture(TapGesture().onEnded({ _ in                                self.userMobel.showPassword.toggle()
                            }))
                        
                    }
                }
             
            }
            
            Group{
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
                
                HStack{
                    Spacer()
                    Button(action: {
                        KBFaceIDLogin.login { (result) in
                            switch result {
                            case .success(let value):
                                print("success\(value)")
                                break
                            case .failure(let error):
                                print("\(error)")
                                break
                            }
                        }
                    }) {
                        Text("FaceID 登录")
                            
                           .font(.footnote) .color(.gray).padding(.top,8)
                    }
                }
                
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
