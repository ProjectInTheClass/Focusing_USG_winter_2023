//
//  CardQuizView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct CardQuizView: View {
    let card: Card
    @State var subTopic: String

    var body: some View {
        
        // Quiz 시작
        NavigationLink {
            QuizFirst(card: card, subTopic: subTopic)
        } label: {
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(card.color)
                    .frame(width: 200, height: 150)
                    .overlay(
                        Text(subTopic)
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(.all, 15)
                            .frame(width:200, height:150, alignment: .topLeading)
                    )
                
                
                Image(card.subTopicImage[subTopic] ?? "")
                    .frame(width: 200, height: 150, alignment: .bottomTrailing)
                    .padding(.bottom, 25)
                    .padding(.trailing, 20)
                
                //.padding(.trailing, 10)
                
            } //: ZStack
        } //: NavigationLink
        //.navigationBarTitle(subTopic)

        
//        .navigationBarItems(leading:
//            Button(action: {
//
//        }) //:action
//        {
//            HStack {
//                Image(systemName:"chevron.left")
//                Text("wow")
//             } //:HStack
//            } //: Button
//        ) //:navigationBarItems
        

            
    }
}

//struct CardQuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardQuizView()
//    }
//}
