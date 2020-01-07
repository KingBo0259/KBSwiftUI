//
//  KBDraggableCover.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct KBDraggableCover : View {
    
    // MARK: - Drag State
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize, predictedLocation: CGPoint)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.translation
            }
        }
        
        var predictedLocation: CGPoint {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.predictedLocation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    enum EndState {
        case left, right, cancelled
    }

    // MARK: - Internal vars
    @State private var viewState = CGSize.zero
    @State private var predictedEndLocation: CGPoint? = nil
    @State private var hasMoved = false
    @State private var delayedIsActive = false
    @GestureState private var dragState = DragState.inactive
    private let hapticFeedback = UISelectionFeedbackGenerator()
    
    // MARK: - Internal consts
    private let minimumLongPressDuration = 0.01
    private let shadowSize: Length = 4
    private let shadowRadius: Length = 16
    
    // MARK: - Constructor vars
    let movieId: Int
    let movieImage:String
    @Binding var gestureViewState: DragState
    let onTapGesture: () -> Void
    let willEndGesture: (CGSize) -> Void
    let endGestureHandler: (EndState) -> Void
    // MARK: - Viewd functions
    
    private func computedOffset() -> CGSize {
        if let location = predictedEndLocation {
            return CGSize(width: viewState.width + location.x,
                          height: 0)
        }
        
        return CGSize(
            width: dragState.isActive ? viewState.width +  dragState.translation.width : 0,
            height: 0
        )
    }
    
    private func computeAngle() -> Angle {
        if let location = predictedEndLocation {
            return Angle(degrees: Double(location.x / 15))
        }
        return Angle(degrees: Double(dragState.translation.width / 15))
    }
    
    private var coverSpringAnimation: Animation {
        .fluidSpring(stiffness: 200,
                     dampingFraction: 0.6,
                     blendDuration: 0,
                     timestep: 1.0 / 300,
                     idleThreshold: 0.5)
    }
    
    var body: some View {
        
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
                            .sequenced(before: DragGesture())
                            .updating($dragState) { (value, state, transaction) in
                        
                        
                switch value {
                case .first(true):
                    state = .pressing
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero,
                                      predictedLocation: drag?.predictedEndLocation ?? .zero )
                 
                default:
                    state = .inactive
                }
        }.onChanged { _ in
            self.delayedIsActive = true
            if self.dragState.translation.width == 0.0 {
                self.hasMoved = false
                self.gestureViewState = .pressing
            } else {
                self.hasMoved = true
                self.gestureViewState = .dragging(translation: self.dragState.translation,
                                                  predictedLocation: self.dragState.predictedLocation)
            }
        }.onEnded { _ in
            let endLocation = self.gestureViewState.predictedLocation
            if endLocation.x < -150 {
                self.predictedEndLocation = endLocation
                self.willEndGesture(self.gestureViewState.translation)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.endGestureHandler(.left)
                }
            } else if endLocation.x > UIScreen.main.bounds.width - 50 {
                self.predictedEndLocation = endLocation
                self.willEndGesture(self.gestureViewState.translation)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.endGestureHandler(.right)
                }
            } else {
                self.endGestureHandler(.cancelled)
            }
            self.gestureViewState = .inactive
        }
        
        return KBDiscoverConverImage(imageLoader: KBImageLoader(path: movieImage, size: .original))
            .offset(computedOffset())
            .animation(delayedIsActive ? coverSpringAnimation : nil)
            .opacity(predictedEndLocation != nil ? 0:1)
            .rotationEffect(computeAngle())
            .scaleEffect(dragState.isActive ? 1.03 : 1)
            .shadow(color: .secondary,
                    radius: dragState.isActive ? shadowRadius : 0,
                    x: dragState.isActive ? shadowSize : 0,
                    y: dragState.isActive ? shadowSize : 0)
            .animation(coverSpringAnimation)
            .gesture(longPressDrag)
            .simultaneousGesture(TapGesture(count: 1).onEnded({ _ in
                if !self.hasMoved {
                    self.onTapGesture()
                }
            }))
            .onAppear {
                self.hapticFeedback.prepare()
        }
        
        
    }
}

#if DEBUG
//struct KBDraggableCover_Previews : PreviewProvider {
//    static var previews: some View {
//        KBDraggableCover()
//    }
//}
#endif