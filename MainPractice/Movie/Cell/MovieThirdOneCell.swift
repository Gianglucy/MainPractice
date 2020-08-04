//
//  MovieThirdCell.swift
//  MainPractice
//
//  Created by Apple on 7/31/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieThirdOneCell: UICollectionViewCell {

        @IBOutlet weak var lblTitle: UILabel!
        @IBOutlet weak var lblDecription: UILabel!
        @IBOutlet weak var imgMovie: UIImageView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            setupUI()
        }
        
        func setupUI() {
            imgMovie.image = UIImage(named: "img_image")
            imgMovie.contentMode = .scaleAspectFit
            imgMovie.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
            self.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
            self.backgroundColor = .white
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 3,height: 3)
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 1
            self.clipsToBounds = false
            self.layer.masksToBounds = false
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            self.imgMovie.image = nil
        }
        
        func configCell(movie: Movie) {
            lblTitle.text = movie.originalTitle ?? "No title"
            lblDecription.text = movie.overview ?? "No decription"
            
            let queue = DispatchQueue(label: "loadImage",qos: .background)
            queue.async { [weak self] in
                if let pathURL: String = movie.posterPath {
                    let url = URL(string: ServerPath.IMAGE_URL.rawValue + pathURL)
                    do {
                        let data = try Data(contentsOf: url!)
                        DispatchQueue.main.async {
                            self?.imgMovie.image = UIImage(data: data)
                        }
                    } catch {
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.imgMovie.image = UIImage(named: "img_image")
                    }
                }
            }
        }
    }
