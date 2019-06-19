//
//  SwiftUIView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBTransition : View {
    @State var showDetails = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }) {
                Text("Tap to show details")
            }
            
            if showDetails {
                Text("Details go here.").transition(.move(edge: .bottom))
            }
        }
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        KBTransition()
    }
}
#endif
