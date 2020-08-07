//
//  ModalView.swift
//  MainPractice
//
//  Created by Apple on 8/5/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

protocol ModalViewDelegate {
    func handlePhoto()
}

class ModalView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imvPhoto: UIImageView!
    var delegate: ModalViewDelegate?
//    var didSentData:((String)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ModalView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        
        let myColor = UIColor.white
        
        imvPhoto.layer.borderWidth = 2
        imvPhoto.layer.borderColor = myColor.cgColor
    }
    
    @IBAction func close(_ sender: UIButton) {
//        didSentData?("abc")
        delegate?.handlePhoto()
    }
}
