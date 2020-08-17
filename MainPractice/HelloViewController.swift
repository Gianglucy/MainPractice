//
//  HelloViewController.swift
//  MainPractice
//
//  Created by Apple on 8/13/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var txfText: UITextField!
    var data: [Int] = [1, 2, 3]
    var picker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
//       let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
//        toolbar.setItems([doneBtn], animated: true)
//        
//        txfText.inputAccessoryView = toolbar
        txfText.inputView = picker
        
        picker.datePickerMode = .date
    }
    
    @objc func donePress() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        txfText.text = formatter.string(from: picker.date)
        self.view.endEditing(true)
    }
}
