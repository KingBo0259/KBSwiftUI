//
//  KBToast.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/28.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

let KBToastDelayTime : TimeInterval = 3

//avoid trigger more times
class KBToastManger {
    var stopDate  = Date()
    static let share = KBToastManger()
    func delayTimeCall( callBack:@escaping  ()->Void, delayTime:TimeInterval)  {
        stopDate = Date(timeInterval: delayTime, since: Date())
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayTime) {
            guard   self.stopDate < Date() else {
                print("time not out  keey going on")
                return
            }
            print("timeout  Call back ")
            callBack()
        }
    }
}
struct KBToast<Presenting> : View where Presenting:View {
    @Binding var isShowing :Bool
    //show parent View
    let presenting:() -> Presenting
    // The text to show
    let text: Text
    var delayTime = KBToastDelayTime
    private let manager = KBToastManger.share
    func autoHidden() {
        manager.delayTimeCall(callBack: {
            withAnimation {
                self.isShowing = false
            }
        }, delayTime: delayTime)
    }
    
    var body: some View {
        if isShowing {
            self.autoHidden()
        }
        //获取父节点逻辑宽度
       return GeometryReader { geometry in
            ZStack (alignment: .center){
                 self.presenting()
                 VStack {
                    self.text.padding()
                        .onAppear {
                            print("Toast Appear")
                    }
                  .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .transition(.slide)
                    .opacity(self.isShowing ? 1: 0)
            }
            }
        }
 
    }
}

extension View {
    func toast(isShowing:Binding<Bool> ,text:Text) -> some View {
        KBToast(isShowing: isShowing, presenting: {
            self
        }, text: text)
    }
}

struct KBToastDemo:View {
    @State var showToast = false
    @State var message :String = ""
    
    let description = """
                         1、首次Toast文字不会显示bug,应该是SwiftUI bug，坐等后期修复.
                         2、首次按钮字体会变形
                     """
    
    var body:some View {
            NavigationView{
                VStack{
                    Button(action: {
                        withAnimation {
                            self.message = "I am Toast \(Date().timeIntervalSince1970)"
                            print("message : \(self.message)")
                            self.showToast = true
                        }
                    })
                    {
                        Text(" Show Toast +\(self.message)")
                            .padding()
                        }
                    
                    Text(description)
                        .color(.gray)
                        .lineLimit(nil)
                        .font(.footnote)
             
                    
                }.navigationBarTitle(Text("Test Toast"),displayMode: .inline)
            }
                .toast(isShowing: $showToast, text: Text(message))
    }
}

#if DEBUG
struct KBToast_Previews : PreviewProvider {
    static var previews: some View {
        KBToastDemo()
    }
}
#endif
