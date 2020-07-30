//
//  PhotoVC.swift
//  MainPractice
//
//  Created by Apple on 7/17/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

protocol DataDelegate { //PhotoVCDelegate
    func passingImage(image:UIImage)
}

class PhotoVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DataDelegate {
    
    @IBOutlet weak var myCV: UICollectionView!
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    var spacing:CGFloat = 3
    var results: PHFetchResult<PHAsset>!
    var array = [UIImage]()
    var delegate:DataDelegate?
    var imageChosen:UIImage?
    var width:CGFloat!
    var height:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPhotos()
    }
    
    func setupUI() {
        
        //        let rightBarButton = UIBarButtonItem(title: "Choose", style: .done, target: self, action: #selector(choose))
        //
        //        self.navigationItem.rightBarButtonItem = rightBarButton
        
        myCV.delegate = self
        myCV.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
        width = (deviceWidth - 4 * spacing) / 3
        height = (deviceWidth - 3 * spacing) / 3
        
        myCV.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = spacing
        myCV!.collectionViewLayout = layout
    }
    
    //    @objc func choose() {
    //        if imageChosen != nil {
    //            delegate?.passingImage(image: imageChosen!)
    //        }
    //        navigationController?.popToRootViewController(animated: true)
    //    }
    
    func passingImage(image: UIImage) {
        delegate?.passingImage(image: imageChosen!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCV.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let asset = self.results!.object(at: indexPath.row)
        //        cell.myIMG.fetchImage(asset: asset!, contentMode: .aspectFit, targetSize: cell.myIMG.frame.size)
        //        cell.myIMG.contentMode = .scaleAspectFill
        //        print(array)
        PHCachingImageManager.default().requestImage(for: asset, targetSize:  CGSize(width: width, height: height), contentMode: .aspectFill, options: nil){ (image,_) in cell.configWithImage(image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size  = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        imageChosen = array[indexPath.row]
        let imageDetailVC = ImageDetailVC()
        imageDetailVC.delegate = self
        imageDetailVC.image = imageChosen
        navigationController?.pushViewController(imageDetailVC, animated: true)
    }
    
    fileprivate func getPhotos() {
        let manager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .highQualityFormat
        // .highQualityFormat will return better quality photos
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        self.results = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        if results.count > 0 {
            for i in 0..<results.count {
                let asset = results.object(at: i)
                let size = CGSize(width: 700, height: 700)
                manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { (image, _) in
                    if let image = image {
                        self.array.append(image)
                        self.myCV.reloadData()
                    } else {
                        print("error asset to image")
                    }
                }
            }
        } else {
            print("no photos to display")
        }
    }
}

extension UIImageView{
    func fetchImage(asset: PHAsset, contentMode: PHImageContentMode, targetSize: CGSize) {
        let options = PHImageRequestOptions()
        options.version = .original
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { image, _ in
            guard let image = image else { return }
            switch contentMode {
            case .aspectFill:
                self.contentMode = .scaleAspectFill
            case .aspectFit:
                self.contentMode = .scaleAspectFit
            }
            self.image = image
        }
    }
}
