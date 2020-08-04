//
//  MovieFifthVC.swift
//  MainPractice
//
//  Created by Apple on 7/31/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieFifthVC: UIViewController {
    
    @IBOutlet weak var clvMovieFifth: UICollectionView!
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    let spacing:CGFloat = 10
    let col = 2
    var data: [Movie]?
    var isGrid: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupUI()
    }
    
    @IBAction func switchUI (_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            setLayoutForCollectionView(isGrid: true)
//            isGrid = true
        } else {
            setLayoutForCollectionView(isGrid: false)
//            isGrid = false
        }
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
            guard let result = movieData?.results else { return }
            self.data = result
            DispatchQueue.main.async {
                self.clvMovieFifth.reloadData()
            }
        }
        task.resume()
    }
    
    func setupUI() {
        clvMovieFifth.delegate = self
        clvMovieFifth.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
//        if isGrid {
//            clvMovieFifth.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
//        } else {
//            clvMovieFifth.register(UINib(nibName: "MovieSecondCell", bundle: nil), forCellWithReuseIdentifier: "MovieSecondCell")
//        }
        
        clvMovieFifth.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = spacing
        
        layout.itemSize.width = (UIScreen.main.bounds.size.width - (CGFloat(col + 1) * CGFloat(spacing))) / 2
        layout.itemSize.height = deviceHeight / 2.5
        
        clvMovieFifth!.collectionViewLayout = layout
    }
    
    
}

extension MovieFifthVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if isGrid {
//            let cell = clvMovieFifth.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
//            guard let data = self.data else { return cell }
//            cell.configCell(movie: data[indexPath.row])
//            return cell
//        } else {
//            let cell = clvMovieFifth.dequeueReusableCell(withReuseIdentifier: "MovieSecondCell", for: indexPath) as! MovieSecondCell
//            guard let data = self.data else { return cell }
//            cell.configCell(movie: data[indexPath.row])
//            return cell
//        }
        let cell = clvMovieFifth.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        guard let data = self.data else { return cell }
        cell.configCell(movie: data[indexPath.row])
        return cell
    }
    
    func setLayoutForCollectionView(isGrid: Bool) {
        if isGrid {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = spacing
            
            layout.itemSize.width = (UIScreen.main.bounds.size.width - (CGFloat(col + 1) * CGFloat(spacing))) / 2
            layout.itemSize.height = deviceHeight / 2.5
            
            clvMovieFifth!.collectionViewLayout = layout
        } else {
            let layoutOy = UICollectionViewFlowLayout()
            layoutOy.scrollDirection = .vertical
            layoutOy.minimumInteritemSpacing = 0
            layoutOy.minimumLineSpacing = spacing
            
            layoutOy.itemSize.width = (UIScreen.main.bounds.size.width - (CGFloat(1 + 1) * CGFloat(spacing))) / 1
            layoutOy.itemSize.height = deviceWidth / 1.4
            
            clvMovieFifth.alwaysBounceHorizontal = false
            clvMovieFifth.alwaysBounceVertical = false
            clvMovieFifth.backgroundColor = .clear
            self.clvMovieFifth.setCollectionViewLayout(layoutOy, animated: false)
        }
    }
}
