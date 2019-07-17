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
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .soft)

   @State private var current :Int = 0
    
   @State private var movies = ["/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg"
                                    ,"/wb5wwdwTxse7ZwJhUKVhkRnaOMv.jpg"
                                    ,"/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
                                    ,"/bk8LyaMqUtaQ9hUShuvFznQYQKR.jpg"
                                    ,"/6gqbPbBWfAYjdTR28i1qEP499Rs.jpg"]
    
  
    
    private func draggableCoverEndGestureHandler(handler: KBDraggableCover.EndState) {
        hapticFeedback.impactOccurred(withIntensity: 0.8)
        switch handler {
        case .cancelled:
            break
        case .left:
          fallthrough
        case .right:
               self.movies.removeLast()
            break;
        }
    }

    
    private func scaleResistance() -> Double {
        Double(abs(willEndPosition?.width ?? draggedViewState.translation.width) / 6800)
    }
    
    private func dragResistance() -> CGFloat {
        abs(willEndPosition?.width ?? draggedViewState.translation.width) / 12
    }
    
    private func leftZoneResistance() -> CGFloat {
        -draggedViewState.translation.width / 1000
    }
    
    private func rightZoneResistance() -> CGFloat {
        draggedViewState.translation.width / 1000
    }
    
    private func resetData(){
        self.movies = ["/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg"
            ,"/wb5wwdwTxse7ZwJhUKVhkRnaOMv.jpg"
            ,"/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
            ,"/bk8LyaMqUtaQ9hUShuvFznQYQKR.jpg"
            ,"/6gqbPbBWfAYjdTR28i1qEP499Rs.jpg"]
    }
    
    var body: some View {
        ZStack(alignment:.center){
            GeometryReader { reader in
                Text("Reset :\(self.movies.count) , \(self.current)")
                    .position(x: reader.frame(in:.local).midX, y: 30)
                    .tapAction {
                        self.resetData()
                }
                
            }
            
            ForEach(self.movies.identified(by: \.self)) { imageUrl  in
                
                if self.movies.reversed().firstIndex(of: imageUrl) == 0 {
                    ZStack(alignment:.bottom){
                        KBDraggableCover(movieId: 0,
                                         movieImage: imageUrl,
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
                        
                        Text("\(imageUrl)")
                            .foregroundColor(.white)
                            .font(.body)
                    }
               
                    } else {
                           KBDiscoverConverImage(imageLoader: KBImageLoader(path: imageUrl, size: .small))
                            .scaleEffect(1.0 - Length(self.movies.reversed().firstIndex(of: imageUrl)!) * 0.03 + Length(self.scaleResistance()))
                            .padding(.bottom, Length(self.movies.reversed().firstIndex(of: imageUrl)! * 16) - self.dragResistance())
                            .animation(.spring())
                }
            }.onAppear {
                self.hapticFeedback.prepare()
                
            }
        }
    }
}

#if DEBUG
struct KBDiscoverView_Previews : PreviewProvider {
    static var previews: some View {
        KBDiscoverView()
    }
}
#endif
