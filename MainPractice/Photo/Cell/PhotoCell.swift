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
    
    func configWithImage(imageAsset: PHAsset) {
                self.myIMG.image = getUIImage(asset: imageAsset)
    }
    
    func getUIImage(asset: PHAsset) -> UIImage? {
        
        var img: UIImage?
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 200.0, height: 200.0), contentMode: .aspectFit, options: nil, resultHandler: {(result, info)->Void in
            guard let imgresult = result else{
                return
            }
            img = imgresult
        })
        return img
    }
}
