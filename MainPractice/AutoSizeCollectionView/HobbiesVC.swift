//
//  HobbiesVC.swift
//  MainPractice
//
//  Created by Apple on 8/4/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class HobbiesVC: UIViewController {

    @IBOutlet weak var clvHobbies: UICollectionView!
    let data: [String] = [
    "so", "japanese cuisine", "movie", "fishing", "watching movie", "pet",
    "soccer", "japanese cuisine", "movie", "fishing", "watching movie", "pet",
    "japanese cuisine", "movie", "fishing","so", "japanese cuisine", "movie",
     "movie", "fishing", "watching movie", "pet"
    ]
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    let spacing:CGFloat = 10
    let col = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .red
        clvHobbies.delegate = self
        clvHobbies.dataSource = self
        clvHobbies.register(UINib(nibName: "HobbiesCell", bundle: nil), forCellWithReuseIdentifier: "HobbiesCell")
        clvHobbies.alwaysBounceVertical = false
        clvHobbies.alwaysBounceHorizontal = false
    }
}

extension HobbiesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvHobbies.dequeueReusableCell(withReuseIdentifier: "HobbiesCell", for: indexPath) as! HobbiesCell
        cell.configCell(name: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = data[indexPath.row]
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        let margin:CGFloat = 32
        return CGSize(width: itemSize.width + margin, height: itemSize.height + margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
}

class LeftAlignedCollectionViewFlowLayout : UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin + 16
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        return attributes
    }
}
