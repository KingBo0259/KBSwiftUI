//
//  KBSwiftUIFluxDemo.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

//存储状态值
struct KBFluxState:FluxState {
    var title :String = ""
    var name : String = "name"
    var count  =  0
}

//行为Aciton
struct KBFluxIncrementAction:Action {
    
}
//Action
struct KBFluxDecrementAction:Action {
    
}
//数据处理
func testReducer(state: KBFluxState, action: Action) -> KBFluxState {
    var state = state
    switch action {
    case  _ as KBFluxIncrementAction:
        state.count += 1
    case _ as KBFluxDecrementAction:
        state.count -= 1
    default:
        break;
    }
    return state
}


struct KBSwiftUIFluxDemo : View {
    @State var store : Store<KBFluxState> =
        Store(reducer: testReducer, state: KBFluxState(title: "flux", name: "kingbo",count: 1), queue: .main)
    
    
    var body: some View {
       return  VStack {
            Text("\(store.state.count)")
            HStack {
                Button(action: { self.store.dispatch(action: KBFluxIncrementAction())}) {
                    Text("Decrement")
                }
                
                Button(action: { self.store.dispatch(action: KBFluxDecrementAction()) }) {
                    Text("Increment")
                }
            }
        }    }
}

#if DEBUG
struct KBSwiftUIFluxDemo_Previews : PreviewProvider {
    static var previews: some View {
        KBSwiftUIFluxDemo()
    }
}
#endif
