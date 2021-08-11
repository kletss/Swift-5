//
//  GameViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import UIKit

//delegat  передача
//protocol saveGame: AnyObject {
//    func didsaveGame(gs: GameSession)
//}

class GameViewController: UIViewController {

//delegat  передача
//    weak var saveGameDelegate: saveGame?
    
    @IBAction func backTouch(_ sender: Any) {
//        saveGame()
        dismiss(animated: true, completion: nil)

    }
    
    var onGameEnd: ((GameSession) -> (Void))?
    
    private var idQuestion: Int = 0
    private var summa: Int = 0
    private var fiftyBool: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ansAButton: UIButton!
    @IBOutlet weak var ansBButton: UIButton!
    @IBOutlet weak var ansCButton: UIButton!
    @IBOutlet weak var ansDButton: UIButton!
    
    @IBOutlet weak var summaMoneyLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    @IBOutlet weak var fiftyButton: UIButton!
    
    @IBAction func fiftyTouch(_ sender: UIButton) {
        self.fiftyBool = true
        sender.setImage(UIImage(named: "fiftyTrue")!, for: .normal)
    }
    
    @IBAction func answerTouch(_ sender: UIButton) {
        guard let ans = sender.titleLabel?.text! else { return }
        let Q = questions[idQuestion]
        
        let result = Q.answers.filter{$0.answer == ans}
        print("Answer = ",result[0].correct)
        
        if result[0].correct {
            summa = summa + Q.summa
            self.summaMoneyLabel.text = String(summa)
            self.idQuestion += 1
            getQuestion(id: self.idQuestion)
        } else {
            saveGame(endGame: true)
            dismiss(animated: true, completion: nil)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        getQuestion(id: idQuestion)
        summaMoneyLabel.text = String(summa)
//        saveGame()
        
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
    
    
    private func saveGame (endGame: Bool = true) {
        let gs = GameSession(summa: summa,
                             countQuestion: questions.count,
                             correctAnswer: idQuestion,
                             date: Date(),
                             fifty: fiftyBool,
                             endGame: endGame
        )
        onGameEnd?(gs)
    }

    
    private func getQuestion(id idQuestion: Int) {
        var Q = questions[idQuestion]
        let ansCount = Q.answers.count
        
        questionLabel.text = Q.question
        moneyLabel.text = "Вопрос на \(Q.summa) руб"
             
        for i in 0..<(ansCount - 1) {
            let j = Int(arc4random_uniform(UInt32(ansCount - i))) + i
            Q.answers.swapAt(i, j)
        }
        
        ansAButton.setTitle(Q.answers[0].answer, for: .normal)
        ansBButton.setTitle(Q.answers[1].answer, for: .normal)
        ansCButton.setTitle(Q.answers[2].answer, for: .normal)
        ansDButton.setTitle(Q.answers[3].answer, for: .normal)

    }

}

