//
//  QuizViewModel.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/07/04.
//

import Foundation

class QuizViewModel: ObservableObject {
    let model: QuizModel
    
    init(model: QuizModel) {
        self.model = model
    }
    
    
}
