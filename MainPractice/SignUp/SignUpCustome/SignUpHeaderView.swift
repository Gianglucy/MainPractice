//
//  SignUpHeaderView.swift
//  MainPractice
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class SignUpHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblFirstText: UILabel!
    @IBOutlet weak var lblSecondText: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
