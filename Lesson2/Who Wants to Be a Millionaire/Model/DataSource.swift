//
//  DataSource.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import Foundation

var questions: [Question] = [
    Question(summa: 100,
             question: "Сумма единицы?",
             answers: [Answer(answer: "1", correct: true),
                       Answer(answer: "2", correct: false),
                       Answer(answer: "3", correct: false),
                       Answer(answer: "4", correct: false),
             ]),
    Question(summa: 200,
             question: "Какую фамилию носил главный герой поэмы А. Твардовского?",
             answers: [Answer(answer: "Тёркин", correct: true),
                       Answer(answer: "Твардовский", correct: false),
                       Answer(answer: "Толстой", correct: false),
                       Answer(answer: "Тыквин", correct: false),
             ]),
    Question(summa: 300,
             question: "Сколько педалей у автомобиля с автоматической коробкой передач?",
             answers: [Answer(answer: "Две", correct: true),
                       Answer(answer: "Одна", correct: false),
                       Answer(answer: "Три", correct: false),
                       Answer(answer: "Четыре", correct: false),
             ]),
    Question(summa: 400,
             question: "Что коллекционирует филуменист?",
             answers: [Answer(answer: "Спичечные коробки", correct: true),
                       Answer(answer: "Фотографии", correct: false),
                       Answer(answer: "Марки", correct: false),
                       Answer(answer: "Картины", correct: false),
             ]),
    Question(summa: 500,
             question: "Что никогда не вырастет на дереве?",
             answers: [Answer(answer: "Арбуз", correct: true),
                       Answer(answer: "Шишка", correct: false),
                       Answer(answer: "Груша", correct: false),
                       Answer(answer: "Слива", correct: false),
             ]),
]
