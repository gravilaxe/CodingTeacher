//
//  ContentDetailView.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 13/02/2023.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        //Only show video on valid url
        VStack{
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            //TODO: Description
            CodeTextView()
            
            //Next lesson button
            if model.hasNextLesson(){
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                        
                }
            }
            else{
                //Show complete button
                Button {
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        Text("Complete Module")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                        
                }
            }


        }.padding()
            .navigationTitle(lesson?.title ?? "")
    }
}
