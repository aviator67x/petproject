//
//  SecondVC.swift
//  PetProject
//
//  Created by Georhii Kasilov on 08.02.2021.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        self.navigationItem.title = "SecondVC"
        
        let image = UIImage(named: "event")
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Notes", image: image, tag: 1)
        setTabBarItemTextColor() 
        setupViews()
        self.tabBarItem = tabBarItem
        
        

    }
    
//    MARK: - Views
    private lazy var myFirstTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var mytextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        textView.backgroundColor = .black
        return textView
    }()
    
    private lazy var mySecondTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
//    MARK: - Methods
    private func setupViews() {
        view.addSubview(myFirstTextField) {
            $0.left.right.top.equalToSuperview().offset(20)
        }
        view.addSubview(mytextView) {
            $0.left.right.equalToSuperview().offset(20)
            $0.top.equalTo(myFirstTextField.snp.bottom).offset(30)
        }
        view.addSubview(mySecondTextField) {
            $0.left.right.equalToSuperview().offset(20)
            $0.top.equalTo(mytextView.snp.bottom).offset(30)
        }
    }
    
    private func setTabBarItemTextColor() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
    }

//    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
//        itemAppearance.normal.iconColor = .lightGray
//        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
//
//        itemAppearance.selected.iconColor = .white
//        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
//    }


}
