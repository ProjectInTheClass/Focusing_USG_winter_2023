//
//  ContentView.swift
//  TestField
//
//  Created by 문창재 on 2023/02/09.
//

import SwiftUI
struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct ContentView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var thickness: Double = 1.0
    @State var isImageOn:Bool = true
    
    var body: some View {
        VStack{
            ZStack{
                if isImageOn == true{
                    Image("rabbit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.2)
                    
                }
                 
                Canvas { context, size in
                
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                        // addLines말고 addRoundRect 사용하고 싶음 -> 끝이 둥근 선분
                    }
                    
                }
                .frame(minWidth: 400, minHeight: 400)
                
                    .border(Color.blue)
                .gesture(DragGesture(minimumDistance/*설정거리 이상 움직여야 작동*/: 0, coordinateSpace: .local).onChanged({ value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                    //print(currentLine)
                }).onEnded({ value in
                    self.lines.append(currentLine)
                    self.currentLine = Line(points: [],color: currentLine.color, lineWidth: currentLine.lineWidth )// 커서를 떼는 시점에서 포인트를 다시 지움
                    // 이 문장이 없으면 커서를 뗄 때 마지막 포인트가 어레이에 남아있고 다시 그림을 그리려 커서를 올리면 마지막 지점 - 커서 올린 지점 패스에 라인이 생성됨.
                    //print(currentLine , "ended")
                })
                
                )
                
                
            }
            
            HStack{
                Image(systemName: "trash")// 전체 지우개
                    .onTapGesture {
                        lines = []
                    }
                ColorPickerView(selectedColor: $currentLine.color, selcetedThickness: $currentLine.lineWidth)
                    .onChange(of: currentLine.color) { newColor in
                        //print(newColor)
                        currentLine.color = newColor
                }
                Toggle("  미리보기", isOn: $isImageOn).frame(width: 140)
                
                Image(systemName: "trash")// undo 지우개
                    .onTapGesture {
                        lines.removeLast() // lines가 비어었을 때 undo 누를 시 크래쉬
                    }
                
            }
            
        }
            
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
