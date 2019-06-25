//
//  KBMessageChatPage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/25.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

class KBMessageChatData:Identifiable {
    var id = UUID()
    init(isMe:Bool = false , message : String) {
        self.isMe = isMe
        self.message = message
    }
    var isMe = false
    var message :String = ""
}


struct KBMessageChatRow :View {
    @State var message : KBMessageChatData
    var body :some View {
        Group{
            if message.isMe {
                HStack(alignment:.top){
                    Spacer()
                    Text(self.message.message)
                        .lineLimit(nil)
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                }
                
            }else {
                HStack {
                    Image(systemName: "person.and.person")
                        .resizable()
                        .frame(width:40,height:40)
                    Text(self.message.message)
                        .lineLimit(nil)
                    
                }
            }
        }
    }
}

struct KBMessageChatPage : View {
    @State var sendMessage = ""
    
    @State private var messages : [KBMessageChatData] = [KBMessageChatData(message: "hello,where are you "),
         KBMessageChatData(message: "I want to see you ? "),
         KBMessageChatData(isMe:true,message: "Hi , I am coming "),
     KBMessageChatData(isMe:true,message: "dfafafadafadfafadfafdfasfasdfasdfasdfasfasdfasfasffadsfafadfafdfafafafd")]
    
    var body: some View {
        VStack{
            List{
                ForEach(messages) {
                    KBMessageChatRow(message: $0)
                }
                }.listRowInsets(EdgeInsets())
      
            HStack{
                TextField($sendMessage,placeholder: Text("please enter you say"))
                    .lineLimit(nil)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: sendMessageClick) {
                    Text("Send")
                }
            }.padding()
        }
     
        
    }
    
    func sendMessageClick(){
        if self.sendMessage.count == 0{
            return
        }
        self.messages.append(KBMessageChatData(isMe:true,message:  self.sendMessage))
        self.sendMessage = ""
    }
}

#if DEBUG
struct KBMessageChatPage_Previews : PreviewProvider {
    static var previews: some View {
        KBMessageChatPage()
    }
}
#endif
