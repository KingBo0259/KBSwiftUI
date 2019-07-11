//
//  KBSectionForm.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/11.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSectionForm : View {
    @State var enableLogging = false
    
    @State var selectedColor = 1
    @State var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        Form{
            Section(header: Text("First Header"), footer: Text("First Footer")) {
                SegmentedControl(selection: $selectedColor) {
                    ForEach(0 ..< colors.count) {
                        Text(self.colors[$0]).tag($0)
                    }
                }
                Toggle(isOn: $enableLogging) {
                    Text("Enable Logging")
                }
            }
            
            Section {
                Button(action: {
                    // activate theme!
                }) {
                    Text("Save changes")
                }
            }
            
        }.navigationBarTitle("Settings")
    }
}

#if DEBUG
struct KBSectionForm_Previews : PreviewProvider {
    static var previews: some View {
        KBSectionForm()
    }
}
#endif
