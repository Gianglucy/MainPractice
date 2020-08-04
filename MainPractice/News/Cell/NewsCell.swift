//
//  NewsCell.swift
//  MainPractice
//
//  Created by Apple on 8/3/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

protocol NewsCellDelegate {
    func passingDataNews(data: News)
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var imvNews: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    var closure: (()->Void)?
    var delegate: NewsCellDelegate?
    var dataNews: News?
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupUI()
        }
        
        func setupUI() {
            imvNews.image = UIImage(named: "img_image")
            imvNews.contentMode = .scaleAspectFit
            imvNews.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
            
            imvNews.isUserInteractionEnabled = true
            let tapIMV = UITapGestureRecognizer(target: self, action: #selector(tabIMV))
            imvNews.addGestureRecognizer(tapIMV)
        }
    
    @objc func tabIMV () {
        if let data = dataNews {
            delegate?.passingDataNews(data: data)
        }
    }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            self.imvNews.image = nil
        }
        
        func configCell(news: News) {
            if let data: News = news {
                dataNews = data
            }
            lblTitle.text = news.title ?? "No title"
            lblContent.text = news.content ?? "No decription"
//            viewLine.isHidden = isLast
            let queue = DispatchQueue(label: "loadImage",qos: .background)
            queue.async { [weak self] in
                if let pathURL: String = news.image {
                    let url = URL(string: ServerPath.LOCAL_HOST.rawValue + "/upload/" + pathURL)
                    do {
                        let data = try Data(contentsOf: url!)
                        DispatchQueue.main.async {
                            self!.imvNews.image = UIImage(data: data)
                        }
                    } catch {
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        self!.imvNews.image = UIImage(named: "img_image")
                    }
                }
            }
        }
    }
