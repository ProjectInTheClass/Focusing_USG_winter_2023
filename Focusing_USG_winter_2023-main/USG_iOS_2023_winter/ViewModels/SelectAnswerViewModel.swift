//
//  SelectAnswerViewModel.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/03/04.
//

import SwiftUI

class SelectAnswerViewModel: ObservableObject {
    @Published var isSelectAnswerDisplayed: Bool = false
    
    func selectAnswerButtonTapped(){
        isSelectAnswerDisplayed = true
    }
    
}
