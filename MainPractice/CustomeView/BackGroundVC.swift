//
//  BackGroundVC.swift
//  MainPractice
//
//  Created by Apple on 8/5/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

protocol BackGroundVCDelegate {
    func passImage(image: UIImage)
}

class BackGroundVC: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var modalView: ModalView!
    var imageTemp: UIImage?
    var delegate: BackGroundVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .clear
        modalView.delegate = self
        modalView.btnDone.backgroundColor = .systemOrange
        modalView.btnDone.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        modalView.layer.cornerRadius = CGFloat(Constants.cornerRadius.rawValue)
        
        modalView.imvPhoto.layer.cornerRadius = view.bounds.width * 0.12
        if let image = imageTemp {
            modalView.imvPhoto.image = image
            modalView.lblTitle.text = "Congratulation"
            modalView.lblContent.text = "Update Successful Update Successful Update Successful Update Successful"
        } else {
            modalView.imvPhoto.image = #imageLiteral(resourceName: "ic_avatar_red")
            modalView.lblTitle.text = "Warn"
            modalView.lblContent.text = "Please Update Photo"
        }
        
        backgroundView.isUserInteractionEnabled = true
        let touchOutSide = UITapGestureRecognizer(target: self, action: #selector(touchOutSideModal))
        backgroundView.addGestureRecognizer(touchOutSide)
    }
    
    @objc func touchOutSideModal(){
        dismiss(animated: true)
    }
}

extension BackGroundVC: ModalViewDelegate {
    //Done
    func handlePhoto() {
        if let image = imageTemp {
            delegate?.passImage(image: image)
        }
        dismiss(animated: true)
    }
}
