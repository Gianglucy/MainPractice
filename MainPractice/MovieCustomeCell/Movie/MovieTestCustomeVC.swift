//
//  MovieTestCustomeVC.swift
//  MainPractice
//
//  Created by Apple on 8/7/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieTestCustomVC: UIViewController {

    @IBOutlet weak var clvMovieTestCustom: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension MovieTestCustomVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
