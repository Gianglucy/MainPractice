//
//  SignUpVC.swift
//  MainPractice
//
//  Created by Apple on 8/11/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

enum keyTitle: Int {
    case Header
    case Languages
    case Countries
    case Timezone
    case Fullname
    case Nickname
    case MobilePhone
    case ZipCode
    case Gender
    case Birthday
    case Password
    case ConfirmPassword
    case Footer
    
    var title: String {
        switch self {
        case .Languages:
            return "Languages*"
        case .Countries:
            return "Countries*"
        case .Timezone:
            return "Timezone*"
        case .Fullname:
            return "Fullname*"
        case .Nickname:
            return "Nickname*"
        case .MobilePhone:
            return "Mobile phone number*"
        case .ZipCode:
            return "Zip code*"
        case .Gender:
            return "Gender*"
        case .Birthday:
            return "Birthday*"
        case .Password:
            return "Password*"
        case .ConfirmPassword:
            return "Confirm password*"
        default:
            return ""
        }
    }
}

protocol SignUpVCDelegate {
    func callFunc()
}

class SignUpVC: UIViewController {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var tblSignUp: UITableView!
    var arr: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    var data: SignUp = SignUp(language: "", country: "", timezone: "", fullname: "", nickname: "", mobilephone: "", zipcode: "", gender: "", birthday: "", password: "", confirmPassword: "")
    var delegate: SignUpVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        tblSignUp.delegate = self
        tblSignUp.dataSource = self
        viewBackground.roundCorners(corners: [.topLeft,.topRight], radius: 20)
        tblSignUp.register(UINib(nibName: "SignUpCell", bundle: nil), forCellReuseIdentifier: "SignUpCell")
        tblSignUp.register(UINib(nibName: "SignUpHeaderCell", bundle: nil), forCellReuseIdentifier: "SignUpHeaderCell")
        tblSignUp.register(UINib(nibName: "SignUpFooterCell", bundle: nil), forCellReuseIdentifier: "SignUpFooterCell")
        tblSignUp.register(UINib(nibName: "SignUpPassCell", bundle: nil), forCellReuseIdentifier: "SignUpPassCell")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 60
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension SignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tblSignUp.dequeueReusableCell(withIdentifier: "SignUpHeaderCell", for: indexPath) as! SignUpHeaderCell
            cell.configCell()
            return cell
        } else if indexPath.row == (arr.count - 1) {
            let cell = tblSignUp.dequeueReusableCell(withIdentifier: "SignUpFooterCell", for: indexPath) as! SignUpFooterCell
            cell.viewSignUpFooter.delegate = self
            return cell
        } else if indexPath.row == 10 || indexPath.row == 11 {
            let cell = tblSignUp.dequeueReusableCell(withIdentifier: "SignUpPassCell", for: indexPath) as! SignUpPassCell
            let key = keyTitle(rawValue: indexPath.row)
            cell.configCell(data: key!.title, index: indexPath.row)
            if indexPath.row == 10 {
                cell.viewSignUpPass.txfSignUp.text = data.password
            } else if indexPath.row == 11 {
                cell.viewSignUpPass.txfSignUp.text = data.confirmPassword
            }
            cell.delegatePass = self
            return cell
        } else {
            let cell = tblSignUp.dequeueReusableCell(withIdentifier: "SignUpCell", for: indexPath) as! SignUpCell
            let key = keyTitle(rawValue: indexPath.row)
            if indexPath.row == 1 {
                cell.viewSignUp.txfSignUp.text = data.language
            } else if indexPath.row == 2 {
                cell.viewSignUp.txfSignUp.text = data.country
            } else if indexPath.row == 3 {
                cell.viewSignUp.txfSignUp.text = data.timezone
            } else if indexPath.row == 4 {
                cell.viewSignUp.txfSignUp.text = data.fullname
            } else if indexPath.row == 5 {
                cell.viewSignUp.txfSignUp.text = data.nickname
            } else if indexPath.row == 6 {
                cell.viewSignUp.txfSignUp.text = data.mobilephone
            } else if indexPath.row == 7 {
                cell.viewSignUp.txfSignUp.text = data.zipcode
            } else if indexPath.row == 8 {
                cell.viewSignUp.txfSignUp.text = data.gender
            } else if indexPath.row == 9 {
                cell.viewSignUp.txfSignUp.text = data.birthday
            }
            cell.configCell(data: key!.title, index: indexPath.row)
            cell.delegate = self
            return cell
        }
    }
}

extension SignUpVC: SignUpCellDelegate {
    func passData(value: String, index: Int) {
        if index == 1 {
            data.language = value
        } else if index == 2 {
            data.country = value
        } else if index == 3 {
            data.timezone = value
        } else if index == 4 {
            data.fullname = value
        } else if index == 5 {
            data.nickname = value
        } else if index == 6 {
            data.mobilephone = value
        } else if index == 7 {
            data.zipcode = value
        } else if index == 8 {
            data.gender = value
        } else if index == 9 {
            data.birthday = value
        }
    }
}


extension SignUpVC: SignUpPassCellDelegate {
    func handleDataPass(value: String, index: Int) {
        if index == 10 {
            data.password = value
        } else if index == 11 {
            data.confirmPassword = value
        }
    }
}

extension SignUpVC: SignUpFooterViewDelegate {
    func handleDone() {
        self.view.endEditing(true)
        print("Languages: \(data.language!) Countries: \(data.country!) Timezone: \(data.timezone!) Fullname: \(data.fullname!) Nickname: \(data.nickname!) MobilePhone: \(data.mobilephone!) ZipCode: \(data.zipcode!) Gender: \(data.gender!) Birthday: \(data.birthday!) Password: \(data.password!) ConfirmPassword: \(data.confirmPassword!)")
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/YYYY"
        if data.language == "" || data.country == "" || data.timezone == "" ||
            data.fullname == "" || data.nickname == "" || data.mobilephone == "" ||
            data.zipcode == "" || data.gender == "" || data.birthday == "" ||
            data.password == "" || data.confirmPassword == ""{
            showAlert(title: "Error", mess: "Please fill all!")
        } else if data.birthday == formatter.string(from: now) {
            showAlert(title: "Error", mess: "Please choose your birthday again!")
        } else if data.password != data.confirmPassword {
            showAlert(title: "Error", mess: "Password confirm is not correct!")
        } else {
            showAlert(title: "Successful", mess: "Languages: \(data.language!) Countries: \(data.country!) Timezone: \(data.timezone!) Fullname: \(data.fullname!) Nickname: \(data.nickname!) MobilePhone: \(data.mobilephone!) ZipCode: \(data.zipcode!) Gender: \(data.gender!) Birthday: \(data.birthday!) Password: \(data.password!) ConfirmPassword: \(data.confirmPassword!)")
            data = SignUp(language: "", country: "", timezone: "", fullname: "", nickname: "", mobilephone: "", zipcode: "", gender: "", birthday: "", password: "", confirmPassword: "")
            tblSignUp.reloadData()
        }
    }
    
    func  showAlert(title: String, mess: String) {
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
