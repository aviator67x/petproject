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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(showRemindersView(param:)))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let data = UserDefaults.standard.value(forKey: "Show reminder") as? Data,
           let reminders = try? JSONDecoder().decode([Reminder].self, from: data) {
            print("\(reminders.first?.name)")
            print("\(reminders.first?.name ?? "no value")")
        }
    }
//    MARK: - Views
    
    private lazy var myTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
//        table.delegate = self
        table.dataSource = self
        
        table.register(ReminderCell.self, forCellReuseIdentifier: "customCell")
        table.estimatedRowHeight = 150
        table.rowHeight = UITableView.automaticDimension
        table.separatorStyle = .singleLine
        return table
    }()
   
    
//    MARK: - Methods
    @objc private func showRemindersView(param: UIBarButtonItem) {
        let creatingRemindersVC = RemindersCreatingVC()
        creatingRemindersVC.hidesBottomBarWhenPushed = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ReminderCell
//        if let decodedReminder = UserDefaults.standard.value(forKey: "Show reminder”) as? Data {
//           if let reminder = try? JSONDecoder().decode(UserDefaults.self, from: decodedReminder)

//        cell.setup(with: <#T##ReminderCellViewModel#>)
        return cell
    }
    
    }

