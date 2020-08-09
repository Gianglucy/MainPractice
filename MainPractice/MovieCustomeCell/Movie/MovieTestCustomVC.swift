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
    
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    let spacing:CGFloat = 16
    let col = 2
    var data = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestData()
    }
    
    func setupUI() {
        
        deviceWidth = UIScreen.main.bounds.width
        deviceHeight = UIScreen.main.bounds.height
        
        clvMovieTestCustom.delegate = self
        clvMovieTestCustom.dataSource = self
        clvMovieTestCustom.register(UINib(nibName: "MovieTestCustomCell", bundle: nil), forCellWithReuseIdentifier: "MovieTestCustomCell")
    }
    
    func requestData() {
        var request = URLRequest(url: URL(string: ServerPath.API_URL.rawValue)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data,
                let _ = response as? HTTPURLResponse,
                error == nil else {
                    print("error111111111111",error ?? "ko xac dinh")
                    return
            }
            let movieData = try? JSONDecoder().decode(DataMovie.self, from: data)
            guard let results = movieData?.results else { return }
            self.data = results
            DispatchQueue.main.async {
                self.clvMovieTestCustom.reloadData()
            }
        }
        task.resume()
    }
}

extension MovieTestCustomVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvMovieTestCustom.dequeueReusableCell(withReuseIdentifier: "MovieTestCustomCell", for: indexPath) as! MovieTestCustomCell
        cell.configCell(movie: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (deviceWidth - (CGFloat(col + 1) * CGFloat(spacing))) / 2
        return CGSize(width: width, height: deviceHeight / 2)
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
