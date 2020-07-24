//
//  Utilities.swift
//
//  Created by Hubert Lachaîne on 2020-03-25. To be used on multiple projects
//  Copyright © 2020 Hubert Lachaîne. All rights reserved.
//  This files is a utilities file created to stylize various UI items. It is used through various of my projects in order to have basic styling.

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CAGradientLayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.colors = [Utilities.UIColorFromRGB(0x2B95CE).cgColor,Utilities.UIColorFromRGB(0x2ECAD5).cgColor]
        bottomLine.startPoint = CGPoint(x: 0, y: 0)
        bottomLine.endPoint = CGPoint(x: 1, y: 0)
        bottomLine.shadowColor = UIColor.darkGray.cgColor
        bottomLine.shadowOffset = CGSize(width: 2.5, height: 2.5)
        bottomLine.shadowRadius = 5.0
        bottomLine.shadowOpacity = 0.3
        bottomLine.masksToBounds = false
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
        textfield.font = UIFont(name: "Avenir", size: 17.0)
        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        
    }
    static func styleBottomLine (_ button:UIButton, mode: Bool) {
        
        // Create the bottom line
        let bottomLine = CAGradientLayer()
        
        bottomLine.frame = CGRect(x: 0, y: button.frame.height - 2, width: button.frame.width, height: 2)
        
        bottomLine.colors = [Utilities.UIColorFromRGB(0x2B95CE).cgColor,Utilities.UIColorFromRGB(0x2ECAD5).cgColor]
        bottomLine.startPoint = CGPoint(x: 0, y: 0)
        bottomLine.endPoint = CGPoint(x: 1, y: 0)
        bottomLine.shadowColor = UIColor.darkGray.cgColor
        bottomLine.shadowOffset = CGSize(width: 2.5, height: 2.5)
        bottomLine.shadowRadius = 5.0
        bottomLine.shadowOpacity = 0.3
        bottomLine.masksToBounds = false
        
        // Remove border on text field
        
        // Add the line to the text field
        if mode {
            button.tintColor = UIColor.white
            button.setTitleColor(UIColor.white, for: .normal)
        } else {
            button.tintColor = UIColor.black
            button.setTitleColor(UIColor.black, for: .normal)
        }
        button.layer.addSublayer(bottomLine)
        
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        //button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 0.87)
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.applyGradient(colors: [Utilities.UIColorFromRGB(0x2B95CE).cgColor,Utilities.UIColorFromRGB(0x2ECAD5).cgColor])
    }
    static func MainStyleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
