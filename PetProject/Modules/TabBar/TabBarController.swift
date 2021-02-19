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
        
        let secondVC = SecondVC()
        let secondNavigationBar = UINavigationController(rootViewController: secondVC)
        
        let thirdVC = ThirdVC()
        let thirdNavigationBar = UINavigationController(rootViewController: thirdVC)
        
        setViewControllers([remindersNavigationBar,secondNavigationBar, thirdNavigationBar], animated: true)
    }

}
