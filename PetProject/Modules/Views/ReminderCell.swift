//
//  ReminderCell.swift
//  PetProject
//
//  Created by Georhii Kasilov on 10.02.2021.
//

import UIKit

protocol ReminderCellVM {
    var name: String {get}
    var text: String {get}
    var time: String {get}
    var id: String {get}
}

struct ReminderCellViewModel: ReminderCellVM {
    var name: String
    var text: String
    var time: String
    var id: String
    init(reminder: Reminder) {
        name = reminder.name
        text = reminder.text
        time = reminder.time
        id = reminder.id
    }
}

final class ReminderCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Views
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
//        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var reminderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var containerView = UIView()
    
//    MARK: - SetupViews
    private func setupViews() {
        contentView.addSubview(containerView) {
            $0.edges.equalToSuperview()
        }
        containerView.addSubview(titleLabel) {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalToSuperview()
        }
        containerView.addSubview(timeLabel) {
            $0.left.equalTo(titleLabel.snp.right).offset(30)
            $0.right.equalToSuperview().inset(20)
            $0.top.equalToSuperview()
        }
        containerView.addSubview(reminderLabel) {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.bottom.equalToSuperview()
        }
    }
}
extension ReminderCell {
    func setup(with viewModel: ReminderCellViewModel) {
        titleLabel.text = "\(viewModel.name)"
        timeLabel.text = "\(viewModel.time)"
        reminderLabel.text = "\(viewModel.text)"
    }
}
