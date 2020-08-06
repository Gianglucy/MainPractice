//
//  AlbumCell.swift
//  MainPractice
//
//  Created by Apple on 8/6/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

class AlbumCell: UITableViewCell {

    @IBOutlet weak var imvPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(asset: PHAsset) {
        print("HHHHHH: \(asset)")
        imvPhoto.image = getUIImage(asset: asset)
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
