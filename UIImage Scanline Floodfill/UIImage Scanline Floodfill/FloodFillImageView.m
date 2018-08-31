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
    //Get touch Point
    CGPoint tpoint = [[[event allTouches] anyObject] locationInView:self];
  
    //Convert touch Point to image point
    CGPoint imageTouchPoint = [self convertPointFromView:tpoint];
  
    //Call function to flood fill and get new image with filled color
    UIImage *image1 = [self.image floodFillFromPoint:imageTouchPoint
                                           withColor:newcolor
                                        andTolerance:tolorance];
    
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        [self setImage:image1];
    });
}

/*
 This method is created by "Dominique d'Argent"
 https://github.com/nubbel/UIImageView-GeometryConversion
*/
- (CGPoint)convertPointFromView:(CGPoint)viewPoint {
  CGPoint imagePoint = viewPoint;
  
  CGSize imageSize = self.image.size;
  CGSize viewSize  = self.bounds.size;
  
  CGFloat ratioX = viewSize.width / imageSize.width;
  CGFloat ratioY = viewSize.height / imageSize.height;
  
  UIViewContentMode contentMode = self.contentMode;
  
  switch (contentMode) {
    case UIViewContentModeScaleToFill:
    case UIViewContentModeRedraw:
    {
      imagePoint.x /= ratioX;
      imagePoint.y /= ratioY;
      break;
    }
      
    case UIViewContentModeScaleAspectFit:
    case UIViewContentModeScaleAspectFill:
    {
      CGFloat scale;
      
      if (contentMode == UIViewContentModeScaleAspectFit) {
        scale = MIN(ratioX, ratioY);
      }
      else /*if (contentMode == UIViewContentModeScaleAspectFill)*/ {
        scale = MAX(ratioX, ratioY);
      }
      
      // Remove the x or y margin added in FitMode
      imagePoint.x -= (viewSize.width  - imageSize.width  * scale) / 2.0f;
      imagePoint.y -= (viewSize.height - imageSize.height * scale) / 2.0f;
      
      imagePoint.x /= scale;
      imagePoint.y /= scale;
      
      break;
    }
      
    case UIViewContentModeCenter:
    {
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0f;
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0f;
      
      break;
    }
      
    case UIViewContentModeTop:
    {
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0f;
      
      break;
    }
      
    case UIViewContentModeBottom:
    {
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0f;
      imagePoint.y -= (viewSize.height - imageSize.height);
      
      break;
    }
      
    case UIViewContentModeLeft:
    {
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0f;
      
      break;
    }
      
    case UIViewContentModeRight:
    {
      imagePoint.x -= (viewSize.width - imageSize.width);
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0f;
      
      break;
    }
      
    case UIViewContentModeTopRight:
    {
      imagePoint.x -= (viewSize.width - imageSize.width);
      
      break;
    }
      
    case UIViewContentModeBottomLeft:
    {
      imagePoint.y -= (viewSize.height - imageSize.height);
      
      break;
    }
      
    case UIViewContentModeBottomRight:
    {
      imagePoint.x -= (viewSize.width - imageSize.width);
      imagePoint.y -= (viewSize.height - imageSize.height);
      
      break;
    }
      
    case UIViewContentModeTopLeft:
    default:
    {
      break;
    }
  }
  
  return imagePoint;
}

- (void)setImage:(UIImage *)image {
  NSData *imageData = UIImageJPEGRepresentation(image, 1);
  UIImage *newImage = [UIImage imageWithData:imageData];
  
  [super setImage:newImage];
}

@end
