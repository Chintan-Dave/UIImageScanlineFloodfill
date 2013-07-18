//
//  FloodFillImageView.h
//  ImageFloodFilleDemo
//
//  Created by chintan on 11/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+FloodFill.h"

@interface FloodFillImageView : UIImageView
@property int tolorance;
@property (strong, nonatomic)  UIColor *newcolor;
@end
