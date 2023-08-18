//
//  QuizRewardView.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/08/18.
//

import SwiftUI

struct QuizRewardView: View {
    var body: some View {
        //맞힌 개수 따라 조건문 작성
        GoldRewardView()
    }
}
struct GoldRewardView: View {
    var body: some View{
        NavigationStack{
            VStack{
                Image("bunnyRewardGold")
                Text("8문제 맞혔어요")
                Text("금뱃지 획득!")
                    .font(.title)
                NavigationLink("그림 그리기") {
                    DummyVIew()
                }
            }
        }
    }
}

struct SilverRewardView: View {
    var body: some View{
        NavigationStack{
            VStack{
                Image("bunnyRewardSilver")
                Text("5문제 맞혔어요")
                Text("은뱃지 획득!")
                    .font(.title)
                NavigationLink("그림 그리기") {
                    DummyVIew()
                }
            }
        }
    }
}

struct BronzeRewardView: View {
    var body: some View{
        NavigationStack{
            VStack{
                Image("bunnyRewardBronze")
                Text("2문제 맞혔어요")
                Text("동뱃지 획득!")
                    .font(.title)
                NavigationLink("그림 그리기") {
                    DummyVIew()
                }
            }
        }
    }
}

struct QuizRewardView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRewardView()
    }
}
