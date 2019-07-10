//
//  KBHomePage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBHomePage : View {
    @State var dismissLogin = true //默认关闭登录页面
    var categories: [String: [KBLandmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var feature :KBLandmark  {
        landmarkData.filter{$0.isFeatured}.randomElement()!
    }
    
    var body: some View {
        NavigationView{
            List{
                KBFeatureLandMarks(feature: feature)
                    .scaledToFill()
                    .frame(height:200.0)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted().identified(by: \.self)){ key in
                        KBCategoryRow(categoryName: key, list: self.categories[key]!)
                    
                    }.listRowInsets(EdgeInsets())
                
                
                
                NavigationLink(destination: KBStaticList()) {
                    Text("See All")
                    }
                
    }.presentation(self.dismissLogin ? nil : Modal(KBLoginPage(dismissLogin: $dismissLogin)){
        if self.dismissLogin == false {
        self.dismissLogin = true
    }
    print("KBLoginPage dismiss :\(self.dismissLogin)")
    })
                    
                .navigationBarTitle(Text("Feature"))
                .navigationBarItems(trailing:
                   
                    Button(action: {
                       self.dismissLogin = false
                    }, label: {
                        Image(systemName:"person.circle")
                    })
                )
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
