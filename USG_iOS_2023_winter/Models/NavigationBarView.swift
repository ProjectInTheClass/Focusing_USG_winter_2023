//
//  NavigationBarView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/25.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var removeLines:[Line]
    @Binding var isColorPickerViewPresented:Bool
    @Binding var currentLine:Line
    
    var body: some View {
        HStack(spacing:20){
Image(systemName: "trash")// 전체 지우개
.onTapGesture {
removeLines = []
}
Button(action: {
isColorPickerViewPresented = true
}, label: {
    Image(systemName: "paintpalette").foregroundColor(.black)
})
.popover(isPresented: $isColorPickerViewPresented, arrowEdge: .top) {
ColorPickerView(selectedColor: $currentLine.color, selcetedThickness: $currentLine.lineWidth)
}
Image(systemName: "arrowshape.turn.up.backward.badge.clock")// undo 지우개
.onTapGesture {
removeLines.removeLast() // lines가 비어었을 때 undo 누를 시 크래쉬
}
            Button(action: {
                // Button action here
            }) {
                Text("완료")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 100)
                    .background(Color.green)
                    .cornerRadius(10)
            }
}
    }
}


