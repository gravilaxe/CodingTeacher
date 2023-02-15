//
//  ContentModel.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 09/02/2023.
//

import Foundation

class ContentModel: ObservableObject{
    //List of modules
    @Published var modules = [Module]()
    
    //Currently active module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //Current test question
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    //Currently active lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    //Current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    
    var styleData: Data?
    //Currently selected content / test
    @Published var currentContentSelected: Int?
    @Published var currentTestSelected: Int?
    
    
    init() {
        
        getLocalData()
    }
    //MARK: Data methods
    func getLocalData(){
        //Get a url to json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        //Read file into data object
        do{
            //Try to decode json into array of type module
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assign parsed json to modules property
            self.modules = modules
        }
        catch{
            print("Couldnt parse local data")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do{
            let htmlData = try Data(contentsOf: styleUrl!)
            
            self.styleData = htmlData
        }
        catch{
            print("Couldnt parse style data")
        }
    }
    
    //MARK: Module navigation methods
    func beginModule(_ moduleID:Int){
        for index in 0..<modules.count{
            if modules[index].id == moduleID{
                //Find the matching module
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLeson(_ lessonIndex:Int){
        //Check the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
        }
        //Set the currentLesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson(){
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else{
            currentLesson = nil
            currentLessonIndex = 0
        }
        
    }
    
    
    func hasNextLesson() -> Bool{
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func beginTest(_ moduleId:Int){
        beginModule(moduleId)
        
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
        }
    }
    
    
    
    //MARK: Code Styling
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        if styleData != nil {
            data.append(self.styleData!)
        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString
        }
        
        
        
        
        
        
        return resultString
    }
    
}
