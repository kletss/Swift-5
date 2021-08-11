//
//  RoudingEdges.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import UIKit

class RoudingEdgesView: UIView {
   @IBInspectable var borderColor: UIColor = .gray
   @IBInspectable var borderWidth: CGFloat = 1.5
   @IBInspectable var borderRouding: CGFloat = 3
   
   override func awakeFromNib() {
       self.layer.cornerRadius = self.frame.height / borderRouding
       self.layer.masksToBounds = true
       self.layer.borderWidth = borderWidth
       self.layer.borderColor = borderColor.cgColor
           }
   
}

class RoudingEdgesButton: UIButton{
   @IBInspectable var borderColor: UIColor = .white
   @IBInspectable var borderWidth: CGFloat = 1.5
  
  override func awakeFromNib() {
      self.layer.cornerRadius = self.frame.height / 3
      self.layer.masksToBounds = true
      self.layer.borderWidth = borderWidth
      self.layer.borderColor = borderColor.cgColor
          }
  
}
