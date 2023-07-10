//
//  CanvasView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/28.
//

import SwiftUI

struct CanvasView: View {
    @Binding var currentLine:Line
    @Binding var lines: [Line]
    @Binding var thickness: Double
    @Binding var isImageOn:Bool
    @Binding var isPopoverPresented:Bool
    @Binding var isQuizHintOn:Bool
    
    let geometry:GeometryProxy
    
    var body: some View {
        Canvas { context, size in
        
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
            
        }
        .frame(width:geometry.size.width , height: geometry.size.height-geometry.safeAreaInsets.top-50)
        
            .border(Color.green)
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newPoint = value.location
            currentLine.points.append(newPoint)
            self.lines.append(currentLine)
        }).onEnded({ value in
            self.lines.append(currentLine)
            self.currentLine = Line(points: [],color: currentLine.color, lineWidth: currentLine.lineWidth )
        })
        
        )
    }
}

