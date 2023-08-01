//
//  QuizData.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/07/04.
//

import Foundation

struct QuizData{
    static let rabbitQuiz:QuizModel = QuizModel(quizTopic: "토끼", quizTopicImage: "bunny 1", quizFirst: ["귀가", "귀가"], quizSecond: ["있어요", "모양이에요"], quizAnswer: AnswerModel(answer: ["2개","기다란"], dummyAnswer: [["1개","2개","3개"], ["기다란","네모난","동그란"]]))
    
    static let Quizs:[String:QuizModel] = ["토끼":rabbitQuiz]
}

// 추가 예정
