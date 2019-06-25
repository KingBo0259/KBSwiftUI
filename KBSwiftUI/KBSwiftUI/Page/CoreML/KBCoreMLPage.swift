//
//  KBCoreML.swift
//  KBSwiftUI
// https://www.youtube.com/watch?v=_AVr0tlPxHw&feature=youtu.be
//  Created by 金灵波 on 2019/6/25.
//  Copyright © 2019 金灵波. All rights reserved.
//



import SwiftUI
import CoreML

struct KBCoreMLPage : View {
    @State private var wakeup = Date()
    @State private var sleepAmount: Double = 8
    @State private var coffeeAmount :Int = 1
    @State private var alertTitle  = ""
    @State private var alertMessage = ""
    @State private var showingAlert  = false
 
    var body: some View {
        NavigationView{
            VStack{
                Text("When do you want to wake up? ")
                    .font(.headline)
                    .lineLimit(nil)
                DatePicker($wakeup,   displayedComponents: .hourAndMinute)
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step:0.25) {
                    Text("\(sleepAmount,specifier:"%g") hours")
                }
                
                Text("Daliy coffee intake")
                    .font(.headline)
                    .lineLimit(nil)
                
                Stepper(value:$coffeeAmount,in: 1...20,step: 1){
                    if coffeeAmount == 1 {
                        Text("1 cup")
                    }else {
                        Text("\(coffeeAmount) cups")
                    }
                }
                Spacer()
                }
                .navigationBarTitle(Text("Better Rest"))
                .navigationBarItems(trailing: Button(action: caculateBetime, label: {
                    Text("Caculate")
                })
                )
                .padding()
                .presentation($showingAlert){
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        
        }
        
    
    }
    
    func caculateBetime() {
        //TODO: 需要排后期完成 https://www.youtube.com/watch?v=_AVr0tlPxHw&feature=youtu.be
        
        do {
            let componments = Calendar.current.dateComponents([.hour,.minute],from: wakeup)
            let hour = (componments.hour ?? 0) * 60 * 60
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            let sleepTime = wakeup
            alertMessage  = formatter.string(from: sleepTime)
            alertTitle = " You ideal bedtime is..."
            
            
            
        }catch {
            alertTitle  = "Error"
            alertMessage =  " Sorry, there was a problem caculating you bedtime"
            
        }
        showingAlert = true
        
    }
    
}

#if DEBUG
struct KBCoreML_Previews : PreviewProvider {
    static var previews: some View {
        KBCoreMLPage()
    }
}
#endif
