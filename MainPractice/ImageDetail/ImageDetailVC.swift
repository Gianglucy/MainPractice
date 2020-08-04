//
//  ImageDetailVC.swift
//  MainPractice
//
//  Created by Apple on 7/19/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class ImageDetailVC: UIViewController,UIScrollViewDelegate {
    
    var image:UIImage?
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var deviceHeight:CGFloat = 0
    var tabBarheight:CGFloat = 0
    var delegate:DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("inbox: \(image)")
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let rightBarButton = UIBarButtonItem(title: "Choose", style: .done, target: self, action: #selector(choose))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func choose() {
        delegate?.passingImage(image: image!)
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setUpView() {
        
        tabBarheight = navigationController!.navigationBar.frame.height
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 1
        
        scrollView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        imageView.contentMode = .scaleAspectFit
        
        let doubleTapToImage = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapImage))
        doubleTapToImage.numberOfTapsRequired = 2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTapToImage)
        
        imageView.image = image!
    }
    
    @objc func doubleTapImage(recognizer: UITapGestureRecognizer) {
        //        print(scrollView.zoomScale)
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            let touchPoint = recognizer.location(in: self.imageView)
            let scrollViewSize = scrollView.bounds.size
            //            print(scrollViewSize)
            let width = scrollViewSize.width / scrollView.maximumZoomScale
            let height = scrollViewSize.height / scrollView.maximumZoomScale
            let x = touchPoint.x - (width/2.0)
            let y = touchPoint.y - (height/2.0)
            
            let rect = CGRect(x: x, y: y, width: width, height: height)
            scrollView.zoom(to: rect, animated: true)
//            print("hadZoom1: \(imageView.image)")
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print("hadZoom2: \(imageView.image)")
        return self.imageView
    }
    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        if scrollView.zoomScale > 1 {
//            if let image = imageView.image {
//                
//                let ratioH  = imageView.frame.height / image.size.height
//                let ratioW  = imageView.frame.width / image.size.width
//                
//                let ratio = ratioW < ratioH ?ratioW:ratioH
//                let newWidth = image.size.width * ratio
//                let newHeight = image.size.height * ratio
//                let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
//                let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
//                let conditionTop = newHeight * scrollView.zoomScale>imageView.frame.height
//                let top = 0.5 * (conditionTop ? newHeight - imageView.frame.height:(scrollView.frame.height - scrollView.contentSize.height))
//                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
//            }
//        } else{
//            scrollView.contentInset = .zero
//        }
//    }
}
