//
//  SignUpHeaderCell.swift
//  MainPractice
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class SignUpHeaderCell: UITableViewCell {

    @IBOutlet weak var viewSignUpHeader: SignUpHeaderView!
    
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
          setupUI()
      }
      
      func setupUI() {
      }
      
      func configCellFirst() {
      }
      
      func configCell() {
        viewSignUpHeader.lblFirstText.text = "Nice to meet you!"
        viewSignUpHeader.lblSecondText.text = "Please tell us about yourself."
      }
    
}
