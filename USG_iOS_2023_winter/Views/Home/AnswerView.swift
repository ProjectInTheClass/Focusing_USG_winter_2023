//
//  AnswerView.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/08/10.
//

import SwiftUI

struct AnswerView:View {
    
    @ObservedObject var viewModel:QuizViewModel
   
    
    var body: some View {
        VStack{
            Text("빈칸에 들어갈 말을 골라보세요.")
            HStack{
                Text(viewModel.model.quizFirst[viewModel.index])
                ZStack{
                    Rectangle()
                        .frame(width: 100, height: 50)
                    Text(viewModel.selectedAnswer) 
                        .foregroundColor(.white)
                }
                
                Text(viewModel.model.quizSecond[viewModel.index])
            }
            ForEach(0..<viewModel.model.quizAnswer.dummyAnswer[viewModel.index].count) { num in
                Button {
                    viewModel.selectAnswer(num: num)
                    viewModel.putInAnswer(num: num)
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .frame(width: 500, height: 70)
                        HStack{
                            Text("\(viewModel.model.quizAnswer.dummyAnswer[viewModel.index][num])")

                        }
                    }
                }
            }
                Button {
                    viewModel.presentAnswerView()
                    
                } label: {
                    Text("확인")
                }
        }
        
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(viewModel: QuizViewModel(model: QuizData.rabbitQuiz))
    }
}
