//
//  KBToast.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/28.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

let KBToastDelayTime : TimeInterval = 5


struct KBToast<Presenting> : View where Presenting:View {
    @Binding var isShowing :Bool
    //show parent View
    let presenting:() -> Presenting
    // The text to show
    let text: Text
    let delayTime = KBToastDelayTime
  
    
    func autoHidden() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayTime) {
            self.isShowing = false
        }
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
    @State var message :String = "I am toast"
    
    var body:some View {
            NavigationView{
                VStack{
                    Button(action: {
                        withAnimation {
                            self.message = "I am Toast \(Date().timeIntervalSince1970)"
                            self.showToast = true
                        }
                    }) {
                        Text(" Show Toast")
                        }.offset(y:60)
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
