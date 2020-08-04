//
//  NewsDetailVC.swift
//  MainPractice
//
//  Created by Apple on 8/3/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController {
    
    @IBOutlet weak var imvNews: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imvLogo: UIImageView!
    var dataNews: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func oneTapLogo() {
        guard let url = URL(string: "https://zingnews.vn/") else {
            return //be safe
        }
        UIApplication.shared.open(url)
    }
    
    func setupUI(){
        //        create action for imageView
        let tapLogo = UITapGestureRecognizer(target: self, action: #selector(oneTapLogo))
        imvLogo.isUserInteractionEnabled = true
        imvLogo.addGestureRecognizer(tapLogo)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let queue = DispatchQueue(label: "loadImage",qos: .background)
        queue.async {
            if let pathURL: String = self.dataNews?.image {
                let url = URL(string: ServerPath.LOCAL_HOST.rawValue + "/upload/" + pathURL)
                do {
                    let data = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.imvNews.image = UIImage(data: data)
                    }
                } catch {
                    
                }
            } else {
                return
            }
        }
        
        lblTitle.text = dataNews?.title ?? "no title"
        lblContent.text = dataNews?.content ?? "no content"
    }
    
    
}
