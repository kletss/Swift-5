//
//  TitleViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import UIKit

class TitleViewController: UIViewController {
    
    private let singletonGame = SingletonGame.game

    @IBAction func deleteResultTouch(_ sender: Any) {
        singletonGame.clearResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Передача данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segueGame":
//            guard segue.identifier == "segueGame" else { return }
            guard let destination = segue.destination as? GameViewController else { return }
            destination.questionUses = self.singletonGame.questionUses
            destination.onGameEnd = { [weak self] (res) in
                guard let self = self else {return}
                self.singletonGame.addResult(result: res)
            }
        //delegat  передача
        //        destination.saveGameDelegate = self
        
        case "segueResult":
//            guard segue.identifier == "segueResult" else { return }
            guard let destination = segue.destination as? ResultViewController else { return }
            
        case "segueSetup":
            guard let destination = segue.destination as? SetupViewController else { return }
            destination.setControl = self.singletonGame.questionUses
            
            destination.onQuestionUses = {[weak self] (res) in
                guard let self = self else {return}
                self.singletonGame.questionUses = res
            }
        
        default:
            break
  
        }
    }
    


    
}
//delegat  передача
//extension TitleViewController: saveGame {
//    func didsaveGame(gs: GameSession) {
//        let summa = gs.summa
//        let countQuestion = gs.countQuestion
//        let correctAnswer = gs.correctAnswer
//        let correctProc = gs.correctProc
//        let date = gs.date
//
//    }
//
//}
