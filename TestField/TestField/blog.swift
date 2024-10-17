//
//  blog.swift
//  TestField
//
//  Created by 문창재 on 2023/02/26.
//

import SwiftUI
struct TestLine{
    var points = [CGPoint]()
}

struct blog: View {
    
    @State private var currentLine = TestLine()
    @State private var Lines:[TestLine] = []
    
    var body: some View {
        
        Canvas{
            context, size in
            for line in Lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(.black), lineWidth: 1)
            }
            
        }.gesture(DragGesture().onChanged({ value in
            let newPoint = value.location
            currentLine.points.append(newPoint)
            self.Lines.append(currentLine)
            
        }).onEnded({ value in
            currentLine.points = []
        })
        )
    }
}

struct blog_Previews: PreviewProvider {
    static var previews: some View {
        blog()
    }
}
