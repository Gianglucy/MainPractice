//
//  FirstVC.swift
//  MainPractice
//
//  Created by Apple on 7/16/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

class FirstVC: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgUser.image = UIImage(named: "ic_avatar_red")
        imgUser.contentMode = .scaleAspectFill
        imgUser.layer.cornerRadius = imgUser.layer.frame.width/2
//        print(imgUser.layer.frame.width)
//        imgUser.backgroundColor = .red
        setupUI()
        
    }
    
    func setupUI() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        txtAge.keyboardType = .phonePad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let rightBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func save() {
        let userInforVC = UserInfoVC()
        navigationController?.pushViewController(userInforVC, animated: true)
        let user = User(name: txtName.text ?? "", age: txtAge.text ?? "", address: txtAddress.text ?? "", imageData: imgUser.image ?? UIImage(named: "ic_avatar_red")!)
        userInforVC.user = user
    }
    
    @IBAction func pickImage(_ sender: Any) {
        showImagePickerControllerActionSheet()
    }
}

extension FirstVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        let alert = UIAlertController(title: "Notification", message: "Choose your Image", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Library", style: .default, handler: {(action)in
            //            self.showImagePickerController(sourceType: .photoLibrary)
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        let photoVC = PhotoVC()
                        photoVC.delegate = self
                        self.navigationController?.pushViewController(photoVC, animated: true)
                    }
                case .denied, .restricted:
                    print("Not allowed")
                case .notDetermined:
                    print("Not determined yet")
                default:
                    print("default")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: {(action)in
            
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                switch status {
                case true:
                    self.showImagePickerController(sourceType: .camera)
                case false:
                    print("Not allowed")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showImagePickerController(sourceType:UIImagePickerController.SourceType) {
        DispatchQueue.main.async {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            //        imagePickerController.allowsEditing = true
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgUser.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

extension FirstVC: PhotoVCDelegate {
    func passingImage(image: UIImage) {
        imgUser.image = image
    }
}
