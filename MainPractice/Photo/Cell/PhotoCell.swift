//
//  PhotoCell.swift
//  MainPractice
//
//  Created by Apple on 7/17/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var myIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myIMG.contentMode = .scaleAspectFill
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myIMG.image = nil
    }
    
    func setupUI() {
        self.contentView.addSubview(myIMG)
        myIMG.translatesAutoresizingMaskIntoConstraints = false
        myIMG.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        myIMG.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        myIMG.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        myIMG.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func configWithImage(_ image: UIImage?) {
                self.myIMG.image = image
    }
}
