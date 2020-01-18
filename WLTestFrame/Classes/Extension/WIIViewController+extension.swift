//
//  WIIViewController+extension.swift
//  WIICommonFrame
//
//  Created by freshera on 2019/9/13.
//

import Foundation

public extension UIViewController {
    
    func addToParentController(_ parent: UIViewController) {
        self.willMove(toParent: parent)
        parent.addChild(self)
        parent.view.addSubview(self.view)
        self.didMove(toParent: parent)
    }
    
    func removeFromParentController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        self.didMove(toParent: nil)
    }
    
    
    static func current() -> UIViewController? {
        let window = UIApplication.shared.keyWindow
        var topVC = window?.rootViewController
        while true {
            if let presentedVC = topVC?.presentedViewController {
                topVC = presentedVC
            } else if let topNav = topVC as? UINavigationController{
                if let navTop = topNav.topViewController {
                    topVC = navTop
                } else {
                    break
                }
            } else if let tabBar = topVC as? UITabBarController {
                topVC = tabBar.selectedViewController
            } else {
                break
            }
            
        }
        return topVC
    }
}
