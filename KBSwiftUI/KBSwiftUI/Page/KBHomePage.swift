//
//  KBHomePage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBHomePage : View {
    var categories: [String: [KBLandmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var feature :[KBLandmark]  {
        landmarkData.filter{$0.isFeatured}
    }
    
    var body: some View {
        NavigationView{
            List{
                KBFeatureLandMarks(feature: feature.first!)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted().identified(by: \.self)){ key in
                        KBCategoryRow(categoryName: key, list: self.categories[key]!)
                    
                    }.listRowInsets(EdgeInsets())
                
                
                
                NavigationButton(destination: KBHomePage()) {
                    Text("See All")
                }
                
            }.navigationBarTitle(Text("Feature"))

        }
  
    }
}

#if DEBUG
struct KBHomePage_Previews : PreviewProvider {
    static var previews: some View {
        KBHomePage()
    }
}
#endif
