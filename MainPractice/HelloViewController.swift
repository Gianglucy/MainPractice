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
    var picker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        picker.isHidden = true
        picker.delegate = self
        picker.dataSource = self
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        picker.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
    }
    @IBAction func open(_ sender: UIButton) {
        
    }
    
    @objc func donePress() {
        if picker.isHidden {
            picker.isHidden = false
        }
    }
}

extension HelloViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(data[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(data[row])
    }
}
