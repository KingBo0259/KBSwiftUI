//
//  KBCountDownWidget.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBCountDownWidget : View {
    var maxCount = 60
    @State private  var count :Int = 60
    @State var start = false
    
    var body: some View {
        Button(action:{
            self.start.toggle()
            self.startCountDown()
            }) {
                Text(self.start == false ? "点击倒计时" : "\(self.count)s").font(Font.system(size: 16))
            }.foregroundColor(self.start ? .gray : .blue)
            .padding()
            .background(Color.yellow)
            .cornerRadius(12)//一定要在background()之后调用
            .disabled(self.start == true)
        
    }
    
    func startCountDown()  {
        self.count = maxCount
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {   (timer) in
            self.count = self.count - 1
            if self.count <= 0 {
                self.count = 0
                self.start = false
                timer.invalidate()
            }
        }
    }
}


#if DEBUG
struct KBCountDownWidget_Previews : PreviewProvider {
    static var previews: some View {
        KBCountDownWidget(maxCount: 5)
    }
}
#endif
