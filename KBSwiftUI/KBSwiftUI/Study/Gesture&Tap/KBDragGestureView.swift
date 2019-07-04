//
//  KBDragGestureView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/7/4.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

class KBDragObjectBind: BindableObject {
    var didChange = PassthroughSubject<KBDragObjectBind,Never>()
    var mass:Double = 1.0 {
        didSet{
            massString = String(format: "%.2f", mass)
            self.didChange.send(self)
        }
    }
    var massString = "1.0" {
        didSet {
            self.didChange.send(self)
        }
    }
    var stiffness:Double = 100.0 {
        didSet{
            stiffnessString = String(format: "%.0f", stiffness)
            self.didChange.send(self)
        }
    }
    
    var stiffnessString = "100.0" {
        didSet {
            self.didChange.send(self)
        }
    }
    
    var damping:Double = 10.0 {
        didSet {
            dampingString = String(format: "%.0f", damping)
            self.didChange.send(self)
        }
    }
    var dampingString = "10.0"{
        didSet {
            self.didChange.send(self)
        }
    }
    
    var  initialVelocity:Double = 0.0 {
        didSet {
            initialVelocityString = String(format: "%.0f", initialVelocity)
            self.didChange.send(self)
        }
    }
    var initialVelocityString = "0.0"{
        didSet{
            self.didChange.send(self)
        }
    }
}

struct KBDragGestureView : View {
    @State var offset :CGSize = CGSize(width: 0, height: 0)
    @ObjectBinding var dragObj = KBDragObjectBind()
    @State var offset2 :CGSize = CGSize(width: 0, height: 0)
    
    var body:some View {
        VStack {
            Text("Default Setting")
            Image(systemName: "hand.draw.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onEnded({ (value) in
                            print("onEnd:\(value)")
                            withAnimation(.spring()) {
                                self.offset = CGSize(width: 0, height: 0)
                            }
                        })
                        .onChanged({ (value) in
                            print("onChanged: \(value)")
                            self.offset = value.translation
                        })
                ).zIndex(10)
            Divider()
            HStack(){
                Text("质量弥撒曲mass(\(self.dragObj.massString)):")//
                Slider(value: $dragObj.mass, from: 0.1, through: 1.0, by: 0.01)
            }
            HStack(){
                Text("刚度stiffness(\(self.dragObj.stiffnessString)):")
                Slider(value: $dragObj.stiffness, from: 0, through: 100.0, by: 1)
            }
            HStack(){
                Text("阻尼dampin(\(self.dragObj.dampingString)):")
                Slider(value: $dragObj.damping, from: 0, through: 100.0, by: 1)
            }
            HStack(){
                Text("初始速度initialVelocity(\(self.dragObj.initialVelocityString)):")
                Slider(value: $dragObj.initialVelocity, from: 0.0, through: 100.0, by: 1)
            }
            
            Image(systemName: "hand.draw")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(offset2)
                .gesture(
                    DragGesture()
                        .onEnded({ (value) in
                            print("onEnd:\(value)")
                            withAnimation(.spring(mass: self.dragObj.mass,
                                                  stiffness: self.dragObj.stiffness,
                                                  damping: self.dragObj.damping,
                                                  initialVelocity: self.dragObj.initialVelocity)) {
                                self.offset2 = CGSize(width: 0, height: 0)
                            }
                        })
                        .onChanged({ (value) in
                            print("onChanged: \(value)")
                            self.offset2 = value.translation
                        })
            )
            
            
        }.padding()
    }
}

#if DEBUG
struct KBDragGestureView_Previews : PreviewProvider {
    static var previews: some View {
        KBDragGestureView()
    }
}
#endif
