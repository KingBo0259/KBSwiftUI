//
//  KBDiscoverView.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBDiscoverView : View {
    @State private var draggedViewState = KBDraggableCover.DragState.inactive
    @State private var movieDetailPresented = false
    @State private var willEndPosition: CGSize? = nil
    
    
    private func draggableCoverEndGestureHandler(handler: KBDraggableCover.EndState) {
       
    }

    var body: some View {
        KBDraggableCover(movieId: 0,
                       gestureViewState: self.$draggedViewState,
                       onTapGesture: {
                        self.movieDetailPresented = true
        },
                       willEndGesture: { position in
                        self.willEndPosition = position
        },
                       endGestureHandler: { handler in
                        self.draggableCoverEndGestureHandler(handler: handler)
        })
    }
}

#if DEBUG
struct KBDiscoverView_Previews : PreviewProvider {
    static var previews: some View {
        KBDiscoverView()
    }
}
#endif
