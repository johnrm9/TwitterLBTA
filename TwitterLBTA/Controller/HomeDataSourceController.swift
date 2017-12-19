//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import LBTAComponents

class HomeDataSourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .twitterBackground
        
        setupNavigationBarItems()
        
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat
        
        if let user = self.datasource?.item(indexPath) as? User {
            let approximateWidth = view.frame.width - 12 - 50 - 12 - 2
            let estimatedRect = CGRect.estimatedBoundingRectWithString(user.bioText, approximateWidth: approximateWidth, attributes: [.font: UIFont.systemFont(ofSize: 15)])
            height = estimatedRect.height + 66
        } else {
            height = 200
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 1 ? .zero : CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return section == 1 ? .zero : CGSize(width: view.frame.width, height: 50 + 14)
    }
}


