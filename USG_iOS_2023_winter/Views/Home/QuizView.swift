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
    
    
    struct AnswerView:View {
        
        var body: some View {
            VStack{
                Text("빈칸에 들어갈 말을 골라보세요.")
                HStack{
                    Text("귀가")
                    ZStack{
                        Rectangle()
                            .frame(width: 100, height: 50)
                        Text(viewModel.selectedAnswer)
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
                        viewModel.selectAnswer()
                        
                    } label: {
                        Text("확인")
                        Text(String(viewModel.isShowAnswer))
                    }
            }
            
        }
    }
    struct QuizView_Previews: PreviewProvider {
        static var previews: some View {
            QuizView(model: QuizData.Quizs["토끼"] ?? QuizModel(quizTopic: "", quizTopicImage: "", quizFirst: [], quizSecond: [], quizAnswer:AnswerModel(answer: [], dummyAnswer: [[]])))
        }
    }
}
