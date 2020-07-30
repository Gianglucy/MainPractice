//
//  MovieSecondVC.swift
//  MainPractice
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieSecondVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var clvMovieSecond: UICollectionView!
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    var spacing:CGFloat = 10
    let col = 1
    var data:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupUI()
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
            self.data = movieData?.results as! [Movie]
            DispatchQueue.main.async {
                self.clvMovieSecond.reloadData()
            }
        }
        task.resume()
    }
    
    func setupUI() {
        clvMovieSecond.delegate = self
        clvMovieSecond.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
        clvMovieSecond.register(UINib(nibName: "MovieSecondCell", bundle: nil), forCellWithReuseIdentifier: "MovieSecondCell")
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = spacing
//        clvMovieSecond!.collectionViewLayout = layout
        
//        let layoutOx = UICollectionViewFlowLayout()
//        layoutOx.scrollDirection = .horizontal
//        layoutOx.minimumInteritemSpacing = 0
//        layoutOx.minimumLineSpacing = spacing
//        clvMovieSecond.alwaysBounceHorizontal = false
//        clvMovieSecond.alwaysBounceVertical = false
//        clvMovieSecond.backgroundColor = .clear
//        self.clvMovieSecond.setCollectionViewLayout(layoutOx, animated: false)
        
        let layoutOy = UICollectionViewFlowLayout()
        layoutOy.scrollDirection = .vertical
        layoutOy.minimumInteritemSpacing = 0
        layoutOy.minimumLineSpacing = spacing
        clvMovieSecond.alwaysBounceHorizontal = false
        clvMovieSecond.alwaysBounceVertical = false
        clvMovieSecond.backgroundColor = .clear
        self.clvMovieSecond.setCollectionViewLayout(layoutOy, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - (CGFloat(col + 1) * CGFloat(spacing))) / 1
        let size  = CGSize(width: width, height: deviceWidth / 1.41)
        return size
    }
}

extension MovieSecondVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvMovieSecond.dequeueReusableCell(withReuseIdentifier: "MovieSecondCell", for: indexPath) as! MovieSecondCell
        cell.configCell(movie: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("aaaa: \(data[indexPath.row].original_title) bbbb: \(data[indexPath.row].poster_path) ")
    }
}
