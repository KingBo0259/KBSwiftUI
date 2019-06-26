//
//  KBModal.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/26.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBModalDetailView:View {
    @Binding var dismissFlag: Bool
    
    var body:some View {
        Group {
            Text("Detail")
            Button(action: {
                self.dismissFlag.toggle()
            }) {
                Text("Dismiss")
            }
        }
    }
}

struct KBModalView : View {
    @State var dismissFlag = false

    var body: some View {
        Button(action: {
            self.dismissFlag.toggle()
        })
        { Text("Show") }
            .presentation(!dismissFlag ? nil :
                    Modal(KBModalDetailView(dismissFlag: $dismissFlag)) {
                    print("dismissed")
                }
               
            )
        
    }
}

#if DEBUG
struct KBModal_Previews : PreviewProvider {
    static var previews: some View {
        KBModalView()
    }
}
#endif
