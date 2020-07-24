//
//  testInputTableViewCell.swift
//  CSTracing
//
//  Created by Hubert Lachaîne on 2020-07-23.
//  Copyright © 2020 Hubert Lachaîne. All rights reserved.
//  This class creates a template for cell accepting text inputs from the users.

import UIKit

 public class TextInputTableViewCell: UITableViewCell {
   
    @IBOutlet weak var textField: UITextField!

   public func configure(text: String?, placeholder: String) {
    textField.text = text
    textField.placeholder = placeholder
    }
}
