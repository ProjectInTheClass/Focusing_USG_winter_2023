//
//  ColorPickerView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/17.
//

import Foundation

import SwiftUI

struct ColorPickerView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    let Thickness:[Double] = [1,2,3,4]
    @Binding var selcetedThickness:Double
    let thickCircle:[String] = [Constants.Icons.circle_1, Constants.Icons.circle_2, Constants.Icons.circle_3, Constants.Icons.circle_4]
    
    
    var body: some View {
        VStack{
            HStack {
                ForEach(colors, id: \.self) { color in
                    
                    Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                        .foregroundColor(color)
                        .font(.system(size: 16))
                        .clipShape(Circle())
                        .onTapGesture {
                            selectedColor = color
                        }
                }
                
                
            }
            
            HStack{
                ForEach(Thickness, id: \.self) { Thicks in
                    Image(systemName: selcetedThickness == Thicks ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                        .foregroundColor(.black)
                        .onTapGesture {
                            selcetedThickness = Thicks
                        }
                    
                    
                }
            }
        }
    }
    struct DrawSettingView_Previews: PreviewProvider {
        static var previews: some View {
            ColorPickerView(selectedColor: .constant(.blue), selcetedThickness: .constant(1.0))
        }
    }
}
