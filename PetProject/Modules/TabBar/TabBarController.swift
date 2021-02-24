//
//  TabBarController.swift
//  PetProject
//
//  Created by Georhii Kasilov on 11.02.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let remindersViewController = RemindersListVC()
        let remindersNavigationBar = UINavigationController(rootViewController: remindersViewController)
        let remindersVCItem = UIKit.UITabBarItem(title: "Reminders", image: UIImage(named: "assignment"), selectedImage: UIImage(named: "assignment"))
        remindersViewController.tabBarItem = remindersVCItem
        
        let secondVC = SecondVC()
        let secondNavigationBar = UINavigationController(rootViewController: secondVC)
        let secondVCItem = UITabBarItem(title: "Notes", image: UIImage(named: "event"), selectedImage: UIImage(named: "event"))
        secondVC.tabBarItem = secondVCItem
        
        let thirdVC = ThirdVC()
        let thirdNavigationBar = UINavigationController(rootViewController: thirdVC)
        let thirdVCItem = UITabBarItem(title: "Profile", image: UIImage(named: "person"), selectedImage: UIImage(named: "person"))
        thirdVC.tabBarItem = thirdVCItem
        
        setViewControllers([remindersNavigationBar,secondNavigationBar, thirdNavigationBar], animated: true)
        
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .blue

    }
}


