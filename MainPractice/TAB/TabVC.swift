//
//  TabVC.swift
//  MainPractice
//
//  Created by Apple on 7/30/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {

    var listViewControllers: [UINavigationController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieVC = MovieVC(nibName: "MovieVC", bundle: nil)
        let movieSecondVC = MovieSecondVC(nibName: "MovieSecondVC", bundle: nil)
        let movieThirdVC = MovieThirdVC(nibName: "MovieThirdVC", bundle: nil)
        let movieFourthVC = MovieFourthVC(nibName: "MovieFourthVC", bundle: nil)
        let movieFifthVC = MovieFifthVC(nibName: "MovieFifthVC", bundle: nil)
        let newsVC = NewsVC(nibName: "NewsVC", bundle: nil)
        
        let movieNav = UINavigationController(rootViewController: movieVC)
        let movieSecondNav = UINavigationController(rootViewController: movieSecondVC)
        let movieThirdNav = UINavigationController(rootViewController: movieThirdVC)
        let movieFourthNav = UINavigationController(rootViewController: movieFourthVC)
        let movieFifthNav = UINavigationController(rootViewController: movieFifthVC)
        let newsNav = UINavigationController(rootViewController: newsVC)
//        navigationController?.setNavigationBarHidden(true, animated: nil)
        
        listViewControllers.append(movieNav)
        listViewControllers.append(movieSecondNav)
        listViewControllers.append(movieThirdNav)
        listViewControllers.append(movieFourthNav)
        listViewControllers.append(movieFifthNav)
        listViewControllers.append(newsNav)
        
        movieNav.tabBarItem = UITabBarItem(title: "One", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        movieNav.tabBarItem.tag = 0
        movieSecondNav.tabBarItem = UITabBarItem(title: "Two", image: UIImage(systemName: "trash"), selectedImage: UIImage(systemName: "trash"))
        movieSecondNav.tabBarItem.tag = 1
        movieThirdNav.tabBarItem = UITabBarItem(title: "Three", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        movieThirdNav.tabBarItem.tag = 2
        movieFourthNav.tabBarItem = UITabBarItem(title: "Four", image: UIImage(systemName: "trash"), selectedImage: UIImage(systemName: "trash"))
        movieFourthNav.tabBarItem.tag = 3
        movieFifthNav.tabBarItem = UITabBarItem(title: "Fifth", image: UIImage(systemName: "pencil"), selectedImage: UIImage(systemName: "pencil"))
        movieFifthNav.tabBarItem.tag = 4
        newsNav.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "doc"), selectedImage: UIImage(systemName: "doc"))
        newsNav.tabBarItem.tag = 5
        
        self.setViewControllers(listViewControllers, animated: true)
        
        self.selectedIndex = 0
        self.selectedViewController = movieNav

    }
}
