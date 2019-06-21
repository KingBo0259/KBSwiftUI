//
//  KBGradient.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBGradient : View {
    let gradient = LinearGradient(gradient: Gradient(colors: [.white,.red ,.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .background(gradient,cornerRadius: 5)
    }
}

#if DEBUG
struct KBGradient_Previews : PreviewProvider {
    static var previews: some View {
        KBGradient()
    }
}
#endif
