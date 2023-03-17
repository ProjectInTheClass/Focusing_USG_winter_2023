//
//  QuizHintView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/25.
//

import SwiftUI

struct QuizHintView: View {
    let QuizList = ["토끼는 귀가 ,,,", "토끼는 발이 ,,,", "토끼는 눈이 ,,,"]
    
    var body: some View {
        ForEach(QuizList, id: \.self) {
            item in
            VStack{
                Text(item).frame(width: 100, height: 100)
            }
        }
        
    }
}


