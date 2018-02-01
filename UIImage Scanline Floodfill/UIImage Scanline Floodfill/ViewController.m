//
//  ViewController.m
//  UIImage Scanline Floodfill
//
//  Created by chintan on 15/07/13.
//  Copyright (c) 2013 ZWT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIImage *selectedImage;

@end

@implementation ViewController

@synthesize txtTolerance;
@synthesize imageView;
@synthesize selectedImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    imageView.tolorance = [txtTolerance.text intValue];
    selectedImage = imageView.image;
    imageView.newcolor = [UIColor redColor];
}

- (IBAction)btnSetTap:(UIButton *)sender
{
    [txtTolerance resignFirstResponder];
    imageView.tolorance = [txtTolerance.text intValue];
    [imageView setImage:selectedImage];
}

- (IBAction)btnColorTap:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 1:
            imageView.newcolor = [UIColor redColor];
            break;
        case 2:
            imageView.newcolor = [UIColor greenColor];
            break;
        case 3:
            imageView.newcolor = [UIColor blueColor];
            break;
        case 4:
            imageView.newcolor = [UIColor blackColor];
            break;
        case 5:
            imageView.newcolor = [UIColor darkGrayColor];
            break;
    }
}

- (IBAction)btnChangeImageTap:(UIButton *)sender
{
    imageView.image = [sender imageForState:UIControlStateNormal];
    selectedImage = imageView.image;
}

@end
