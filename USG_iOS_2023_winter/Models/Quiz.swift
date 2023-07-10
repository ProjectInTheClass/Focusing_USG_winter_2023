//
//  Quiz.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/04/21.
//

import Foundation
import SwiftUI

struct QuizModel {
    let number: String
    let subTopic: Image
    let question: [Question]
}


struct Question: View {
    let viewModel = QuizViewModel()
    
    let frontQuestion: String
    let backQuestion: String
    
    var body: some View {
        GeometryReader{
            geometry in
            HStack(spacing: 50){
                Text(frontQuestion)
                    .font(.custom("HelveticaNeue", size: 30))
                Button {
                    viewModel.selectAnswer()
                } label: {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.06)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                        )
                        .mask(
                            RoundedRectangle(cornerRadius: 10)
                        )
                        
                        
                }

                Text(backQuestion)
                    .font(.custom("HelveticaNeue", size: 30))
                
            }
            .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.07)
            .border(Color.blue)
        }
        
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Question(frontQuestion: "귀가", backQuestion: "에요")
    }
}
