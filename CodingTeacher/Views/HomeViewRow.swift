//
//  HomeViewRow.swift
//  CodingTeacher
//
//  Created by Joshua Wright on 13/02/2023.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var lessonCount: String
    var time: String
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack{
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: 116, height:116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    Text("\(title)")
                        .font(.headline)
                        .bold()
                    Text("\(description)")
                        .font(.caption)
                        .padding(.bottom, 20)
                    
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("\(lessonCount)")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("\(time)")
                            .font(.caption)
                        Spacer()
                    }
                }
                .padding(.leading, 15)
                Spacer()
            }
            
        }
    }
}
struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Title", description: "Description", lessonCount: "10 lessons", time: "10 Hours")
    }
}

