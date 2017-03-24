//
//  CoverFlow.m
//  CoverFlow
//
//  Created by Jeheon Choi on 2017. 3. 24..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "CoverFlow.h"

@implementation CoverFlow

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *resultAttributeArray = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in attributesInRect) {

        UICollectionViewLayoutAttributes *copyAttributes = [attribute copy];
        
        
        CGFloat colletionViewCenterX = self.collectionView.contentOffset.x + (self.collectionView.bounds.size.width / 2.0f);

        CGFloat maxDistance = self.itemSize.width + self.minimumLineSpacing;
        CGFloat distance = MIN(fabs(attribute.center.x - colletionViewCenterX), maxDistance);
        
        CGFloat ratio = (maxDistance - distance) / maxDistance;
        
        CGFloat itemAlpha = 0.5f + (0.5f * ratio);
        CGFloat itemScale = 1.0f + (0.5f * ratio);
        
        copyAttributes.alpha = itemAlpha;
        copyAttributes.transform3D = CATransform3DScale(CATransform3DIdentity, itemScale, itemScale, 1);
        copyAttributes.zIndex = 10 * itemAlpha;
        
        [resultAttributeArray addObject:copyAttributes];
    }
    
    return resultAttributeArray;

}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}



- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat actualXOffset = proposedContentOffset.x + (self.collectionView.bounds.size.width / 2.0f);
    
    NSArray<UICollectionViewLayoutAttributes *> *attributeArray = [self layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    attributeArray = [attributeArray sortedArrayUsingComparator:^NSComparisonResult(UICollectionViewLayoutAttributes * _Nonnull obj1, UICollectionViewLayoutAttributes * _Nonnull obj2) {
        
        if (fabs(obj1.center.x - actualXOffset) > fabs(obj2.center.x - actualXOffset)) {
            return NSOrderedDescending;
            
        } else if (fabs(obj1.center.x - actualXOffset) > fabs(obj2.center.x - actualXOffset)) {
            return NSOrderedAscending;
        
        } else {
            return NSOrderedSame;

        }
    }];
    
    CGFloat resultOffsetXValue = attributeArray.firstObject.center.x - (self.collectionView.bounds.size.width / 2.0f);
    
    CGPoint resultPoint = CGPointMake(resultOffsetXValue, 0);
    
    return resultPoint;
}

@end
