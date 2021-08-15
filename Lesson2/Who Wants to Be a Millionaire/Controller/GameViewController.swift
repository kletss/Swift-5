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
    
    let singleton = SingletonQuestionsUser.quest
    
    @IBAction func backTouch(_ sender: Any) {
//        saveGame()
        dismiss(animated: true, completion: nil)

    }
    
    var onGameEnd: ((GameSession) -> (Void))?
    
    var questionUses: QuestionUses = .normal

    
    private var idQuestion = Observable<Int>(0)
    
    private var summa: Int = 0
    private var fiftyBool: Bool = false
    

    private var QQ : [Question] = []

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ansAButton: UIButton!
    @IBOutlet weak var ansAFrame: UIImageView!
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var ansBButton: UIButton!
    @IBOutlet weak var ansBFrame: UIImageView!
    @IBOutlet weak var BLabel: UILabel!
    @IBOutlet weak var ansCButton: UIButton!
    @IBOutlet weak var ansCFrame: UIImageView!
    @IBOutlet weak var CLabel: UILabel!
    @IBOutlet weak var ansDButton: UIButton!
    @IBOutlet weak var ansDFrame: UIImageView!
    @IBOutlet weak var DLabel: UILabel!
    
    @IBOutlet weak var summaMoneyLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var numberQuestionLabel: UILabel!
    @IBOutlet weak var procAnswerLabel: UILabel!
    
    @IBOutlet weak var fiftyButton: UIButton!
    
    @IBAction func fiftyTouch(_ sender: UIButton) {
        self.fiftyBool = true
        sender.setImage(UIImage(named: "fiftyTrue")!, for: .normal)
        sender.isEnabled = false
        fiftyTrue()
    }
    
    @IBAction func answerTouch(_ sender: UIButton) {
        guard let ans = sender.titleLabel?.text! else { return }
        let Q = QQ[idQuestion.value]
        
        let result = Q.answers.filter{$0.answer == ans}
        print("Answer = ",result[0].correct)
        
        if result[0].correct {
            summa = summa + Q.summa
            self.summaMoneyLabel.text = String(summa)
            
            if self.idQuestion.value + 1 < QQ.count {
                self.idQuestion.value += 1
                getQuestion()
            } else {
                saveGame(endGame: true)
                dismiss(animated: true, completion: nil)
            }
        } else {
            saveGame(endGame: true)
            dismiss(animated: true, completion: nil)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.QQ = createQuestion().quest() + singleton.questionsUser
        getQuestion()
        summaMoneyLabel.text = String(summa)
                
        idQuestion.addObserver(self, options: [.new, .initial], closure: { [weak self] (idQ, _) in
            guard let self = self else { return }
            self.numberQuestionLabel.text = "Вопрос №: \(idQ+1) из \(self.QQ.count)"
            self.moneyLabel.text = "Стоимость \(self.QQ[idQ].summa) руб"
            let proc = Int((Double(idQ) / Double(self.QQ.count)) * 100)
            self.procAnswerLabel.text = "Правильных ответов \(proc) %"
            
            for i in 0..<(4 - 1) {
                let j = Int(arc4random_uniform(UInt32(4 - i))) + i
                self.QQ[idQ].answers.swapAt(i, j)
            }

        })
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
                             correctAnswer: idQuestion.value,
                             date: Date(),
                             fifty: fiftyBool,
                             endGame: endGame
        )
        onGameEnd?(gs)
    }

    
    private func getQuestion() {
        let Q = QQ[idQuestion.value]
        
        ansAisHidden(bool: false)
        ansBisHidden(bool: false)
        ansCisHidden(bool: false)
        ansDisHidden(bool: false)
        
        questionLabel.text = Q.question

        ansAButton.setTitle(Q.answers[0].answer, for: .normal)
        ansBButton.setTitle(Q.answers[1].answer, for: .normal)
        ansCButton.setTitle(Q.answers[2].answer, for: .normal)
        ansDButton.setTitle(Q.answers[3].answer, for: .normal)

    }
    
    
    private func fiftyTrue () {
        let Q = QQ[idQuestion.value]
        let ansCount = Q.answers.count
        var j:Int
        var j1:Int = -1
        for _ in 0..<2{
            repeat {
                j = Int(arc4random_uniform(UInt32(ansCount)))
            } while (Q.answers[j].correct) || (j1 == j)
            print(j, Q.answers[j].correct)
            j1 = j
            switch j {
            case 0:
                ansAisHidden(bool: true)
            case 1:
                ansBisHidden(bool: true)
            case 2:
                ansCisHidden(bool: true)
            case 3:
                ansDisHidden(bool: true)
            default:
                break
            }
        }
    }
    
    private func ansAisHidden (bool: Bool) {
        ansAButton.isHidden = bool
        ansAFrame.isHidden = bool
        ALabel.isHidden = bool
    }
    private func ansBisHidden (bool: Bool) {
        ansBButton.isHidden = bool
        ansBFrame.isHidden = bool
        BLabel.isHidden = bool
    }
    private func ansCisHidden (bool: Bool) {
        ansCButton.isHidden = bool
        ansCFrame.isHidden = bool
        CLabel.isHidden = bool
    }
    private func ansDisHidden (bool: Bool) {
        ansDButton.isHidden = bool
        ansDFrame.isHidden = bool
        DLabel.isHidden = bool
    }
    
    
    private func createQuestion() -> QuestionStrategy {
        switch questionUses {
        case .normal:
            return NotRandomQuestion()
        case .random:
            return RandomQuestion()
        }
    }
    
}

