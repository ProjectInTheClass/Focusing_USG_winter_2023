//
//  DrawingHintView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/28.
//

import SwiftUI

struct DrawingHintView: View {
    let geometry: GeometryProxy
    var body: some View {
 
            Image("yellow.car")//데이터에 있는 사진 이름 가져올 예정
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .frame(width:geometry.size.width , height: geometry.size.height-geometry.safeAreaInsets.top-100)
        
    }
}

