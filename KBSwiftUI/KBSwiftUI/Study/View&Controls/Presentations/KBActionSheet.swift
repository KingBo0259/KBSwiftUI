//
//  KBActionSheet.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI



struct KBActionSheet : View {
    @State var showingSheet = false
    
    var sheet : ActionSheet {
        ActionSheet(title: Text("Action"), message: Text("Quote mark"), buttons: [.default(Text("Woo"), onTrigger: {
            self.showingSheet = false
        }),.default(Text("Woo12"), onTrigger: {
            self.showingSheet = false
        }),.cancel()])
    }
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show ActionSheet")
            }.presentation(self.showingSheet ? sheet :nil)
    }
}

#if DEBUG
struct KBActionSheet_Previews : PreviewProvider {
    static var previews: some View {
        KBActionSheet()
    }
}
#endif
