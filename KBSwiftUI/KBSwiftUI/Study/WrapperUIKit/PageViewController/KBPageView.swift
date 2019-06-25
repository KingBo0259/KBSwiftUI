//
//  KBPageView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/25.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBPageView<Page:View>: View {
    var viewControllers:[UIHostingController<Page>]
    
    init(_ views:[Page]) {
        self.viewControllers = views.map{UIHostingController(rootView: $0)}
        
    }
    
    var body: some View {
        KBPageViewController(controllers: viewControllers)
    }
}

#if DEBUG
struct KBPageView_Previews : PreviewProvider {
    static var previews: some View {
        KBPageView([Text("page1")])
    }
}
#endif
