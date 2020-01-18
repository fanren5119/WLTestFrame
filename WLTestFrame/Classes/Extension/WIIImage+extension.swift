//
//  UIImage.swift
//  Health
//
//  Created by hong tianjun on 2018/9/22.
//  Copyright © 2018 hong tianjun. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
     public class func color(color: UIColor) -> UIImage? {
    
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    }
    
//    class func convertGradientToImage(colors: [UIColor], frame: CGRect) -> UIImage {
//        
//        // start with a CAGradientLayer
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = frame
//        
//        // add colors as CGCologRef to a new array and calculate the distances
//        var colorsRef : [CGColorRef] = []
//        var locations : [NSNumber] = []
//        
//        for i in 0 ... colors.count-1 {
//            colorsRef.append(colors[i].CGColor as CGColorRef)
//            locations.append(Float(i)/Float(colors.count))
//        }
//        
//        gradientLayer.colors = colorsRef
//        gradientLayer.locations = locations
//        
//        // now build a UIImage from the gradient
//        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
//        gradientLayer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        // return the gradient image
//        return gradientImage
//    }
}
