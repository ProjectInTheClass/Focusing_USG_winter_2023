
import SwiftUI

struct QuizSecond: View {
    @StateObject var selectAnswerViewModel = SelectAnswerViewModel()
    @State private var count: String = ""
    @State private var selectedAnswer: String?
    @State private var isCorrectAnswer: Bool? = nil
    @State private var showResult: Bool = false
    
    // Quiz Home
    let card: Card
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var subTopic: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("2/10")
                    .foregroundColor(.gray)
                    .font(.system(size: geometry.size.width * 0.02))
                
                (Text("그림의 ") + Text(subTopic).foregroundColor(.green) + Text("를 보고 빈칸에 들어갈 말을 골라보세요"))
                    .bold()
                    .font(.system(size: geometry.size.width * 0.03))
                
                Image(card.subTopicImage[subTopic]!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                
                VStack {
                    HStack {
                        Text("귀가")
                            .font(.custom("HelveticaNeue", size: 30))
                        Picker("", selection: Binding<String>(
                            get: {selectedAnswer ?? ""},
                            set: {selectedAnswer = $0}
                        )) {
                            ForEach(["기다란", "짧다란", "동그란"], id: \.self) { number in
                                Text(number).tag(number)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                        .clipped()
                        Text("모양이에요.")
                            .font(.custom("HelveticaNeue", size: 30))
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Button {
                            guard let selectedAnswer = selectedAnswer else { return }
                            isCorrectAnswer = (selectedAnswer == "기다란")
                            if isCorrectAnswer == true {
                                showResult = true
                            }
                        } label: {
                            Text("다음")
                                .foregroundColor(.white)
                                .font(.custom("HelveticaNeue", size: 24))
                                .padding()
                                .background((selectedAnswer == nil) ? Color.gray : ((isCorrectAnswer == true) ? Color.green : Color.red))
                                .cornerRadius(15)
                        }
                        .padding()
                        .disabled(selectedAnswer == nil)
                        
                        if let isCorrectAnswer = isCorrectAnswer {
                            if !isCorrectAnswer {
                                    Text("오답입니다!")
                                        .foregroundColor(.red)
                                        .font(.custom("HelveticaNeue-Bold", size: 28))
                                        .padding(.leading, 10)
                            }
                        }
                    }
                    
                    NavigationLink(destination: QuizSecond(card: card, subTopic: subTopic), isActive: $showResult) {
                        EmptyView()
                    }
                    .isDetailLink(false) // ADD THIS LINE
                }


                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
            })
        )
    }
}
