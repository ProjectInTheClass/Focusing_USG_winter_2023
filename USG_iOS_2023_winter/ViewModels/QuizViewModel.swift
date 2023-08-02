//
//  QuizViewModel.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/07/04.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    var model: QuizModel
    @Published var isShowAnswer:Bool
    @Published var selectedAnswer:String
    
    init(model: QuizModel) {
        self.model = model
        self.isShowAnswer = false
        self.selectedAnswer = ""
    }
    
    
    func selectAnswer(){
        isShowAnswer.toggle()
    }
    
    func selectAnswer(num: Int){
        selectedAnswer = model.quizAnswer.dummyAnswer[0][num]
    }
}

