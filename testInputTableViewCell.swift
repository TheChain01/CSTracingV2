//
//  testInputTableViewCell.swift
//  CSTracing
//
//  Created by Hubert Lachaîne on 2020-07-23.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

 public class TextInputTableViewCell: UITableViewCell {
   
    @IBOutlet weak var textField: UITextField!

   public func configure(text: String?, placeholder: String) {
    textField.text = text
    textField.placeholder = placeholder
    }
}
