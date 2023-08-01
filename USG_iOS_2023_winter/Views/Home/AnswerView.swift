//
//  AnswerView.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/07/12.
//

import SwiftUI

struct AnswerView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    init(model: QuizModel) {
        viewModel = QuizViewModel(model: model)
    }
    
    var body: some View {
        VStack{
            Text("빈칸에 들어갈 말을 골라보세요.")
            HStack{
                Text("귀가")
                ZStack{
                    Rectangle()
                        .frame(width: 100, height: 50)
                    //Text(viewModel.selectedAnswer)
                        .foregroundColor(.white)
                }
                
                Text("있어요")
            }
            ForEach(0..<viewModel.model.quizAnswer.dummyAnswer[0].count) { num in
                Button {
                    viewModel.selectAnswer(num: num)
                    //로직
                    // 답을 체크할 때 -> 답을 value저장하는 프로퍼티에 값 업데이트, 박스 색상 변경 -> QuizView의 버튼 label도 변경되어야함. -> QuizView 다음 버튼 활성화
                    // 취소 버튼이 있어야할까?
                    // 다음 버튼 누르면 퀴즈결과 알려주기? 아니면 준비된 퀴즈가 끝나면?
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .frame(width: 500, height: 70)
                        Text("\(viewModel.model.quizAnswer.dummyAnswer[0][num])")
                    }
                    
                        
                }
            }
                Button {
                   
                } label: {
                    Text("확인")
                }
        }
        
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(model: QuizData.rabbitQuiz)
    }
}
