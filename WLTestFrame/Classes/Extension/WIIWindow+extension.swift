//
//  Addtions.swift
//  Inspection
//
//  Created by XUEYING FANG on 2019/5/7.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//

import UIKit

extension UIWindow {
    
    public func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        return topController
    }
    
     public func currentViewController()->UIViewController? {
        var currentViewController = topMostWindowController()
        if currentViewController is UITabBarController{
            currentViewController = (currentViewController as! UITabBarController).selectedViewController
        }
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        return currentViewController
    }
}

//extension UIViewController {
//    public func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let nav = base as? NavigationViewController {
//            return currentViewController(base: nav.visibleViewController)
//        }
//        if let tab = base as? UITabBarController {
//            return currentViewController(base: tab.selectedViewController)
//        }
//        if let presented = base?.presentedViewController {
//            return currentViewController(base: presented)
//        }
//        return base
//    }
//}
