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
    @Published var index:Int
    @Published var disabledButton:Bool
    @Published var testArray:[String] = ["",""]
    @Published var collectAnswer:Int = 0
    @Published var isCollectAnswer:[Bool] = []
    @Published var isShowRewardView:Bool = false
    
    init(model: QuizModel) {
        self.model = model
        self.isShowAnswer = false
        self.index = 0
        self.selectedAnswer = ""
        self.disabledButton = true
  
    }
    
    func presentAnswerView(){
        isShowAnswer.toggle()
    }
    
    func selectAnswer(num: Int){
        selectedAnswer = model.quizAnswer.dummyAnswer[index][num]
        if selectedAnswer.count > 1{
            disabledButton = false
        }
    }
    
    func nextIndex(){
        index += 1
        selectedAnswer = ""
        disabledButton = true
    }
    

    
    func answerCheck(test:[String], answer:[String]) -> Int {
        self.collectAnswer = 0
        for element in test{
            if answer.contains(element){
                self.collectAnswer += 1
                self.isCollectAnswer.append(true)
            }else{
                self.isCollectAnswer.append(false)
            }
        }
        self.isShowRewardView = true
        return self.collectAnswer
    }

    func putInAnswer(num:Int){
        if self.testArray.indices.contains(self.index){
            self.testArray.remove(at: self.index)
            self.testArray.insert("\(self.model.quizAnswer.dummyAnswer[self.index][num])", at: self.index)
        }else{
            self.testArray.insert("\(self.model.quizAnswer.dummyAnswer[self.index][num])", at: self.index)
        }
    }
}

