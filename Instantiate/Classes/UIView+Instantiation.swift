//
//  UIView+Instantiation.swift
//  Instantiate
//
//  Created by Prokhor Kharchenko on 2/22/17.
//  Copyright © 2017 wowbroforce. All rights reserved.
//

import UIKit

extension UIView: Instantiable { }

extension Instantiable where Self: UIView {
    static func instantiate() -> Self {
        let xibName = String(describing: self)
        let bundle = Bundle(for: self)
        return bundle
            .loadNibNamed(xibName, owner: nil, options: nil)!
            .flatMap { $0 as? Self }
            .first!
    }
}
