//
//  PhotoVC.swift
//  MainPractice
//
//  Created by Apple on 7/17/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

protocol PhotoVCDelegate { //PhotoVCDelegate
    func passingImage(image:UIImage)
}

class PhotoVC: UIViewController, PhotoVCDelegate {
    
    @IBOutlet weak var myCV: UICollectionView!
    var deviceWidth: CGFloat!
    var deviceHeight: CGFloat!
    var spacing: CGFloat = 3
    var delegate: PhotoVCDelegate?
    var imageChosen: UIImage?
    var width: CGFloat!
    var height: CGFloat!
    
    var image = [UIImage]()
    var imageAssets = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAsset()
        setupUI()
    }
    
    func setupUI() {
        myCV.delegate = self
        myCV.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
        width = (deviceWidth - 4 * spacing) / 3
        height = (deviceWidth - 3 * spacing) / 3
        
        myCV.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }
    
    func passingImage(image: UIImage) {
        delegate?.passingImage(image: imageChosen!)
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
    
    func getAsset() {
        DispatchQueue.global(qos: .background).async {
            let imageAsset = PHAsset.fetchAssets(with: .image, options: nil)
            for index in 0..<imageAsset.count{
                self.imageAssets.append(imageAsset[index])
                DispatchQueue.main.async {
                    self.myCV.reloadData()
                }
            }
        }
    }
}

extension PhotoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageAssets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCV.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.configWithImage(imageAsset: self.imageAssets[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size  = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageChosen = getUIImage(asset: imageAssets[indexPath.row])
        let imageDetailVC = ImageDetailVC()
        imageDetailVC.delegate = self
        imageDetailVC.image = imageChosen
        navigationController?.pushViewController(imageDetailVC, animated: true)
    }
}
