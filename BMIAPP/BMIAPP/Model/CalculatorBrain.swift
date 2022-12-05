//
//  CalculatorBrain.swift
//  BMIAPP
//
//  Created by Pooja Patil on 15/11/22.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var colour: UIColor?
    
    mutating func calculate(_ height: Float, _ weight: Float) -> Float {
        let ress = weight/(height * height)
        if ress < 44 {
            colour = UIColor.red
        } else if ress > 44 {
            colour = UIColor.purple
        } else {
            colour = UIColor.cyan
        }
        return ress
    }
}
