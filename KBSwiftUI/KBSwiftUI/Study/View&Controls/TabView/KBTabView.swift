//
//  KBTabView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI




struct PlaceForm : View {
    var body: some View {
        List {
            VStack {
                VStack {
                    VStack {
                        Text("Turtle Rock")
                            .font(.title)
                            .color(.black)
                    }
                    HStack {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                    }
                    .padding()
            }
            }.listStyle(.grouped)
        
    }
}


struct KBTabView : View {
    @State var selectedTab = Tab.movies
    
    enum Tab: Int {
        case movies, discover, myLists
    }
    
    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
    
    
    var body: some View {
         TabbedView(selection:$selectedTab) {
                Text("movies").tabItem {
                    tabbarItem(text: "Movices", image: "film")
                }.tag(Tab.movies)
            
                Text("Discover").tabItem {
                    tabbarItem(text: "Discover", image: "square.stack")
                }.tag(Tab.discover)
            
                Text("List").tabItem {
                    tabbarItem(text: "List", image: "heart.circle")
                }.tag(Tab.myLists)
            }.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct KBTabView_Previews : PreviewProvider {
    static var previews: some View {
        KBTabView()
    }
}
#endif
