//
//  CardView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        
        HStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment: .leading){
                    
                    Text(card.topic)
                        .font(.title)
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(card.subTopicList, id:\.self) { subTopic in
                                
                                CardQuizView(card: card, subTopic: subTopic)
                                
//                                ZStack {
//
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(card.color)
//                                        .frame(width: 200, height: 150)
//                                        .overlay(
//                                            Text(subTopic)
//                                                .font(.title2)
//                                                .bold()
//                                                .foregroundColor(Color.white)
//                                                .padding(.all, 15)
//                                                .frame(width:200, height:150, alignment: .topLeading)
//                                        )
//
//
//                                    Image(card.subTopicImage[subTopic] ?? "")
//                                        .frame(width: 200, height: 150, alignment: .bottomTrailing)
//                                        .padding(.bottom, 25)
//                                        .padding(.trailing, 20)
//
//                                    //.padding(.trailing, 10)
//
//                                } //: ZStack
                                
                            } //: Loop
                            
                        } //: LazyHStack
                        
                    } //: ScrollView
                    
                    Divider()
                        .padding(.bottom, 10)
                        .padding(.top)
                    
                } //: LazyVStack
                .padding()
                
            } //: ScrollView
            
        } //: HStack
        
    } //: body
    
}









//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}



