
//
//  KBCombineText.swift
//  KBSwiftUI
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-combine-text-views-together
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBCombineText : View {
    var note = """

        Not allow:
        Text("SwiftUI ")
            .foregroundColor(.red)
        + Text("is ")
            .foregroundColor(.orange)
        + Text("awesome".foregroundColor(.blue)
        Warning: Some modifiers change a property of your view, whereas others return a different, modified view, which can cause unhelpful compiler errors. For example, this is not allowed:

        """
    var body: some View {
        VStack{
            
            
            Text("SwiftUI").font(.largeTitle).color(.yellow
                )
                + Text(" is ").color(.blue)
                    .font(.headline)
                + Text("awesome").font(.footnote).bold()
            
            Divider()
            Text(note).lineLimit(nil) //set nil
                .multilineTextAlignment(.leading)
                .lineSpacing(5)
        }
      
    }
}

#if DEBUG
struct KBCombineText_Previews : PreviewProvider {
    static var previews: some View {
        KBCombineText()
    }
}
#endif
