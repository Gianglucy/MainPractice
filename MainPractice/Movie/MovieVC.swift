//
//  MovieVC.swift
//  MainPractice
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieVC: UIViewController {

    @IBOutlet weak var clvMovie: UICollectionView!
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    let spacing:CGFloat = 10
    let col = 2
    var data: [Movie]?
    
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
            guard let result = movieData?.results else { return }
            self.data = result
            DispatchQueue.main.async {
                self.clvMovie.reloadData()
            }
        }
        task.resume()
    }
    
    func setupUI() {
        let rightBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextPage))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        clvMovie.delegate = self
        clvMovie.dataSource = self
        
        deviceWidth = view.bounds.width
        deviceHeight = view.bounds.height
        
        clvMovie.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = spacing
        clvMovie!.collectionViewLayout = layout
    }
    
    @objc func nextPage() {
        let movieSecond = MovieSecondVC(nibName: "MovieSecondVC", bundle: nil)
        navigationController?.pushViewController(movieSecond, animated: true)
    }
}

extension MovieVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvMovie.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        guard let data = self.data else { return cell }
        cell.configCell(movie: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - (CGFloat(col + 1) * CGFloat(spacing))) / 2
        return CGSize(width: width, height: deviceHeight/1.5)
    }
}
