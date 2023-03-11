//
//  HomeViewModel.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isProfileDisplayed: Bool = false
    @Published var isRewardDisplayed: Bool = false
    @Published var isPaintDisplayed: Bool = false
    @Published var cardList: [Card]
    
    // ???? 어떤 뜻인지 이해 아직 안됨
    init() {
        self.cardList = [
            Card(topic: "음식", color: Color(hex: "25C665"), subTopicList: foodList, subTopicImage: foodImageDictionary),
            Card(topic: "동물", color: Color(hex: "579AFF"), subTopicList: animalList, subTopicImage: animalImageDictionary),
            Card(topic: "새", color: Color(hex: "FFA800"), subTopicList: birdList, subTopicImage: birdImageDictionary)
        ]
    }
    
    let foodList = ["피자", "우동", "비빔밥", "햄버거", "만두"]
    let foodImageDictionary = ["피자":"pizza 1",
                               "우동":"ramen 1",
                               "비빔밥":"bibimbap 1",
                               "햄버거":"hamburger 1",
                               "만두":"gyoza 1"]
    
    let animalList = ["토끼", "사자", "판다", "돼지", "얼룩말"]
    let animalImageDictionary = ["토끼":"bunny 1",
                                 "사자":"lion 1",
                                 "판다":"panda-bear 1",
                                 "돼지":"pig 1",
                                 "얼룩말":"zebra 1"]
    
    let birdList = ["독수리", "뻐꾸기", "황새", "큰부리새", "부엉이"]
    let birdImageDictionary = ["독수리":"bald-eagle 1",
                               "뻐꾸기":"cuckoo 1",
                               "황새":"stork 1",
                               "큰부리새":"toucan 1",
                               "부엉이":"owl 1"]
    
    
//    var topicList = [
//        Topic(topic: "음식", color: Color(hex: "25C665"), subTopicList: foodList, subTopicImage: foodImageDictionary),
//        Topic(topic: "동물", color: Color(hex: "579AFF"), subTopicList: animalList, subTopicImage: animalImageDictionary),
//        Topic(topic: "새", color: Color(hex: "FFA800"), subTopicList: birdList, subTopicImage: birdImageDictionary)
//    ]
    
    func profileButtonTapped() {
        isProfileDisplayed = true
    }
    
    func rewardButtonTapped() {
        isRewardDisplayed = true
    }
    
    func paintButtonTapped() {
        isPaintDisplayed = true
    }
    
    
}
