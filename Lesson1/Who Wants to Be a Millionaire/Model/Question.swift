//
//  Question.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import Foundation


struct Answer {
    var answer: String
    var correct: Bool
}

struct Question {
    var summa: Int
    var question: String
    var answers: [Answer]
}
