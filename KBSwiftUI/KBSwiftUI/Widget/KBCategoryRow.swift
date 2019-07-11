//
//  KBCategoryRow.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBCategoryRow : View {
    var categoryName:String
    var list:[KBLandmark]
    var body: some View {
        VStack(alignment:.leading) {
            Text(categoryName)
            ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(list) { landmard in
                        
                            KBCategoryItem(landMark: landmard)
                        }
                    }
                }.frame(height:185)
        }.padding()
    }
}

struct KBCategoryItem:View {
    var landMark :KBLandmark
    var body: some View {
        VStack(alignment:.leading){
            landMark
                .image(forSize: 155)
                .renderingMode(.original)
                .cornerRadius(5)

            Text(landMark.name)
                .font(.caption)
                .color(.primary)
        }
      
    }
}


