//
//  QuestionStrategy.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 10.08.2021.
//

import UIKit

protocol QuestionStrategy: AnyObject {
    func quest () -> [Question]
}

