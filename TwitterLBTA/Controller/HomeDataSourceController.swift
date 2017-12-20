//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import LBTAComponents
import TRON

class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .red
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView?.backgroundColor = .twitterBackground
        
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err {
                if let apiError = err as? APIError<Service.JSONError>, let response = apiError.response {
                    self.errorMessageLabel.text = "Apologies something went wrong. Please try again later..." + "\nReponse Status code was \(response.statusCode)"
                }
               self.errorMessageLabel.isHidden = false
            } else {
                self.datasource = homeDatasource
            }
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let approximateWidth: CGFloat = indexPath.section == 0 ? (width - 12 - 50 - 12 - 2) : indexPath.section == 1 ? (width - 12 - 50 - 12 - 2) : 0
        
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
            let estimatedRect = CGRect.estimatedBoundingRectWithString(user.bioText, approximateWidth: approximateWidth, attributes: [.font: UIFont.systemFont(ofSize: 15)])
            return CGSize(width: width, height: estimatedRect.height + 66)
        } else if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return .zero }
            let estimatedRect = CGRect.estimatedBoundingRectWithString(tweet.message, approximateWidth: approximateWidth, attributes: [.font: UIFont.systemFont(ofSize: 15)])
            return CGSize(width: width, height: estimatedRect.height + 74)
        }
        
        return CGSize(width: width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 1 ? .zero : CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return section == 1 ? .zero : CGSize(width: view.frame.width, height: 50 + 14)
    }
}


