//
//  UIImage+FloodFill.h
//  ImageFloodFilleDemo
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkedListStack.h"

typedef struct {
    int red;
    int green;
    int blue;
    int alpha;
} color;

@interface UIImage (FloodFill)

- (UIImage *) floodFillFromPoint:(CGPoint)startPoint withColor:(UIColor *)newColor andTolerance:(int)tolerance;
@end