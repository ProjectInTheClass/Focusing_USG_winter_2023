//
//  AnswerCheckView.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/08/04.
//

import SwiftUI

struct AnswerCheckView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        GeometryReader{
        geometry in
            VStack{
                Text("토끼에 대해 생각나는대로 빈칸을 다시 한 번 채워보세요")
                ScrollView{
                    ForEach(0..<viewModel.model.quizAnswer.answer.count) { num in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .frame(height:geometry.size.height * 0.13)
                            .padding()
                            .overlay(
                                ZStack{
                                    HStack {
                                        Text(viewModel.model.quizFirst[num])
                                            .font(.custom("HelveticaNeue", size: 24))
                                        
                                        Button {
                                            viewModel.index = num
                                            viewModel.selectedAnswer = ""
                                            viewModel.presentAnswerView()
                                        } label: {
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.green)
                                                .frame(width:geometry.size.width * 0.2, height: geometry.size.height * 0.1)
                                                .overlay(
                                                    Text("\(viewModel.testArray[num])")
                                                )
                                        }
                                        .sheet(isPresented: $viewModel.isShowAnswer) {
                                            AnswerView(viewModel: viewModel)
                                        }
                                        Text(viewModel.model.quizSecond[num])
                                            .font(.custom("HelveticaNeue", size: 24))
                                    }
                                    if viewModel.isCollectAnswer.isEmpty == false {
                                        if viewModel.isCollectAnswer[num]{
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.black)
                                                .font(.title)
                                        }else{
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.red)
                                                .font(.title)
                                        }
                                    }
                                }
                            )
                    }
                    Text("정답: \(viewModel.collectAnswer)개")
                }
                Button {
                    viewModel.answerCheck(test: viewModel.testArray, answer: viewModel.model.quizAnswer.answer)
                } label: {
                    Text("채점하기")
                }
                .sheet(isPresented: $viewModel.isShowRewardView) {
                    QuizRewardView()
                }// 문제 차례대로 딜레이 주면서 채점 -> sheet화면 나타나게 하고싶음
            }
        }
    }
}

struct AnswerCheck_View: PreviewProvider{
    static var previews: some View {
        AnswerCheckView(viewModel: QuizViewModel(model: QuizData.rabbitQuiz))
    }
}

