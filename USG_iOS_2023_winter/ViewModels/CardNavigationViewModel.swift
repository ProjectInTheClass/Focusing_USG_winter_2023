//
//  CardNavigationViewModel.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import Foundation

class CardNavigationViewModel: ObservableObject {
    @Published var isCorrectAnswer: Bool = false
    
    func answerButtonTapped() {
        isCorrectAnswer = true
    }
    
    
}
