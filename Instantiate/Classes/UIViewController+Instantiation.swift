//
//  UIViewController+Instantiation.swift
//  Instantiate
//
//  Created by Prokhor Kharchenko on 2/22/17.
//  Copyright © 2017 wowbroforce. All rights reserved.
//

import UIKit

extension UIViewController: Instantiable { }

extension Instantiable where Self: UIViewController {
    public static func instantiate(storyboardName: String? = nil, initial: Bool = false) -> Self {
        let storyboard = UIStoryboard(name: storyboardName ?? String(describing: self), bundle: Bundle(for: self))
        let controller = storyboard.instantiate(type: self, initial: initial)
        return controller
    }
}

extension UIStoryboard {
    public func instantiate<T: UIViewController>(type: T.Type, initial: Bool = false) -> T {
        let controller = initial ? instantiateInitialViewController() : instantiateViewController(withIdentifier: String(describing: T.self))
        if let targetController = controller as? T {
            return targetController
        }
        if let navigation = controller as? UINavigationController, let targetController = navigation.viewControllers.first as? T {
            return targetController
        }
        fatalError("Storyboard has no controller of type '\(T.self)'")
    }
}
