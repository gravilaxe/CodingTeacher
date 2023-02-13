//
//  ContentModel.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 09/02/2023.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
       
        getLocalData()
    }
    
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
}
