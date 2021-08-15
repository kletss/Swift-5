//
//  AddQuestionViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 11.08.2021.
//

import UIKit

class AddQuestionViewController: UIViewController {

    let singleton = SingletonQuestionsUser.quest
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var answer1Label: UITextField!
    @IBOutlet weak var answer2Label: UITextField!
    @IBOutlet weak var answer3Label: UITextField!
    @IBOutlet weak var answer4Label: UITextField!
    @IBOutlet weak var summaLabel: UITextField!
    
    @IBOutlet weak var questionLabel: UITextView!
    

    @IBAction func saveTouch(_ sender: UIButton) {
        saveQuestion()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func loadQuestion() {
        var Q = [Question]()
        Q = singleton.questionsUser
    }
    
    private func saveQuestion() {
        let Q = Question(summa: Int(self.summaLabel.text!)!,
                         question: self.questionLabel.text,
                         answers: [Answer(answer: self.answer1Label.text!, correct: true),
                                   Answer(answer: self.answer2Label.text!, correct: false),
                                   Answer(answer: self.answer3Label.text!, correct: false),
                                   Answer(answer: self.answer4Label.text!, correct: false),
                         ])
        singleton.addQuestion(quest: Q)
    }
    
}
