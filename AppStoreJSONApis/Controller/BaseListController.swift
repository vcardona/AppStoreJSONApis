//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 29/01/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init()
    {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
