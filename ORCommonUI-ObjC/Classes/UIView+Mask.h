//
//  UIView+Mask.h
//  Pods
//
//  Created by Maxim Soloviev on 30/10/15.
//  Copyright © 2015 Maxim Soloviev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Mask)

- (void)or_applyCenteredMaskWithRadius:(CGFloat)radius;
- (void)or_applyCenteredMaskWithRadius:(CGFloat)radius innerBorderColor:(UIColor *)borderColor;

- (void)or_applyTopRoundCornersMaskWithRadius:(CGFloat)radius;
- (void)or_applyBottomRoundCornersMaskWithRadius:(CGFloat)radius;

- (void)or_removeMask;

@end
