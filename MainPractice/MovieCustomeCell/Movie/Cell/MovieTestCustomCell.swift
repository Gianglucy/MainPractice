//
//  MovieTestCustomCell.swift
//  MainPractice
//
//  Created by Apple on 8/7/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieTestCustomCell: UICollectionViewCell {

    @IBOutlet weak var viewCustom: MovieCustomCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    func setupUI() {
        viewCustom.imvMovie.image = UIImage(named: "ic_avatar_red")
        viewCustom.lblTitle.text = "No Title"
        viewCustom.lblContent.text = "No Content"
        viewCustom.lblAverage.text = "10"
        viewCustom.imvMovie.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
    }
    
    func configCell(movie: Movie) {
        viewCustom.lblAverage.text = String(movie.voteAverage ?? 0)
        
        viewCustom.lblTitle.text = movie.originalTitle ?? "No title"
        viewCustom.lblContent.text = movie.overview ?? "No decription"
        
        let queue = DispatchQueue(label: "loadImage",qos: .background)
        queue.async {
            if let pathURL: String = movie.posterPath {
                let url = URL(string: ServerPath.IMAGE_URL.rawValue + pathURL)
                do {
                    let data = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.viewCustom.imvMovie.image = UIImage(data: data)
                    }
                } catch {
                    
                }
            } else {
                return
            }
        }
    }
}
