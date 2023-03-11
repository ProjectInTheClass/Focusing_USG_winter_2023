//
//  SelectAnswerView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/03/04.
//

import SwiftUI

struct SelectAnswerView: View {
    @StateObject var selectAnswerViewModel: SelectAnswerViewModel
    @State var isClicked: [Bool] = [false, false, false]
    
    var body: some View {
        VStack {
            Text("빈칸에 들어갈 말을 골라보세요")
                .font(.headline)
                .padding()
            
            Text("귀가")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ForEach(0..<3) { num in
                Button(action: {
                    isClicked[num].toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isClicked[num] ? Color.green : Color.gray)
                            .frame(height: 50)
                            .animation(.spring())
                        
                        HStack {
                            Text("\(num)개")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            Spacer()
                            
                            if isClicked[num] {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                })
                .padding(.vertical, 5)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .shadow(radius: 2, y: 2)
            }
            
            Button(action: {}, label: {
                Text("확인")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            })
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .shadow(radius: 2, y: 2)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .shadow(radius: 2, y: 2)
    }
}

//struct SelectAnswerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectAnswerView()
//    }
//}
