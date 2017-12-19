//
//  HomeDatasourceController+navbar.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
    func setupNavigationBarItems() {
        navigationItem.leftBarButtonItem = #imageLiteral(resourceName: "follow").customBarButton()
        navigationItem.rightBarButtonItems = [#imageLiteral(resourceName: "compose").customBarButton(), #imageLiteral(resourceName: "search").customBarButton()]
        navigationItem.titleView = #imageLiteral(resourceName: "title_icon").customBarItemView()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        func replaceNavigatonBarSeparator() {
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            
            let thin_navBarSeparator = UIView.veryLightGrayView
            view.addSubview(thin_navBarSeparator)
            thin_navBarSeparator.anchor(view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, heightConstant: 0.5)
        }
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        replaceNavigatonBarSeparator()
    }
}

