//
//  SignUpFooterView.swift
//  MainPractice
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

protocol SignUpFooterViewDelegate {
    func handleDone()
}

class SignUpFooterView: UIView {

     @IBOutlet var contentView: UIView!
       @IBOutlet weak var lblText: UILabel!
       @IBOutlet weak var btnNext: UIButton!
    var delegate: SignUpFooterViewDelegate?
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           commonInit()
       }
       
       private func commonInit() {
           Bundle.main.loadNibNamed("SignUpFooterView", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = self.bounds
           contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }
    
    @IBAction func next(_ sender: Any) {
        delegate?.handleDone()
    }
    
}
