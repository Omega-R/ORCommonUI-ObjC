//
//  UIView+Extended.m
//  Pods
//
//  Created by Maxim Soloviev on 08/10/15.
//  Copyright © 2015 Maxim Soloviev. All rights reserved.
//

#import "UIView+Extended.h"

@implementation UIView (Extended)

#pragma mark - Size and position

- (void) setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat) x {
    return self.frame.origin.x;
}

- (void) setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (void) setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat) width {
    return CGRectGetWidth(self.frame);
}

- (void) setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat) height {
    return CGRectGetHeight(self.frame);
}

- (CGFloat) halfWidth {
    return self.width / 2.0;
}

- (CGFloat) halfHeight {
    return self.height / 2.0;
}

#pragma mark - Working with subviews

- (void) removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
        [view removeAllGestureRecognizers];
    }
}

- (void) removeAllGestureRecognizers {
    for (UIGestureRecognizer *gestureRecognizer in self.gestureRecognizers) {
        [self removeGestureRecognizer:gestureRecognizer];
    }
}

- (void)addSubview:(UIView *)subview topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset bottomOffset:(CGFloat)bottomOffset leftOffset:(CGFloat)leftOffset {
    [self addSubview:subview];
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:topOffset]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:rightOffset]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:bottomOffset]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:leftOffset]];
    [self layoutSubviews];
}

#pragma mark - Centerizing and resizing

- (void) centerize {
    [self verticalCenterize];
    [self horizontalCenterize];
}

- (void) horizontalCenterize {
    self.x = (self.superview.width - self.width) / 2.0;
}

- (void) verticalCenterize {
    self.y = (self.superview.height - self.height) / 2.0;
}

- (void) resizeToHeight:(int) height {
    if (!self.height) {
        return;
    }
    float sizeFactor = self.width / self.height;
    
    self.height = height;
    self.width = height * sizeFactor;
}

- (void) resizeToWidth:(int) width {
    if (!self.width) {
        return;
    }
    float sizeFactor = self.width / self.height;
    
    self.width = width;
    self.height = width / sizeFactor;
}

- (void) centerizeAndResize {
    [self centerizeWithNewWidth:self.width andHeight:self.height];
}

- (void) centerizeWithNewWidth:(float)width andHeight:(float)height {
    float parentWidth = self.superview.width;
    float parentHeight = self.superview.height;
    
    float factor;
    
    if (width > parentWidth) {
        factor = width / height;
        width = parentWidth;
        height = width / factor;
    }
    
    if (height > parentHeight) {
        factor = width / height;
        height = parentHeight;
        width = height * factor;
    }
    
    CGRect frame;
    
    frame.size.width = width;
    frame.size.height = height;
    frame.origin.x = (parentWidth - width) / 2;
    frame.origin.y = (parentHeight - height) / 2;
    self.frame = frame;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

@end
