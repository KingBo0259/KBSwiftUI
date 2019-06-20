//
//  KBSegment.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSegment : View {
    @State private var favoriteColor = "0"
    var body: some View {
        VStack{
            SegmentedControl(selection: $favoriteColor) {
                VStack{
                     Text("Red")
                }.tag("0")
                Text("Blue").tag("4")
                Text("Gree").tag("1")
                Text("Blue").tag("2")
                ForEach(10..<12){ index in
                    Text("\(index)").tag("\(index)")
                }
            }
            
            if  ["0","1","2"].contains(favoriteColor){
                    Text("Value:\(favoriteColor)")
            }else {
                Group{
                    Image("happy")
                    Text("\(favoriteColor)")
                }
          
            }
       
        }
      
    }
}

#if DEBUG
struct KBSegment_Previews : PreviewProvider {
    static var previews: some View {
        KBSegment()
    }
}
#endif
