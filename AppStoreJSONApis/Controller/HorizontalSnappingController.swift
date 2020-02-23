//
//  HorizontalSnappingController.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 23/02/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    init(){
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout{
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView else{
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemWidth = collectionView.frame.width - 48
        let pageNumber = collectionView.contentOffset.x / itemWidth
        
        return CGPoint(x: pageNumber * itemWidth, y:0)
    }
}
