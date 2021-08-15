//
//  RandomQuestion.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 10.08.2021.
//

import Foundation

class RandomQuestion: QuestionStrategy {
    func quest () -> [Question] {
        let qc = questions.count
        for i in 0..<(qc  - 1) {
            let j = Int(arc4random_uniform(UInt32(qc - i))) + i
            questions.swapAt(i, j)
        }
        return questions
    }
    
}
