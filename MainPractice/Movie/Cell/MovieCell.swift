//
//  MovieCell.swift
//  MainPractice
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var viewAverage: UIView!
    @IBOutlet weak var lblAverage: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDecription: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        imgMovie.image = UIImage(named: "img_image")
        imgMovie.contentMode = .scaleAspectFill
        imgMovie.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        self.backgroundColor = .white
        self.alpha = 0.1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0,height: 0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        
        self.viewAverage.layer.cornerRadius = self.viewAverage.layer.frame.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgMovie.image = nil
    }
    
    func configCell(movie: Movie) {
        
        lblAverage.text = String(movie.voteAverage ?? 0)
        
        lblTitle.text = movie.originalTitle ?? "No title"
        lblDecription.text = movie.overview ?? "No decription"
        
        let queue = DispatchQueue(label: "loadImage",qos: .background)
        queue.async {
            if let pathURL: String = movie.posterPath {
                let url = URL(string: ServerPath.IMAGE_URL.rawValue + pathURL)
                do {
                    let data = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.imgMovie.image = UIImage(data: data)
                    }
                } catch {
                    
                }
            } else {
                return
            }
        }
    }
}
