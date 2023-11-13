//
//  Validator.swift
//  homework7
//
//  Created by Dariya on 13/11/23.
//

import UIKit

protocol Validator{
    func validate(number: String)
}

extension Validator{
    func validate(number: String){
        if number.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
            print("Enter numbers only") }
        else if number.count == 12  {
            print("card is validate ")
        } else {
            print("card is not validate ")
        }
    }
}
