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
        self.title = "RemindersCreatingVC"
        view.backgroundColor = .white
        
        setupViews()
    }
//    MARK: - Views
    private lazy var titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .yellow
        textField.placeholder = "Text"
        textField.textColor = .red
        textField.delegate = self
        return textField
    }()
    
    private lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .red
        return textView
    }()
    
    private lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .green
        textField.placeholder = "Text1"
        textField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        return textField
    }()
    
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
    }
    
//    MARK: - Selector
    @objc func tapDone() {
          if let datePicker = self.pickerTextField.inputView as? UIDatePicker { 
              let dateformatter = DateFormatter()
              dateformatter.dateStyle = .medium
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
