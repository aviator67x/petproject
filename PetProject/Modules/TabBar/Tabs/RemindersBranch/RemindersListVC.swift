//
//  RemindersListVC.swift
//  PetProject
//
//  Created by Georhii Kasilov on 08.02.2021.
//

import UIKit

class RemindersListVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.navigationItem.title = "RemindersListVC"
        
        setupTable()
        
//        self.tabBarItem = mytabBarItem
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(showRemindersView(param:)))
//        let plusImage = UIImage(named: "plusImage")
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusImage,
//                                                                 style: UIBarButtonItem.Style.plain,
//                                                                 target: self, action: #selector(showRemindersView(param:)))

    }
//    MARK: - Views
//    let image = UIImage(named: "assignment")
//    
//    private lazy var mytabBarItem: UITabBarItem = {
//        let item = UITabBarItem(title: "Reminders", image: image, tag: 0)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
//            
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
//     return item
//    }()
    
    private lazy var myTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
//        table.delegate = self
        table.dataSource = self
        
        table.register(CustomCell.self, forCellReuseIdentifier: "customCell")
        table.estimatedRowHeight = 150
        table.rowHeight = UITableView.automaticDimension
        table.separatorStyle = .singleLine
        return table
    }()
   
    
//    MARK: - Methods
    @objc private func showRemindersView(param: UIBarButtonItem) {
        let creatingRemindersVC = RemindersCreatingVC()
        self.navigationController?.pushViewController(creatingRemindersVC, animated: true)
    }

    private func setupTable() {
        view.addSubview(myTable) {
            $0.edges.equalToSuperview()
        }
}


}
//    MARK: - Extensions UITableViewDelegate
    
//    extension RemindersListVC: UITableViewDelegate {
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            <#code#>
//        }
//    }
    //    MARK: - Extensions UITableViewDataSource
    
extension RemindersListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        return cell
    }
    
    }

