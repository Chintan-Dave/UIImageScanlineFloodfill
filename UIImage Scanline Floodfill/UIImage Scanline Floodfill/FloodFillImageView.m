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

@synthesize tolorance;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%lf",CACurrentMediaTime());
 
    CGPoint tpoint = [[[event allTouches] anyObject] locationInView:self];
    
    tpoint.x = tpoint.x * 2;
    tpoint.y = tpoint.y * 2;
    
    UIImage *image1 = [self.image floodFillFromPoint:tpoint withColor:[UIColor grayColor] andTolerance:1];
    
    NSLog(@"%lf",CACurrentMediaTime());
 
    [self setImage:image1];
}
@end