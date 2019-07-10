//
//  KBPresentView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBPresentViewDetail:View {
    var body: some View {
        Text("KB present View")
    }
}

struct KBPresentView : View {
    var body: some View {
        PresentationLink(destination: KBPresentViewDetail()) {
            Text("Click to Present View")
        }
     }
}

#if DEBUG
struct KBPresentView_Previews : PreviewProvider {
    static var previews: some View {
        KBPresentView()
    }
}
#endif
