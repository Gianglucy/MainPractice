//
//  SignUpView.swift
//  MainPractice
//
//  Created by Apple on 8/11/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txfSignUp: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        txfSignUp.borderStyle = .none
    }
}
