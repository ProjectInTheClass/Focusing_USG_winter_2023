//  ProfileView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedProfile: Int
    
    let profiles = [
        Profile(imageName: "User1", name: "최의진"),
        Profile(imageName: "User2", name: "문창재"),
        Profile(imageName: "User3", name: "윤예진"),
        Profile(imageName: "User4", name: "강주성")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                CircleImage(image: Image(profiles[selectedProfile].imageName))
                    .frame(width: 200, height: 200)
                
                Text(profiles[selectedProfile].name)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                HStack {
                    ForEach(0..<profiles.count) { index in
                        Button(action: {
                            self.selectedProfile = index
                        }) {
                            CircleImage(image: Image(profiles[index].imageName))
                                .frame(width: 50, height: 50)
                                .padding(.horizontal)
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("완료")
                        .frame(width:200, height:50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationBarTitle("프로필")
            
        }
    }
}

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}
