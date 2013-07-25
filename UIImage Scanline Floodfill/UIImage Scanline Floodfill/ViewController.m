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

@synthesize txtTolerance,txtAlpha;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageView.newcolor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSetTap:(UIButton *)sender
{
    [txtTolerance resignFirstResponder];
    [txtAlpha resignFirstResponder];
    
    imageView.tolorance = [txtTolerance.text intValue];
    imageView.newAlpha = [txtAlpha.text integerValue];
    
    [imageView setImage:[UIImage imageNamed:@"image3.PNG"]];
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
@end
