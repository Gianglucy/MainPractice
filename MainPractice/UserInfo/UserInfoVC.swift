//
//  UserInfoVC.swift
//  MainPractice
//
//  Created by Apple on 7/16/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            print(user)
            lblName.text = user.name
            lblAge.text = user.age
            lblAddress.text = user.address
            imgUser.image = user.imageData as? UIImage
            imgUser.contentMode = .scaleAspectFill
            imgUser.layer.cornerRadius = imgUser.layer.frame.width/2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
