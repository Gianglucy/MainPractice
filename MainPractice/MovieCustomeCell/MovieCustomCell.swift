//
//  MovieCustomCell.swift
//  MainPractice
//
//  Created by Apple on 8/7/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieCustomCell: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imvMovie: UIImageView!
    @IBOutlet weak var viewAverage: UIView!
    @IBOutlet weak var lblAverage: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("MovieCustomCell", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        viewAverage.layer.cornerRadius = UIScreen.main.bounds.width * 0.045
        contentView.layer.borderWidth = 0.2
        contentView.layer.borderColor = UIColor.black.cgColor
        viewAverage.layer.borderWidth = 2
        viewAverage.layer.borderColor = UIColor.white.cgColor
        
//        contentView.layer.shadowColor = UIColor.black.cgColor
//        contentView.layer.shadowOpacity = 1
//        contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
//        contentView.layer.shadowRadius = 8
//        contentView.layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
//        contentView.layer.shouldRasterize = true
//        contentView.layer.rasterizationScale = UIScreen.main.scale
//
        contentView.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        
        
    }
}
