//
//  KBObjectBinding.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

class KBCitys: BindableObject {
      var didChange = PassthroughSubject<KBCitys,Never>();
    
    
    var toggle1:Bool = false {
        didSet{
            print("change toggle")
            didChange.send(self)
        }
    }
    
    var toggle2 : Bool = false {
        didSet {
            print("toggle2 toggle")
            didChange.send(self)
        }
    }
    
}

struct KBObjectBinding : View {
    @ObjectBinding var city = KBCitys()
    
    var body: some View {
        VStack {
            Text("Hello BindingObject!")
            Group{
                Toggle(isOn: $city.toggle1) {
                    Text( self.city.toggle1 ? "on" : "off")
                }
                Toggle(isOn:$city.toggle2) {
                    Text(self.city.toggle2 ? "on" :"off")
                }
            }.padding()
        
        }
    
    }
}

#if DEBUG
struct KBObjectBinding_Previews : PreviewProvider {
    static var previews: some View {
        KBObjectBinding()
    }
}
#endif
