//
//  KBMultilineTextView.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/25.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

struct KBMultilineTextView : UIViewRepresentable  {
    @Binding var text :String
    
    func updateUIView(_ uiView: UITextView, context:Context) {
        uiView.text = text
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    //处理UIView 数据源处理
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
    
    class Coordinator: NSObject ,UITextViewDelegate{
        var parent : KBMultilineTextView
        init(_ parent:KBMultilineTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
 
}
