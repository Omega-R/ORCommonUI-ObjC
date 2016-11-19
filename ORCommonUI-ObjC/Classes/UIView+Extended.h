//
//  UIView+Extended.h
//  Pods
//
//  Created by Maxim Soloviev on 08/10/15.
//  Copyright © 2015 Maxim Soloviev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extended)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, readonly) CGFloat halfWidth;
@property (nonatomic, readonly) CGFloat halfHeight;

- (void) removeAllSubviews;
- (void) removeAllGestureRecognizers;

- (void) resizeToHeight:(int)height;
- (void) resizeToWidth:(int)width;

- (void) centerizeAndResize;
- (void) centerizeWithNewWidth:(float)width andHeight:(float)height;

- (void) centerize;
- (void) horizontalCenterize;
- (void) verticalCenterize;

- (void)addSubview:(UIView *)subview topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset bottomOffset:(CGFloat)bottomOffset leftOffset:(CGFloat)leftOffset;

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

@end
