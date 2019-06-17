//
//  KBBinder.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct Order {
    var name:String
    var price :Float
}


struct KBBinding : View {
    var orders:[Order] = [Order(name: "apple", price: 10.0),
                  Order(name: "computer", price: 7000.0),
                 Order(name: "alien", price: 5200.0),
                Order(name: "pandan", price: 1200.0)]
    
    @State var showPrice = true
    var body: some View {
        List(orders.identified(by:\.name)){
            order in
            HStack(alignment:.center){
                Text(order.name)
                Spacer()
                if self.showPrice {
                        Text("\(String(format: "%.2f¥", order.price))").font(Font.system(.caption)).foregroundColor(.red)
                }
            
            }
        }.navigationBarTitle(Text("Bind"),displayMode: .automatic)
            .navigationBarItems(trailing: ToggleButton(toggle:showPrice))
    }
}

struct ToggleButton:View {
    @State var toggle :Bool
    var body: some View{
        Button(action: {
            self.toggle.toggle()
        }, label: {
            Text(self.toggle ? "Hide" :"Show")
        })
    }
}

#if DEBUG
struct KBBinder_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView{
              KBBinding()
        }
    }
}
#endif
