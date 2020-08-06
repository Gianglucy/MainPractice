//
//  HobbiesCell.swift
//  MainPractice
//
//  Created by Apple on 8/4/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class HobbiesCell: UICollectionViewCell {

    @IBOutlet weak var lblHobbies: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        viewBackground.layer.cornerRadius = 26
    }
    
    func configCell(name: String) {
        lblHobbies.text = name
    }

}
