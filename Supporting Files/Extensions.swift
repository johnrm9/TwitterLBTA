//
//  Extensions.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import UIKit

extension UIColor {
    static var veryLightGray: UIColor {
        return UIColor(r: 230, g: 230, b: 230)
    }
}

extension CGRect {
    static var navBarIcon34x34: CGRect {
        return CGRect(x: 0, y: 0, width: 34, height: 34)
    }
}

extension UIImage {
    func customBarItemView(_ frame: CGRect = .navBarIcon34x34, contentMode: UIViewContentMode = .scaleAspectFit, imageRenderingMode: UIImageRenderingMode = .alwaysOriginal) -> UIView {
        let view = UIImageView(image: self.withRenderingMode(imageRenderingMode))
        view.frame = frame
        view.contentMode = contentMode
        return view
    }
}

extension UIImage {
    func customBarButton(_ frame: CGRect = .navBarIcon34x34, imageRendingMode: UIImageRenderingMode = .alwaysOriginal) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(self.withRenderingMode(imageRendingMode), for: .normal)
        button.frame = frame
        return UIBarButtonItem(customView: button)
    }
}

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

