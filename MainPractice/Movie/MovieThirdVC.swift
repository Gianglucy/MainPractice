//
//  MovieThirdVC.swift
//  MainPractice
//
//  Created by Apple on 7/31/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieThirdVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var clvMovieThirdOne: UICollectionView!
    @IBOutlet weak var clvMovieThirdTwo: UICollectionView!
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
                self.clvMovieThirdOne.reloadData()
                self.clvMovieThirdTwo.reloadData()
            }
        }
        task.resume()
    }
    
    func setupUI() {
        clvMovieThirdOne.delegate = self
        clvMovieThirdOne.dataSource = self
        
        clvMovieThirdTwo.delegate = self
        clvMovieThirdTwo.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
        clvMovieThirdOne.register(UINib(nibName: "MovieThirdOneCell", bundle: nil), forCellWithReuseIdentifier: "MovieThirdOneCell")
        
        clvMovieThirdTwo.register(UINib(nibName: "MovieThirdTwoCell", bundle: nil), forCellWithReuseIdentifier: "MovieThirdTwoCell")
        
        //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        //        layout.minimumInteritemSpacing = 0
        //        layout.minimumLineSpacing = spacing
        //        clvMovieSecond!.collectionViewLayout = layout
        
        let layoutOx = UICollectionViewFlowLayout()
        layoutOx.scrollDirection = .horizontal
        layoutOx.minimumInteritemSpacing = 0
        layoutOx.minimumLineSpacing = spacing
        clvMovieThirdOne.alwaysBounceHorizontal = false
        clvMovieThirdOne.alwaysBounceVertical = false
        clvMovieThirdOne.backgroundColor = .clear
        self.clvMovieThirdOne.setCollectionViewLayout(layoutOx, animated: false)
        
        let layoutOy = UICollectionViewFlowLayout()
        layoutOy.scrollDirection = .vertical
        layoutOy.minimumInteritemSpacing = 0
        layoutOy.minimumLineSpacing = spacing
        clvMovieThirdTwo.alwaysBounceHorizontal = false
        clvMovieThirdTwo.alwaysBounceVertical = false
        clvMovieThirdTwo.backgroundColor = .clear
        self.clvMovieThirdTwo.setCollectionViewLayout(layoutOy, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - (CGFloat(col + 1) * CGFloat(spacing))) / 1
        let size  = CGSize(width: width, height: deviceWidth / 1.4)
        return size
    }
}

extension MovieThirdVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.clvMovieThirdOne {
            return data.count
        } else {
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.clvMovieThirdOne {
            let cell = clvMovieThirdOne.dequeueReusableCell(withReuseIdentifier: "MovieThirdOneCell", for: indexPath) as! MovieThirdOneCell
            cell.configCell(movie: data[indexPath.row])
            return cell
        } else {
            let cell = clvMovieThirdTwo.dequeueReusableCell(withReuseIdentifier: "MovieThirdTwoCell", for: indexPath) as! MovieThirdTwoCell
            cell.configCell(movie: data[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        print("aaaa: \(data[indexPath.row].original_title) bbbb: \(data[indexPath.row].poster_path) ")
    }
}
