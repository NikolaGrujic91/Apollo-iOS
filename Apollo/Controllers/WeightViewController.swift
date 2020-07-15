//
//  WeightViewController.swift
//  Apollo
//
//  Created by Nikola Grujic on 13/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITextFieldDelegate
{
    var weightStore: WeightStore!;
    var decimalSeparator: String!;
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter();
        nf.numberStyle = .decimal;
        nf.minimumFractionDigits = 1;
        nf.maximumFractionDigits = 1;
        return nf;
    }();
    
    @IBOutlet var textField: UITextField!;
    
    // MARK: - View life cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.textField.delegate = self;
        self.setNavigationItem("Weight");
        self.textField.text = self.numberFormatter.string(from: NSNumber(value: self.weightStore.weight.value));
        self.decimalSeparator = self.numberFormatter.decimalSeparator;
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated);
        self.dismissKeyboard();
    }
    
    // MARK: - Action methods
    
    @IBAction func saveButtonPressed(_ sender: UIButton)
    {
        self.dismissKeyboard();
        
        if let weight = Double(self.textField.text!)
        {
            self.weightStore.weight.value = weight;
            self.weightStore.encode();
        }
    }
    
    @IBAction func loadButtonPressed(_ sender: UIButton)
    {
        self.textField.text = String(format: "%.1f", HealthKitController.getWeight());
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer)
    {
        self.dismissKeyboard();
    }
    
    // MARK: - Helper methods
    
    private func setNavigationItem(_ title: String) -> Void
    {
        self.navigationItem.title = title;
    }
    
    private func dismissKeyboard() -> Void
    {
        self.view.endEditing(true);
    }
    
    // MARK: - UITextFieldDelegate
    
    // Asks the delegate if the specified text should be changed.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if let char = string.cString(using: String.Encoding.utf8)
        {
            let isBackSpace = strcmp(char, "\\b");
            if (isBackSpace == -92)
            {
                return true;
            }
        }
        
        let decimal = string.rangeOfCharacter(from:CharacterSet.decimalDigits);
        
        if (textField.text?.count == 0 && decimal != nil)
        {
            return true;
        }
        
        if let str = textField.text
        {
            let count = str.count;
            
            if (str[count - 2] == self.decimalSeparator)
            {
                return false;
            }
            
            if count == 1 && decimal != nil
            {
                return true;
            }
            else if (count == 2 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                    (count == 2 && decimal != nil && str[count - 1] != self.decimalSeparator)
            {
                return true;
            }
            else if (count == 3 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                    (count == 3 && decimal != nil && str[count - 1] == self.decimalSeparator)
            {
                return true;
            }
            else if (count == 4 && string == self.decimalSeparator && str[count - 1] != self.decimalSeparator) ||
                    (count == 4 && decimal != nil && str[count - 1] == self.decimalSeparator)
            {
                return true;
            }
            else if count == 5
            {
                return false;
            }
            else
            {
                return false;
            }
        }

        return true;
    }
     
    // Asks the delegate if the text field should process the pressing of the return button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
}
