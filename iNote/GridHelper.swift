//
//  GridHelper.swift
//  iNote
//
//  Created by Janice Kartika on 1/18/18.
//  Copyright © 2018 Bukalapak. All rights reserved.
//

import UIKit

class GridHelper: UICollectionViewFlowLayout {
    private var numberOfColumns: Int = 1
    
    init(numberOfColumns: Int) {
        super.init()
        
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        
        self.numberOfColumns = numberOfColumns
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var itemSize: CGSize {
        get {
            if let collectionView = collectionView {
                let itemWidth: CGFloat = (collectionView.frame.width / CGFloat(numberOfColumns)) - minimumInteritemSpacing
                let itemHeight: CGFloat = 80
                return CGSize(width: itemWidth, height: itemHeight)
            }
            
            // Default fallback
            return CGSize(width: 200, height: 100)
        }
        set {
            super.itemSize = newValue
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        if let collectionView = collectionView {
            return collectionView.contentOffset
        }
        return CGPoint.zero
    }
}
