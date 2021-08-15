//
//  ResultTableViewCell.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 08.08.2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var ccLabel: UILabel!
    @IBOutlet weak var summaLabel: UILabel!
    @IBOutlet weak var fiftyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configurate(data: String,
                   cc: String,
                   summa: String,
                   fiftyIm: UIImage) {
        dataLabel.text = data
        ccLabel.text = cc
        summaLabel.text = summa
        fiftyImage.image = fiftyIm
    }
    
}

