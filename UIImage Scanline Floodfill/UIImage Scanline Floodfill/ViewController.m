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

@synthesize txtTolerance;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSetTap:(UIButton *)sender
{
    [txtTolerance resignFirstResponder];
    imageView.tolorance = [txtTolerance.text intValue];
    [imageView setImage:[UIImage imageNamed:@"image1.PNG"]];
}
@end
