//
//  SignUpCell.swift
//  MainPractice
//
//  Created by Apple on 8/11/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

protocol SignUpCellDelegate {
    func passData(value: String, index: Int)
}

class SignUpCell: UITableViewCell {
    
    @IBOutlet weak var viewSignUp: SignUpView!
    var arrData = [String]()
    var picker = UIPickerView()
    let toolBar = UIToolbar()
    var delegate: SignUpCellDelegate?
    var tempIndex = Int()
    var datePicker = UIDatePicker()
    var dataPicked = String()
    var iscalled: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.viewSignUp.txfSignUp.inputView = nil
        arrData.removeAll()
    }
    
    func setupUI() {
        viewSignUp.txfSignUp.delegate = self
    }
    
    @objc func donePicker() {
        if !iscalled {
            viewSignUp.txfSignUp.text = String(arrData[0])
            delegate?.passData(value: String(arrData[0]), index: tempIndex)
        }
        self.endEditing(true)
    }
    
    func setupPicker() {
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue
        toolBar.sizeToFit()

        let nilButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))

        toolBar.setItems([nilButton,spaceButton,doneButton], animated: false)
        viewSignUp.txfSignUp.inputAccessoryView = toolBar
    }
    
    func setupDatePicker() {
       let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue
        toolBar.sizeToFit()

        let nilButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePress))
        toolbar.setItems([nilButton, spaceButton, doneBtn], animated: true)

        viewSignUp.txfSignUp.inputAccessoryView = toolbar
        viewSignUp.txfSignUp.inputView = datePicker
        let now = Date()
        // limit not future
        datePicker.maximumDate = now
        datePicker.datePickerMode = .date
        
        datePicker.addTarget(self, action: #selector(valueChange), for: .valueChanged)
    }
    
    @objc func valueChange(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/YYYY"
        self.viewSignUp.txfSignUp.text = formatter.string(from: datePicker.date)
    }
    
    @objc func donePress() {
        valueChange()
        self.endEditing(true)
    }
    
    func configCell(data: String, index: Int) {
        tempIndex = index
        if index == 1 || index == 2 || index == 8 {
            picker.delegate = self
            picker.dataSource = self
            self.viewSignUp.txfSignUp.inputView = picker
            setupPicker()
        } else if index == 6 || index == 7 {
            viewSignUp.txfSignUp.keyboardType = .asciiCapableNumberPad
        } else if index == 9 {
            setupDatePicker()
        }
        
        if index == 1 {
            arrData = ["English", "Japanese"]
        } else if index == 2 {
            arrData = ["Japan", "USA"]
        } else if index == 8 {
            arrData = ["Male", "Female", "Orther"]
        }
        
        viewSignUp.translatesAutoresizingMaskIntoConstraints = false
        viewSignUp.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let attributesPlaceholder: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]
        let quote = data
        viewSignUp.txfSignUp.attributedPlaceholder = NSAttributedString(string: quote, attributes: attributesPlaceholder)
    }
    
}

extension SignUpCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iscalled = true
        viewSignUp.txfSignUp.text = String(arrData[row])
        delegate?.passData(value: String(arrData[row]), index: tempIndex)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arrData[row])
    }
    
    
}

extension SignUpCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.passData(value: textField.text!, index: tempIndex)
    }
}

extension SignUpCell: SignUpVCDelegate {
    func callFunc() {
        print("ddd")
    }
}
