//
//  ViewController.m
//  UIImage Scanline Floodfill
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    UIImage *img = [UIImage imageNamed:@"color.png"];
//    
//    NSLog(@"%lf",CACurrentMediaTime());
//    
//    UIImage *image = [imageView.image floodFillColor:[self colorAtPosition:CGPointMake(10, 200) inImage:img]
//                                           withColor:[UIColor redColor]
//                                             atPoint:CGPointMake(10, 200)
//                                       withTolerance:1
//                                               image:img];
//    NSLog(@"%lf",CACurrentMediaTime());
//    
//    [imageView setImage:image];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
