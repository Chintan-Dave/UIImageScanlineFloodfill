//
//  FloodFillImageView.m
//  ImageFloodFilleDemo
//
//  Created by chintan on 11/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//
//
#import "FloodFillImageView.h"

@implementation FloodFillImageView

@synthesize tolorance,newcolor;

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint tpoint = [[[event allTouches] anyObject] locationInView:self];
    
    tpoint.x = tpoint.x * 2 ;
    tpoint.y = tpoint.y * 2 ;
    
    UIImage *image1 = [self.image floodFillFromPoint:tpoint withColor:newcolor andTolerance:tolorance];
    
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        [self setImage:image1];
    });
}
@end