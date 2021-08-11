//
//  ResultViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 08.08.2021.
//

import UIKit

class ResultViewController: UIViewController {

    private let singletonGame = SingletonGame.game

    @IBAction func backTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH.mm"
        return df
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ResultTableViewCell")
        

    }
    
    
    //Calucate percentage
    public func calculatePercent(valIn:Double,valAll:Double)->Double{
        let val = valIn / valAll
        return val * 100.0
    }

}

extension ResultViewController: UITableViewDelegate {
    
}

extension ResultViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singletonGame.records.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell
        else { return UITableViewCell() }
        
        
        let perc = calculatePercent(valIn: Double(singletonGame.records[indexPath.row].correctAnswer),
                                    valAll: Double(singletonGame.records[indexPath.row].countQuestion))
        let date = dateFormatter.string(from: singletonGame.records[indexPath.row].date)
        let summa = "Выиграл: \(singletonGame.records[indexPath.row].summa)руб"
        let cc = "Правильных ответов: \(perc)%  ->  \(singletonGame.records[indexPath.row].correctAnswer) из \(singletonGame.records[indexPath.row].countQuestion)"
        
        var fiftyImage = UIImage(named: "fifty")!
        if singletonGame.records[indexPath.row].fifty == true {
            fiftyImage = UIImage(named: "fiftyTrue")!
        }
        
        
        cell.configurate(data: date, cc: cc, summa: summa, fiftyIm: fiftyImage)
        
        
        return cell
    }
    
}
