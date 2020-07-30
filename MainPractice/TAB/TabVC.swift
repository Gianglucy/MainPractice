//
//  TabVC.swift
//  MainPractice
//
//  Created by Apple on 7/30/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {

    var movieVC = MovieVC(nibName: "MovieVC", bundle: nil)
    var movieSecondVC = MovieSecondVC(nibName: "MovieSecondVC", bundle: nil)
    var listViewControllers: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listViewControllers.append(movieVC)
        listViewControllers.append(movieSecondVC)
        
        movieVC.tabBarItem = UITabBarItem(title: "one", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        movieVC.tabBarItem.tag = 0
        movieSecondVC.tabBarItem = UITabBarItem(title: "two", image: UIImage(systemName: "trash"), selectedImage: UIImage(systemName: "trash"))
        movieSecondVC.tabBarItem.tag = 1
        
        self.setViewControllers(listViewControllers, animated: true)
        
        self.selectedIndex = 0
        self.selectedViewController = movieVC

    }
}
