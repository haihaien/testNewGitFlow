//
//  DynamicLayout.swift
//  SwiftTest
//
//  Created by 张阳浩 on 17/4/19.
//  Copyright © 2017年 张阳浩. All rights reserved.
//

import UIKit

class DynamicLayout: UICollectionViewFlowLayout {
    var dynamicAnimator : UIDynamicAnimator!
    var items : Array<UICollectionViewLayoutAttributes>?
    
    override init() {
        super.init()
        self.itemSize = CGSize.init(width: UIScreen.main.bounds.width, height: 100.0)
        self.minimumLineSpacing = 10.0
        self.minimumInteritemSpacing = 10.0
        self.dynamicAnimator = UIDynamicAnimator.init(collectionViewLayout: self)
    }
    
    
    
    override func prepare() {
        super.prepare()

        let CGSize = self.collectionView?.contentSize
        items = super.layoutAttributesForElements(in: CGRect.init(x: 0, y: 0, width: (CGSize?.width)!, height: (CGSize?.height)!))
        if self.dynamicAnimator.behaviors.count == 0 {
            for dy in items! {
                let behaviour = UIAttachmentBehavior.init(item: dy, attachedToAnchor: dy.center)
                behaviour.length = 0.0
                behaviour.damping = 0.8
                behaviour.frequency = 1.0
                self.dynamicAnimator.addBehavior(behaviour)
            }
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return self.items
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        let scrooView = self.collectionView
        let delta = newBounds.origin.y - (scrooView?.bounds.origin.y)!
        let tochLocation = self.collectionView?.panGestureRecognizer.location(in: self.collectionView)
        for behavor in (self.dynamicAnimator.behaviors as?Array<UIAttachmentBehavior>)! {
            let yD = tochLocation!.y - behavor.anchorPoint.y
            let yDistanceFromTouch = fabsf(Float(yD))
            let xD = tochLocation!.x - behavor.anchorPoint.x
            let xDistanceFromTouch = fabsf(Float(xD))
            let scrollResistance = (yDistanceFromTouch + xDistanceFromTouch) / 1500.0
            let LayoutAttributesItem = behavor.items.first
            var center = LayoutAttributesItem?.center
            if (delta < 0) {
                let Py = (delta>delta*CGFloat(scrollResistance)) ? delta : delta*CGFloat(scrollResistance)
                center?.y += Py;
            }
            else {
                let py = (delta>delta*CGFloat(scrollResistance)) ? delta*CGFloat(scrollResistance) : delta
                center?.y += py
            }
            LayoutAttributesItem?.center = center!;
            self.dynamicAnimator.updateItem(usingCurrentState: LayoutAttributesItem!)
            
        }
        
        return false
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.dynamicAnimator.layoutAttributesForCell(at: indexPath)
    }
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
