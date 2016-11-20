//
//  ORTopAlignedLabel.m
//  Dowoodle
//
//  Created by Maxim Soloviev on 26/09/2016.
//  Copyright © 2016 YPSOURCE. All rights reserved.
//

#import "ORTopAlignedLabel.h"

@implementation ORTopAlignedLabel

- (void)drawTextInRect:(CGRect)rect
{
    if (self.text && self.topAlignmentEnabled) {
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = self.font;
        
        NSRange range = NSMakeRange(0, 0);
        NSParagraphStyle *paragraphStyle = [self.attributedText attribute:NSParagraphStyleAttributeName atIndex:NSMaxRange(range) effectiveRange:&range];
        if (paragraphStyle) {
            NSMutableParagraphStyle *mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
            mutableParagraphStyle.lineSpacing = paragraphStyle.lineSpacing;
            attributes[NSParagraphStyleAttributeName] = mutableParagraphStyle;
        }
        
        CGSize labelStringSize = [self.text boundingRectWithSize:CGSizeMake(ceilf(self.frame.size.width), CGFLOAT_MAX)
                                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                      attributes:attributes
                                                         context:nil].size;
        [super drawTextInRect:CGRectMake(0, 0, ceilf(self.frame.size.width), ceilf(labelStringSize.height))];
    } else {
        [super drawTextInRect:rect];
    }
}

@end
