//
//  UIView + SnapKit.swift
//  PetProject
//
//  Created by Georhii Kasilov on 08.02.2021.
//

import SnapKit
import UIKit

public extension UIView {
    func layout(using closure: (ConstraintMaker) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        snp.makeConstraints(closure)
    }

    func addSubview(_ view: UIView, using closure: (ConstraintMaker) -> Void) {
        addSubview(view)
        view.layout(using: closure)
    }
}
