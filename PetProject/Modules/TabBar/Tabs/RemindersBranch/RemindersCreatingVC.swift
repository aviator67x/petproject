//
//  RemindersSecondVC.swift
//  PetProject
//
//  Created by Georhii Kasilov on 12.02.2021.
//

import UIKit

class RemindersCreatingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create your reminder"
        view.backgroundColor = .white
        
        setupViews()
    
    }
//    MARK: - Views
    private lazy var titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .yellow
        textField.placeholder = "Name of reminder"
        textField.textColor = .red
        textField.delegate = self
        return textField
    }()
    
    private lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Print your reminder here"
        textView.backgroundColor = .red
        return textView
    }()
    
    private lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .green
        textField.placeholder = "Chose the time of your reminder"
        textField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.tintColor = .red
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tapButton), for: .allEvents)
        return button
    }()
    
    struct Reminder: Codable {
        var name: String
        var text: String
        var time: String
        let id: String
        
        init(with name: String,
             text: String,
             time: String) {
            self.name = name
            self.text = text
            self.time = time
            self.id = UUID().uuidString
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextView.resignFirstResponder()
    }
    
    @objc func tapButton() {
        let userDefaults = UserDefaults.standard
        guard let name = titleTextField.text,
              let time = pickerTextField.text else { return }
        
        let reminder = Reminder(with: name,
                                text: messageTextView.text,
                                time: time)
        
        if let data = try? JSONEncoder().encode(reminder) {
            if var existingReminders = UserDefaults.standard.value(forKey: "Show reminder") as? Data {
            existingReminders.append(data)
            userDefaults.setValue(existingReminders, forKey: "Show reminder")
        } else {
            var reminderArray:[Reminder] = []
            if var reminderArrayData = try? JSONEncoder().encode(reminderArray) {
            reminderArrayData.append(data)
            userDefaults.setValue(reminderArrayData, forKey: "Show reminder")
                
            }
        }
    }
        
        
        let alertForButton = UIAlertController(title: "You have successfully created a reminder", message: "To return to previous menu tap the button Done", preferredStyle: .alert)
        alertForButton.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertForButton, animated: true, completion: nil)
    }
    
//    MARK: - Setup Views
    private func setupViews() {
        view.addSubview(titleTextField) {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        view.addSubview(messageTextView) {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(titleTextField.snp.bottom).offset(40)
            $0.height.equalTo(100)
        }
        view.addSubview(pickerTextField) {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(messageTextView.snp.bottom).offset(40)
        }
        view.addSubview(saveButton) {
            $0.left.right.equalToSuperview().inset(50)
            $0.height.equalTo(60)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
    }
    
//    MARK: - Selector
    @objc func tapDone() {
          if let datePicker = self.pickerTextField.inputView as? UIDatePicker { 
              let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            dateformatter.timeStyle = .medium
            self.pickerTextField.text = dateformatter.string(from: datePicker.date)
          }
          self.pickerTextField.resignFirstResponder()
      }
}

//    MARK: - Extensions
extension RemindersCreatingVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            titleTextField.resignFirstResponder()
        }
       return true
    }
}
