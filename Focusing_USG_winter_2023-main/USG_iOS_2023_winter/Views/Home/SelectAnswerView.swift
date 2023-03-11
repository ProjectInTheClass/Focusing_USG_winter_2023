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
            Text("귀가")
            ForEach(0..<3) { num in
                Button {
                    isClicked[num] = true
                } label: {
                    if isClicked[num] {
                        Rectangle()
                            .fill(.white)
                            .padding()
                            .border(.green, width: 2)
                            .cornerRadius(10)
                            .overlay(
                                Text("\(num)") + Text("개")
                            )
                    }else {
                        Rectangle()
                            .fill(.white)
                            .padding()
                            .border(.gray, width: 2)
                            .cornerRadius(10)
                            .overlay(
                                Text("\(num)") + Text("개")
                            )
                    }
                        

                    
                }

            }
        }
    }
}

//struct SelectAnswerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectAnswerView()
//    }
//}