//        button.layer.cornerRadius = 15.0
//        button.tintColor = UIColor.white
        
        button.applyGradientHollow(colors: [Utilities.UIColorFromRGB(0x2ECAD5).cgColor,Utilities.UIColorFromRGB(0x2B95CE).cgColor])
        
    }
    static func themeBasedStyleHollowButton(_ button:UIButton, mode: Bool) {
            
            // Hollow rounded corner style
    //        button.layer.borderWidth = 2
    //        button.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
    //        button.layer.cornerRadius = 15.0
    //        button.tintColor = UIColor.white
            
            button.applyGradientHollow(colors: [Utilities.UIColorFromRGB(0x2ECAD5).cgColor,Utilities.UIColorFromRGB(0x2B95CE).cgColor])
            if mode {
                button.tintColor = UIColor.white
                button.setTitleColor(UIColor.white, for: .normal)
            } else {
                button.tintColor = UIColor.black
                button.setTitleColor(UIColor.black, for: .normal)
            }
            
        }
    
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.systemGray6
        button.tintColor = UIColor.white
        button.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15.0
        
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0, blue: ((CGFloat)((rgbValue & 0x0000FF)))/255.0, alpha: 1.0)
    }
    
    static func styleBaseButton(_ button:UIButton) {
        
        //button.applyGradientHollow(colors: [Utilities.UIColorFromRGB(0xAAABAA).cgColor, Utilities.UIColorFromRGB(0x9F9F9D).cgColor, Utilities.UIColorFromRGB(0x8D8C8C).cgColor, Utilities.UIColorFromRGB(0x7D7C7B).cgColor, Utilities.UIColorFromRGB(0x72706E).cgColor])
        button.applyGradient(colors: [Utilities.UIColorFromRGB(0xD7D7D8).cgColor, Utilities.UIColorFromRGB(0xC7C9CB).cgColor, Utilities.UIColorFromRGB(0xAEB2B8).cgColor, Utilities.UIColorFromRGB(0x959BA3).cgColor, Utilities.UIColorFromRGB(0x848B98).cgColor])
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 15.0)
        
    }
    
    static func styleGoldButton(_ button:UIButton) {
        
       // button.applyGradientHollow(colors: [Utilities.UIColorFromRGB(0xD7D7D8).cgColor, Utilities.UIColorFromRGB(0xC7C9CB).cgColor, Utilities.UIColorFromRGB(0xAEB2B8).cgColor, Utilities.UIColorFromRGB(0x959BA3).cgColor, Utilities.UIColorFromRGB(0x848B98).cgColor])
        button.applyGradient(colors: [Utilities.UIColorFromRGB(0xFFB302).cgColor, Utilities.UIColorFromRGB(0xFFBA01).cgColor, Utilities.UIColorFromRGB(0xFEC300).cgColor, Utilities.UIColorFromRGB(0xFFCF00).cgColor, Utilities.UIColorFromRGB(0xFED901).cgColor, Utilities.UIColorFromRGB(0xFFDF01).cgColor])
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 15.0)
        
        
    }
    
    static func stylePremiumButton(_ button:UIButton) {
        
        //button.applyGradientHollow(colors: [Utilities.UIColorFromRGB(0xFFB302).cgColor, Utilities.UIColorFromRGB(0xFFBA01).cgColor, Utilities.UIColorFromRGB(0xFEC300).cgColor, Utilities.UIColorFromRGB(0xFFCF00).cgColor, Utilities.UIColorFromRGB(0xFED901).cgColor, Utilities.UIColorFromRGB(0xFFDF01).cgColor])
        
        button.applyGradient(colors: [Utilities.UIColorFromRGB(0xff6a00).cgColor, Utilities.UIColorFromRGB(0xee0979).cgColor])
        
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 15.0)
    }
    
    
    static func styleBase(_ label:UILabel) {
        
        var colors: [CGColor]
               var outline: [CGColor]
               
               let gradientLayer = CAGradientLayer()
                    gradientLayer.frame = label.bounds
               gradientLayer.shadowColor = UIColor.darkGray.cgColor
               gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
               gradientLayer.shadowRadius = 5.0
               gradientLayer.shadowOpacity = 0.3
               gradientLayer.masksToBounds = false
               
               let outlineLayer = CAGradientLayer()
               outlineLayer.frame = label.bounds
               outlineLayer.shadowColor = UIColor.darkGray.cgColor
               outlineLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
               outlineLayer.shadowRadius = 5.0
               outlineLayer.shadowOpacity = 0.3
               outlineLayer.masksToBounds = false
               
               print(2)
               
                   colors = [Utilities.UIColorFromRGB(0xD7D7D8).cgColor, Utilities.UIColorFromRGB(0xC7C9CB).cgColor, Utilities.UIColorFromRGB(0xAEB2B8).cgColor, Utilities.UIColorFromRGB(0x959BA3).cgColor, Utilities.UIColorFromRGB(0x848B98).cgColor]
                   outline = [Utilities.UIColorFromRGB(0xAAABAA).cgColor, Utilities.UIColorFromRGB(0x9F9F9D).cgColor, Utilities.UIColorFromRGB(0x8D8C8C).cgColor, Utilities.UIColorFromRGB(0x7D7C7B).cgColor, Utilities.UIColorFromRGB(0x72706E).cgColor]
                   gradientLayer.colors = colors
                   outlineLayer.colors = outline
                   print(3)
               
        
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(rect: label.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradientLayer.mask = shape
        
        label.layer.insertSublayer(gradientLayer, at: 0)
        print(5)
               
        //label.layer.insertSublayer(outlineLayer, at: 0)
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 15.0)
        print(6)
        
 
    }
    
       static func styleGold(_ label:UILabel) {
           
           var colors: [CGColor]
                  var outline: [CGColor]
                  
                  let gradientLayer = CAGradientLayer()
                       gradientLayer.frame = label.bounds
                  gradientLayer.shadowColor = UIColor.darkGray.cgColor
                  gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
                  gradientLayer.shadowRadius = 5.0
                  gradientLayer.shadowOpacity = 0.3
                  gradientLayer.masksToBounds = false
                  
                  let outlineLayer = CAGradientLayer()
                  outlineLayer.frame = label.bounds
                  outlineLayer.shadowColor = UIColor.darkGray.cgColor
                  outlineLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
                  outlineLayer.shadowRadius = 5.0
                  outlineLayer.shadowOpacity = 0.3
                  outlineLayer.masksToBounds = false
                  
                  print(2)
                  
                      colors = [Utilities.UIColorFromRGB(0xFFB302).cgColor, Utilities.UIColorFromRGB(0xFFBA01).cgColor, Utilities.UIColorFromRGB(0xFEC300).cgColor, Utilities.UIColorFromRGB(0xFFCF00).cgColor, Utilities.UIColorFromRGB(0xFED901).cgColor, Utilities.UIColorFromRGB(0xFFDF01).cgColor]
                      outline = [Utilities.UIColorFromRGB(0xD7D7D8).cgColor, Utilities.UIColorFromRGB(0xC7C9CB).cgColor, Utilities.UIColorFromRGB(0xAEB2B8).cgColor, Utilities.UIColorFromRGB(0x959BA3).cgColor, Utilities.UIColorFromRGB(0x848B98).cgColor]
                      gradientLayer.colors = colors
                      outlineLayer.colors = outline
                      print(3)
                  
           
           let shape = CAShapeLayer()
           shape.lineWidth = 4
           shape.path = UIBezierPath(rect: label.bounds).cgPath
           shape.strokeColor = UIColor.black.cgColor
           shape.fillColor = UIColor.clear.cgColor
           gradientLayer.mask = shape
           
           label.layer.insertSublayer(gradientLayer, at: 0)
           print(5)
                  
           //label.layer.insertSublayer(outlineLayer, at: 0)
           label.textAlignment = .center
           label.font = UIFont(name: "Avenir-Heavy", size: 15.0)
           print(6)
           
    
       }
    
       static func stylePremium(_ label:UILabel) {
           
           var colors: [CGColor]
                  var outline: [CGColor]
                  
                  let gradientLayer = CAGradientLayer()
                       gradientLayer.frame = label.bounds
                  gradientLayer.shadowColor = UIColor.darkGray.cgColor
                  gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
                  gradientLayer.shadowRadius = 5.0
                  gradientLayer.shadowOpacity = 0.3
                  gradientLayer.masksToBounds = false
                  
                  let outlineLayer = CAGradientLayer()
                  outlineLayer.frame = label.bounds
                  outlineLayer.shadowColor = UIColor.darkGray.cgColor
                  outlineLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
                  outlineLayer.shadowRadius = 5.0
                  outlineLayer.shadowOpacity = 0.3
                  outlineLayer.masksToBounds = false
                  
                  print(2)
                  
                      colors = [Utilities.UIColorFromRGB(0xff6a00).cgColor, Utilities.UIColorFromRGB(0xee0979).cgColor]
                      outline = [Utilities.UIColorFromRGB(0xFFB302).cgColor, Utilities.UIColorFromRGB(0xFFBA01).cgColor, Utilities.UIColorFromRGB(0xFEC300).cgColor, Utilities.UIColorFromRGB(0xFFCF00).cgColor, Utilities.UIColorFromRGB(0xFED901).cgColor, Utilities.UIColorFromRGB(0xFFDF01).cgColor]
                      gradientLayer.colors = colors
                      outlineLayer.colors = outline
                  
           
           let shape = CAShapeLayer()
           shape.lineWidth = 4
           shape.path = UIBezierPath(rect: label.bounds).cgPath
           shape.strokeColor = UIColor.black.cgColor
           shape.fillColor = UIColor.clear.cgColor
           gradientLayer.mask = shape
           
           label.layer.insertSublayer(gradientLayer, at: 0)
           print(5)
                  
           //label.layer.insertSublayer(outlineLayer, at: 0)
           label.textAlignment = .center
           label.font = UIFont(name: "Avenir-Heavy", size: 15.0)
           print(6)
           
    
       }
    
    

    
}

extension UIButton {
    func applyGradient(colors: [CGColor]) {
        
        self.setTitleColor(UIColor.white, for: .normal)
               self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 17.0)
               self.titleLabel?.textColor = UIColor.white
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        //gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.frame.height/2

        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 5.0
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = false
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .center
       
    }
    
    func applyGradientHollow(colors: [CGColor]){
        self.backgroundColor = nil
        self.layoutIfNeeded()
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 17.0)
        self.titleLabel?.textColor = UIColor.white
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        //gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.frame.height/2

        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 5.0
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = false
        
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.height/2).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradientLayer.mask = shape
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .center
        
        
    }
}
    extension UIView {
        
        func setGradientLayer(colors: [CGColor]) {
            let GradientLayer = CAGradientLayer()
            GradientLayer.frame = bounds
            GradientLayer.colors = colors
            GradientLayer.locations = [0.0, 1.0]
            
            
            layer.insertSublayer(GradientLayer, at: 0)
        }
    }
    

