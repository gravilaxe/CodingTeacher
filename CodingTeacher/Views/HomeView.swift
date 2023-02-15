//
//  ContentView.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 09/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("What would you like to do today?")
                    .padding(.leading)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){ module in
                            VStack(spacing: 20){
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                        .onAppear(perform: {model.beginModule(module.id)}),
                                    tag: module.id,
                                    selection: $model.currentContentSelected){
                                    
                                        //MARK: Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lessonCount: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    }
                                

                                //MARK: Test Card
                                NavigationLink(
                                    destination:
                                        TestView().onAppear(perform: {model.beginTest(module.id)}),
                                    tag: module.id,
                                    selection: $model.currentTestSelected) {
                                    
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lessonCount: "\(module.test.questions.count) Questions", time: module.test.time)
                                }

                            }
                        }
                    }.padding()
                }.accentColor(.black)
            }.navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
