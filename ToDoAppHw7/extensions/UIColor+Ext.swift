//
//  UIColor+Ext.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 6.02.2023.
//

import UIKit

extension UIColor {
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
}
