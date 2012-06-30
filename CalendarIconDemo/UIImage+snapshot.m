//
//  UIImage+snapshot.m
//  zero1Demo
//
//  Created by DAN Zeitman on 6/18/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Snapshot.h"

@implementation UIImage (Snapshot)



+ (void)beginImageContextWithSize:(CGSize)size
{
if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
    if ([[UIScreen mainScreen] scale] == 2.0) {
        
       UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
     } else {
        UIGraphicsBeginImageContext(size);
    }
} else {
    UIGraphicsBeginImageContext(size);
}
}

+ (void)endImageContext
{
    UIGraphicsEndImageContext();
}

+ (UIImage*)imageFromView:(UIView*)view
{
    [self beginImageContextWithSize:[view bounds].size];
    BOOL hidden = [view isHidden];
    [view setHidden:NO];
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    [view setHidden:hidden];
    return image;
}

+ (UIImage*)imageFromView:(UIView*)view scaledToSize:(CGSize)newSize
{
    UIImage *image = [self imageFromView:view];
    if ([view bounds].size.width != newSize.width ||
        [view bounds].size.height != newSize.height) {
        image = [self imageWithImage:image scaledToSize:newSize];
    }
    return image;
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    [self beginImageContextWithSize:newSize];
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    return newImage;
}

+ (UIImage *)scaledToSize:(CGSize)newSize
{
    [self beginImageContextWithSize:newSize];
    [(UIImage*)self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    return newImage;
}



+ (UIImage *) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage; 
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
    
}


/*
 
 
 - (UIImage*) buildSwatch: (int) aBrightness
 {
 CGRect rect = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
 UIGraphicsBeginImageContext(rect.size);
 UIBezierPath *path = [UIBezierPath
 bezierPathWithRoundedRect:rect cornerRadius:4.0f];
 [[[UIColor blackColor]
 colorWithAlphaComponent:(float) aBrightness / 10.0f] set];
 [path fill];
 
 UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 
 return image;
 }

 
 */
@end 