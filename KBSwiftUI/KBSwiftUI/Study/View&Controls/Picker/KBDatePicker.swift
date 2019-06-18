//
//  KBDatePicker.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/18.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBDatePicker : View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var birthDate = Date()
    @State var timeDate = Date()
    var body: some View {
        VStack {
            DatePicker($birthDate
                      , displayedComponents: .date)
            
            DatePicker($timeDate,
                displayedComponents: .hourAndMinute)
            
            Text("Date is \(birthDate,formatter:dateFormatter)")
        }
        
    }
}

#if DEBUG
struct KBDatePicker_Previews : PreviewProvider {
    static var previews: some View {
        KBDatePicker()
    }
}
#endif
