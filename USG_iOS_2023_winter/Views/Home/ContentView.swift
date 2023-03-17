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
    @State var currentLine = Line()
    @State var lines: [Line] = []
    @State var thickness: Double = 1.0
    @State var isImageOn:Bool = true
    @State var isPopoverPresented = false
    @State var isQuizHintOn:Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                VStack{
                    ZStack{
                        if isImageOn == true{
                            DrawingHintView(geometry: geometry)
                        }
                        CanvasView(currentLine: $currentLine, lines: $lines, thickness: $thickness, isImageOn: $isImageOn, isPopoverPresented: $isPopoverPresented, isQuizHintOn: $isQuizHintOn, geometry: geometry)
        
                    }
                }
.navigationBarItems(leading:NavigationBarLeadingView(isImageOn: $isImageOn,isQuizHintOn: $isQuizHintOn),trailing:
NavigationBarView(removeLines: $lines,isColorPickerViewPresented: $isPopoverPresented, currentLine: $currentLine))
             }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
