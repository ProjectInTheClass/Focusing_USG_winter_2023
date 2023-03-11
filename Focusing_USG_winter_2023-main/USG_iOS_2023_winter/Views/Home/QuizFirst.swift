//
//  QuizFirst.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/03/04.
//

import SwiftUI

struct QuizFirst: View {
    @StateObject var selectAnswerViewModel = SelectAnswerViewModel()
    @State private var count: String = ""
    
    // Quiz 처음화면
    let card: Card
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var subTopic: String
    
    var body: some View {
        // Quiz 구현 화면
            
        GeometryReader { geometry in
            VStack{
                Text("1/10")
                    .foregroundColor(.gray)
                    .font(.system(size: geometry.size.width * 0.02))
                
                (Text("그림의 ") + Text(subTopic).foregroundColor(.green) + Text("를 보고 빈칸에 들어갈 말을 골라보세요"))
                    .bold()
                    .font(.system(size: geometry.size.width * 0.03))
                
                //그림 이미지
                Image(card.subTopicImage[subTopic]!)
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
                            Text("귀가")
                            
                            Button {
                                selectAnswerViewModel.selectAnswerButtonTapped()
                            } label: {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.green)
                                    .frame(width:geometry.size.width * 0.2, height: geometry.size.height * 0.1)
                                //.resizable()
                            }.sheet(isPresented: $selectAnswerViewModel.isSelectAnswerDisplayed) {
                                SelectAnswerView(selectAnswerViewModel: selectAnswerViewModel)
                            }
                        }
                    )

            }//:VStack
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
//            .background(.green)
            
            
            
        }
//        .background(.black)
        

        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            // Quiz 상단 우측 뒤로가기 버튼
            Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
            Text(subTopic)
                .foregroundColor(.black)
        }))
    } //:body
    
}

struct QuizFirst_Previews: PreviewProvider {
    static var previews: some View {
        QuizFirst(card:Card(topic: "피자", color: Color(hex: "25C665"), subTopicList: ["피자"], subTopicImage: ["피자":"pizza 1"]), subTopic: "피자")
    }
}
