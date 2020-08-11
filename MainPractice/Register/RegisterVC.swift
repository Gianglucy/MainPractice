//
//  RegisterVC.swift
//  MainPractice
//
//  Created by Apple on 8/10/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Alamofire

class RegisterVC: UIViewController {
    
    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfPhone: UITextField!
    @IBOutlet weak var txfUserName: UITextField!
    @IBOutlet weak var txfPassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        txfPhone.keyboardType = .asciiCapableNumberPad
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func handleRegister(_ sender: Any) {
        
        if txfName.text!.isEmpty ||
            txfEmail.text!.isEmpty ||
            txfPhone.text!.isEmpty ||
            txfUserName.text!.isEmpty ||
            txfPassWord.text!.isEmpty {
            let alert = UIAlertController(title: "WARNNING", message: "Please fill fully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            let parameters: [String: String] = [
                "name": txfName.text!,
                "email": txfEmail.text!,
                "phone": txfPhone.text!,
                "userName": txfUserName.text!,
                "password": txfPassWord.text!
            ]
            
            AF.request(ServerPath.LOCAL_HOST.rawValue + "/addUser", method: .post, parameters: parameters).validate().response{ response in
                
                switch response.result {
                case .success:
                    //                print("Validation Successful")
                    let alert = UIAlertController(title: "Successful", message: "SignUp successful", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {(action) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                case let .failure(error):
                    //                print(error)
                    let alert = UIAlertController(title: "ERROR", message: error.errorDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                self.textNull()
            }
        }
    }
    
    func textNull() {
        txfName.text = nil
        txfEmail.text = nil
        txfPhone.text = nil
        txfUserName.text = nil
        txfPassWord.text = nil
    }
    
}
