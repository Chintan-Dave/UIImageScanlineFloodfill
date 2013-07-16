//
//  UIImage+FloodFill.h
//  ImageFloodFilleDemo
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FloodFill)

- (UIImage *) floodFillColor:(UIColor *)oldColor
                   withColor:(UIColor *)newColor
                     atPoint:(CGPoint)starPoint
               withTolerance:(int)olerance;
@end