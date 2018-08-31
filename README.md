**UIImageScanlineFloodfill**
============================

### This is an Objective-C implementation of Scanline Flood Fill Algorithm.

Before Flood Fill | After Flood Fill
------------ | -------------
![](https://raw.github.com/Chintan-Dave/UIImageScanlineFloodfill/master/Images/IMG_0126.PNG) | ![](https://raw.github.com/Chintan-Dave/UIImageScanlineFloodfill/master/Images/IMG_0127.PNG)

I have used Scanline Floodfill Algorithm because it is faster than 4 way and 8 way. Implement using iterative logic because iPhone have very limite capicity compare to computeer and recursive implementation make stackoverflow exception.

I have try my best to make it fast but it is still in its beginning phase so any suggestion and contribution is welcome.

This is part of my iOS drawing app.

When I search for flood fil on internet I found that there are many implementation for c, c#, Java etc. but for Objective - C there are only 2 or 3 implementation and not very easy to understand.

So I decide to share my work.

#### **I would like to thanks:**
*   [How to get pixel data from a UIImage (Cocoa Touch) or CGImage (Core Graphics)](http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics)
*   [A Faster Array in Objective-c](http://iwantmyreal.name/blog/2012/09/29/a-faster-array-in-objective-c/)
*   [Lode's Computer Graphics Tutorial Flood Fill](http://lodev.org/cgtutor/floodfill.html)
*   [Converting touch point to image point](https://github.com/nubbel/UIImageView-GeometryConversion)

### How It Work ?
For Implementation detail visit : [Scanline Flood Fill Algorithm with (or without) Tolerance in Objective-C](http://ilearnios.wordpress.com/2013/07/18/scanline-flood-fill-algorithm-with-or-without-tolerance-in-objective-c/)

### **How To Use It:**
If you wan to use this directly in your project that do as follow:

1.  Copy Folllowing file in your project
    1.  `LinkedListStack.h`
    2.  `LinkedListStack.m`
    3.  `UIImage+FloodFill.h`
    4.  `UIImage+FloodFill.m`
2.  `UIImage+FloodFill.h` file where you want to use this .
3.  Call flood fill function with all argument like folloeing

`UIImage *image1 = [self.image floodFillFromPoint:tpoint withColor:[UIColor grayColor] andTolerance:tolerance];`

### Limitation(s)
We have some hard time dealing with the Alpha channel (transparency). We are still working on that.  
As a workground right now we are replacinng Alpha to White color by converting an image to JPEG.  
If you don't want to use this behaviour you can comment (Or Remove) frollowinng method from FloodFillImageView  
`- (void)setImage:(UIImage *)image`

#### License : [MIT LICENSE FILE](https://github.com/chinatndave/UIImageScanlineFloodfill/blob/master/LICENSE)
