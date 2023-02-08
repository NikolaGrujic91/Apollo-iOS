//
//  WeightViewController.swift
//  Apollo
//
//  Created by Nikola Grujic on 13/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit
import ApolloWeight

class WeightViewController: UIViewController, UITextFieldDelegate, WeightRepositoryInjected {
    var decimalSeparator: String!

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 1
        nf.maximumFractionDigits = 1
        return nf
    }()

    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.setNavigationItem("Profile")
        self.textField.text = self.numberFormatter.string(from: NSNumber(value: repository.value))
        self.decimalSeparator = self.numberFormatter.decimalSeparator
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismissKeyboard()
    }

    // MARK: - Action methods

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        self.dismissKeyboard()
        self.saveButton.isEnabled = false
        self.saveButton.setImage(UIImage(systemName: "checkmark"), for: .normal)

        let number = self.numberFormatter.number(from: self.textField.text!.isEmpty ? "0.0" : self.textField.text!)
        self.textField.text = self.numberFormatter.string(from: number!)

        let weight = self.numberFormatter.number(from: self.textField.text!)
        repository.save(weight?.doubleValue ?? 0.0)
    }

    @IBAction func loadButtonPressed(_ sender: UIButton) {
        Task {
            await repository.loadFromHealthKit()
            self.textField.text = self.numberFormatter.string(from: NSNumber(value: repository.value))
            self.enableSaveButton()
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        self.enableSaveButton()
        self.dismissKeyboard()
        let number = self.numberFormatter.number(from: self.textField.text!)
        self.textField.text = self.numberFormatter.string(from: number!)
    }

    // MARK: - Helper methods

    private func setNavigationItem(_ title: String) {
        self.navigationItem.title = title
    }

    private func dismissKeyboard() {
        self.view.endEditing(true)
    }

    private func enableSaveButton() {
        let oldValue = self.numberFormatter.string(from: NSNumber(value: repository.value))
        let newValue = self.textField.text

        if oldValue != newValue {
            self.saveButton.isEnabled = true
            self.saveButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }

    // MARK: - UITextFieldDelegate

    // Asks the delegate if the specified text should be changed.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.enableSaveButton()

        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }

        let decimal = string.rangeOfCharacter(from:CharacterSet.decimalDigits)

        if textField.text?.isEmpty ?? true && decimal != nil {
            return true
        }

        if let str = textField.text {
            let count = str.count

            if str[count - 2] == self.decimalSeparator {
                return false
            }

            if count == 1 && decimal != nil {
                return true
            } else if (count == 2 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                        (count == 2 && decimal != nil && str[count - 1] != self.decimalSeparator) {
                return true
            } else if (count == 3 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                        (count == 3 && decimal != nil && str[count - 1] == self.decimalSeparator) {
                return true
            } else if (count == 4 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                        (count == 4 && decimal != nil && str[count - 1] == self.decimalSeparator) {
                return true
            } else if count == 5 {
                return false
            } else {
                return false
            }
        }

        return true
    }

    // Asks the delegate if the text field should process the pressing of the return button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
