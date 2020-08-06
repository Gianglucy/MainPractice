//
//  TestVC.swift
//  MainPractice
//
//  Created by Apple on 8/5/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

class TestVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSuccessView(_ sender: UIButton) {
        showImagePickerControllerActionSheet()
    }
}

extension TestVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        }))
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
            print("KKKKK1: \(image)")
        }
        dismiss(animated: true, completion: nil)
    }
}

extension TestVC: PhotoVCDelegate {
    func passingImage(image: UIImage) {
        let backGround = BackGroundVC(nibName: "BackGroundVC", bundle: nil)
        backGround.imageTemp = image
        let navController = UINavigationController(rootViewController: backGround)
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        self.present(navController, animated: true, completion: nil)
    }
}
