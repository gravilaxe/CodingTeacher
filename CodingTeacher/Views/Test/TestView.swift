//
//  TestView.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 14/02/2023.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        if model.currentQuestion != nil{
            VStack{
                //Question number
                Text("Question \(model.currentQuestionIndex+1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Question
                
                //Answers
                
                //Submit button
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        
    }
}

