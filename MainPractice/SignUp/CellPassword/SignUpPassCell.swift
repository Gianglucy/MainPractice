//
//  SignUpPassCell.swift
//  MainPractice
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

protocol SignUpPassCellDelegate {
    func handleDataPass(value: String, index: Int)
}

class SignUpPassCell: UITableViewCell {
    
    @IBOutlet weak var viewSignUpPass: SignUpPassView!
    var isHide: Bool = true
    var tempIndex = Int()
    var delegatePass: SignUpPassCellDelegate?
    let toolbar = UIToolbar()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = .blue
        toolbar.sizeToFit()

        let nilButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePress))
        toolbar.setItems([nilButton, spaceButton, doneBtn], animated: true)

        viewSignUpPass.txfSignUp.inputAccessoryView = toolbar
        
        viewSignUpPass.delegate = self
        hidePass(ishide: isHide)
        
        viewSignUpPass.txfSignUp.delegate = self
    }
    
    @objc func donePress() {
        self.endEditing(true)
    }
    
    func hidePass(ishide: Bool) {
        if ishide {
            self.viewSignUpPass.btnHidePass.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            viewSignUpPass.txfSignUp.isSecureTextEntry = ishide
        } else {
            self.viewSignUpPass.btnHidePass.setImage(UIImage(systemName: "eye"), for: .normal)
            viewSignUpPass.txfSignUp.isSecureTextEntry = ishide
        }
    }
    
    func configCell(data: String, index: Int) {
        tempIndex = index
        
        viewSignUpPass.translatesAutoresizingMaskIntoConstraints = false
        viewSignUpPass.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let attributesPlaceholder: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]
        let quote = data
        viewSignUpPass.txfSignUp.attributedPlaceholder = NSAttributedString(string: quote, attributes: attributesPlaceholder)
        
    }
}

extension SignUpPassCell: SignUpPassViewDelegate {
    func handleHiden() {
        isHide = !isHide
        self.hidePass(ishide: self.isHide)
    }
}

extension SignUpPassCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegatePass?.handleDataPass(value: textField.text!, index: tempIndex)
    }
}
