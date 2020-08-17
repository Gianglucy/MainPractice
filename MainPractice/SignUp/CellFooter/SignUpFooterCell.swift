//
//  SignUpFooterCell.swift
//  MainPractice
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class SignUpFooterCell: UITableViewCell {

    @IBOutlet weak var viewSignUpFooter: SignUpFooterView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        viewSignUpFooter.btnNext.layer.cornerRadius = 8
        viewSignUpFooter.lblText.text = "Indicates a required field"
        viewSignUpFooter.lblText.alpha = 0.5
    }
    
}
