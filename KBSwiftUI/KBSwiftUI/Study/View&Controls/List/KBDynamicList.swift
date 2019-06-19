//
//  KBDynamicList.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

struct KBDynamicList : View {
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let restaurants = [first, second, third]
        return List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
    }
}

#if DEBUG
struct KBDynamicList_Previews : PreviewProvider {
    static var previews: some View {
        KBDynamicList()
    }
}
#endif
