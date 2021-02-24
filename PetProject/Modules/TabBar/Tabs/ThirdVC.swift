//
//  ThirdVC.swift
//  PetProject
//
//  Created by Georhii Kasilov on 08.02.2021.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationItem.title = "ThirdVC"
        
//        let image = UIImage(named: "person")
//
//        var tabBarItem = UITabBarItem()
//        tabBarItem = UITabBarItem(title: "Profile", image: image, tag: 2)
//        setTabBarItemTextColor()
//        self.tabBarItem = tabBarItem
        
        
        
    }
    private func setTabBarItemTextColor() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
    }


}
