//
//  SetupViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 10.08.2021.
//

import UIKit

class SetupViewController: UIViewController {

    
    @IBAction func backTouch(_ sender: Any) {
        onQuestionUses?(selectedQuestionSetControl)

        dismiss(animated: true, completion: nil)
    }
    
    var onQuestionUses: ((QuestionUses) -> (Void))?
    

    
    @IBOutlet weak var questionSetControl: UISegmentedControl!
    
    
    lazy var setControl: QuestionUses = .normal
    
    private var selectedQuestionSetControl: QuestionUses {
        switch questionSetControl.selectedSegmentIndex {
        case 0:
            return .normal
        case 1:
            return .random
        default:
            return .normal
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        questSetControl()
        // Do any additional setup after loading the view.
    }
   
    private func questSetControl() {
        switch setControl {
        case .normal:
            questionSetControl.selectedSegmentIndex = 0
        case .random:
            questionSetControl.selectedSegmentIndex = 1
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    
    
}
