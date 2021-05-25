//
//  model.swift
//  SubFollower Count
//
//  Created by Junaid Mukadam on 17/05/21.
//

import Foundation
import UIKit


extension UIView {
    
    func shadow()  {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 20
    }
    
    func shadow2()  {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
    
    func buttonshadow()  {
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
    }
}



func myAlt(titel:String,message:String)-> UIAlertController{
    let alert = UIAlertController(title: titel, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
        case .default:
            print("")
        case .cancel:
            print("")
        case .destructive:
            print("")
        @unknown default:
            fatalError()
        }}))
                 
    return alert
    
}



//copy paste this

//self.present(myAlt(titel:"Failure",message:"Something went wrong."), animated: true, completion: nil)
