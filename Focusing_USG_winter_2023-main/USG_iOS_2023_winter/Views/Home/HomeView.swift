//
//  HomeView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var selectedProfile = 0
    let customWidth = 0.4
    let cutomHeight = 0.09
    
    var body: some View {
        NavigationView {
            HStack {
                GeometryReader { geometry in
                    
                    VStack {
                        Spacer()
                        
                        Image(profiles[selectedProfile].imageName)
                            .resizable()
                            .frame(width:geometry.size.width / 2, height: geometry.size.height / 7)
                        //.frame(width:122, height: 122)
                        Text(profiles[selectedProfile].name)
                            .font(.system(size: geometry.size.width * 0.075))
                            .bold()
                        //.padding(.top, 3)
                        
                        // 프로필 편집 버튼
                        Button {
                            viewModel.profileButtonTapped()
                        } label: {
                            Image("Group 3")
                                //.resizable()
                        }.sheet(isPresented: $viewModel.isProfileDisplayed) {
                            ProfileView(selectedProfile: $selectedProfile)
                        }
                        
                        //.padding(.top, 6)
                        
                        Divider()
                        
                        
                        Text("오늘의 학습")
                            .font(.title2)
                        
                        ZStack(alignment: .top) {
                            
                            VStack(spacing: 45) {
                                Image("stamp 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:geometry.size.width * customWidth, height: geometry.size.height * cutomHeight)
                                    .blendMode(.luminosity)
                                    .overlay(
                                        Text("출석")
                                            .font(.system(size: 16, weight: .medium))
                                            .frame(height: 130, alignment: .bottom)
                                    )
                                
                                Image("stamp 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:geometry.size.width * customWidth, height: geometry.size.height * cutomHeight)
                                    .blendMode(.luminosity)
                                    .overlay(
                                        Text("퀴즈")
                                            .font(.system(size: 16, weight: .medium))
                                            .frame(height: 130, alignment: .bottom)
                                    )
                                
                                Image("stamp 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:geometry.size.width * customWidth, height: geometry.size.height * cutomHeight)
                                    .blendMode(.luminosity)
                                    .overlay(
                                        Text("그리기")
                                            .font(.system(size: 16, weight: .medium))
                                            .frame(height: 130, alignment: .bottom)
                                    )
                            } //:VStack
                            .padding(.bottom, 50)
                            
                            
                            Image("Vector 1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:geometry.size.width * customWidth, height: geometry.size.height * cutomHeight)
     
                                //.frame(width: 500, height:  500)
                        } //:ZStack
                        
                        
                        // 획득한 뱃지 버튼
                        Button {
                            viewModel.rewardButtonTapped()
                        } label: {
                            Image("Group 4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:geometry.size.width * (customWidth + 0.2) , height: geometry.size.height * cutomHeight )
                                .frame(alignment: .bottom)
                        }.sheet(isPresented: $viewModel.isRewardDisplayed) {
                            RewardView()
                        }
                        
                        
//                        // 그림판 버튼
//                        Button {
//                            viewModel.paintButtonTapped()
//                        } label: {
//                            Text("그림판")
//                                .font(.title2)
//                                .foregroundColor(Color.white)
//                                .padding()
//                                .background(Color.blue)
//                                .cornerRadius(10)
//                                .padding(.vertical)
//
//
//
//                        }.sheet(isPresented: $viewModel.isPaintDisplayed) {
//                            ContentView()
//                                .background(.gray.opacity(0.5))
//                                .frame(width: .infinity, height: 80)
//
//                        }
                        
                        Spacer()
                        
                        
                        
                    } //: VStack
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                    .background(Color.cyan)
                    
                    
                    
                    //.padding(30)
                    //.padding(.leading, 10)
                } //: GeometryReader

//                Divider()
//                    .frame(alignment:.leading)
//                    .background(Color.red)
                

                VStack(alignment:.leading) {
                    
                    Text("퀴즈와 그리기")
                        .bold()
                        .font(.largeTitle)
                        .padding(10)
                    
                    HStack {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(alignment: .leading){
                                
                                ForEach(viewModel.cardList, id:\.self) { card in
                                    CardView(card: card)
                                } //: Loop
                            } //: LazyVStack
                            
                        } //: ScrollView
                        
                    } //: HStack
                } //: VStack
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: UIScreen.main.bounds.width * 0.8)
                
                
            }//: HStack
            
        }//: NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    } //: body
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

