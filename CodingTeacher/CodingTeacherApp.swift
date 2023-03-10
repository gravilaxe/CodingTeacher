//
//  CodingTeacherApp.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 09/02/2023.
//

import SwiftUI

@main
struct CodingTeacherApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
