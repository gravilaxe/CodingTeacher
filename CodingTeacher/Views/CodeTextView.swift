//
//  CodeTextView.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 14/02/2023.
//

import SwiftUI


struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model:ContentModel
    
    func makeUIView(context: Context) -> UITextView{
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        textView.attributedText = model.lessonDescription
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

