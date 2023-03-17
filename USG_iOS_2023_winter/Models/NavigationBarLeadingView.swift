//
//  NavigationBarLeadingView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/25.
//

import SwiftUI

struct NavigationBarLeadingView: View {
    @Binding var isImageOn:Bool
    @Binding var isQuizHintOn:Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "questionmark.circle").onTapGesture {
                isQuizHintOn = true
            }
            .popover(isPresented: $isQuizHintOn) {
                QuizHintView()
            }
            Toggle("  미리보기", isOn: $isImageOn)
                            .toggleStyle(CustomToggleStyle(onImage: Image(systemName: "eye.slash"), offImage: Image(systemName: "eye")))
        }
        
        
    }
}

struct CustomToggleStyle: ToggleStyle {
    var onImage: Image
    var offImage: Image
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            if configuration.isOn {
                onImage.foregroundColor(.black)
            } else {
                offImage.foregroundColor(.black)
            }
        }
    }
}
