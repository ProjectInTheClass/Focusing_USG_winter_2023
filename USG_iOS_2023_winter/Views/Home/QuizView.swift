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
                    Text("\(viewModel.index + 1)/\(viewModel.model.quizFirst.count)")
                        .foregroundColor(.gray)
                        .font(.system(size: geometry.size.width * 0.02))
                    
                    ProgressView(value: 0.5)
                        .padding()
                    
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
                                Text(viewModel.model.quizFirst[viewModel.index])
                                    .font(.custom("HelveticaNeue", size: 24))
                                
                                Button {
                                    viewModel.presentAnswerView()
                                } label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.green)
                                        .frame(width:geometry.size.width * 0.2, height: geometry.size.height * 0.1)
                                    //.resizable()
                                }
                                Text(viewModel.model.quizSecond[viewModel.index])
                                    .font(.custom("HelveticaNeue", size: 24))
                            }
                        )
                        .sheet(isPresented: $viewModel.isShowAnswer) {
                            AnswerView(viewModel: viewModel)
                            //시트 크기 조절?
                        }
                    //다음 버튼 & 채점 버튼
                    if viewModel.index + 1 == viewModel.model.quizAnswer.answer.count{
                        ZStack{
                            NavigationLink(
                                destination: AnswerCheckView(viewModel: viewModel),
                                isActive: $viewModel.isLinkActive
                            ) {
                                
                            }.disabled(viewModel.disabledButton)
                            Button(action: {
                                viewModel.emptyTestArray()
                                viewModel.isLinkActive = true
                            }) {
                                ZStack{
                                    if viewModel.disabledButton {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.13)
                                            .foregroundColor(.gray)
                                    }
                                    else {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.13)
                                            .foregroundColor(.green)
                                    }
                                    Text("문제풀러 가기")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                    }else{
                        Button {
                            viewModel.nextIndex()
                            // answerView에서 답을 선택시 프로퍼티 받아서 활성화 되게끔
                        } label: {
                            ZStack{
                                if viewModel.disabledButton {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.13)
                                        .foregroundColor(.gray)
                                }
                                else{
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.13)
                                        .foregroundColor(.green)
                                }
                                Text("다음")
                                    .foregroundColor(.white)
                            }
                        }.disabled(viewModel.disabledButton)
                    }
                    

                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        
        
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(model: QuizData.Quizs["토끼"] ?? QuizModel(quizTopic: "", quizTopicImage: "", quizFirst: [], quizSecond: [], quizAnswer:AnswerModel(answer: [], dummyAnswer: [[]])))
    }
}
