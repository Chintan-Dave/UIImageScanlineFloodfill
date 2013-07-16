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
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
 
    UIImage *img = [UIImage imageNamed:@"color1.png"];
 
    NSLog(@"%lf",CACurrentMediaTime());
 
    CGPoint tpoint = [[[event allTouches] anyObject] locationInView:self];
    
    tpoint.x = tpoint.x * 2;
    tpoint.y = tpoint.y * 2;
    
    UIImage *image1 = [self.image floodFillColor:[self colorAtPosition:tpoint inImage:img]
                                           withColor:[UIColor redColor]
                                             atPoint:tpoint
                                       withTolerance:1
                                               image:img];
    NSLog(@"%lf",CACurrentMediaTime());
 
    [self setImage:image1];
}

- (UIColor *)colorAtPosition:(CGPoint)position inImage:(UIImage *)image
{
    
    CGRect sourceRect = CGRectMake(position.x, position.y, 1.f, 1.f);
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, sourceRect);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *buffer = malloc(4);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    CGContextRef context = CGBitmapContextCreate(buffer, 1, 1, 8, 4, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0.f, 0.f, 1.f, 1.f), imageRef);
    CGImageRelease(imageRef);
    CGContextRelease(context);
    
    CGFloat r = buffer[0] / 255.f;
    CGFloat g = buffer[1] / 255.f;
    CGFloat b = buffer[2] / 255.f;
    CGFloat a = buffer[3] / 255.f;
    
    free(buffer);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end