//
//  KBImage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBImage : View {
    var body: some View {
        VStack{
            Image(systemName: "bolt.fill")
            Text("origin Image").padding(.bottom, 15)
            
            Button(action: {
                print("Button tapped")
            }) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
            }
            
            Button(action: {
                print("Button tapped")
            }) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.green)
                    .clipShape(Capsule())
            }
        }
      
    }
}

#if DEBUG
struct KBImage_Previews : PreviewProvider {
    static var previews: some View {
        KBImage()
    }
}
#endif
