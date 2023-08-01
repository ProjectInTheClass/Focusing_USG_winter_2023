//
//  QuizView.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/07/04.
//

import SwiftUI

struct QuizView: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    init(model: QuizModel) {
        viewModel = QuizViewModel(model: model)
    }
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("1/10")
                    .foregroundColor(.gray)
                    .font(.system(size: geometry.size.width * 0.02))
                
                (Text("그림의 ") + Text(viewModel.model.quizTopic).foregroundColor(.green) + Text("를 보고 빈칸에 들어갈 말을 골라보세요"))
                    .bold()
                    .font(.system(size: geometry.size.width * 0.03))
                
                //그림 이미지
                Image(viewModel.model.quizTopicImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                
                //문제
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .frame(height:geometry.size.height * 0.13)
                    .padding()
                    .overlay(
                        HStack {
                            Text(viewModel.model.quizFirst[0])
                                .font(.custom("HelveticaNeue", size: 24))
                            
                            Button {
                                viewModel.selectAnswer()
                            } label: {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.green)
                                    .frame(width:geometry.size.width * 0.2, height: geometry.size.height * 0.1)
                                //.resizable()
                            }
                            Text(viewModel.model.quizSecond[0])
                                .font(.custom("HelveticaNeue", size: 24))
                        }
                    )
                    .sheet(isPresented: $viewModel.isShowAnswer) {
                        AnswerView(model: viewModel.model)
                        //시트 크기 조절?
                    }
                Button {
                    // answerView에서 답을 선택시 프로퍼티 받아서 활성화 되게끔
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.13)
                            .foregroundColor(.gray)
                        Text("다음")
                            .foregroundColor(.white)
                    }
                    
                    
                }

            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
    
    struct QuizView_Previews: PreviewProvider {
        static var previews: some View {
            QuizView(model: QuizData.Quizs["토끼"] ?? QuizModel(quizTopic: "", quizTopicImage: "", quizFirst: [], quizSecond: [], quizAnswer:AnswerModel(answer: [], dummyAnswer: [[]])))
        }
    }
}
