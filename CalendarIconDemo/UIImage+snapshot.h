//
//  UIImage+snapshot.h
//  zero1Demo
//
//  Created by DAN Zeitman on 6/18/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Snapshot)
+ (UIImage*)imageFromView:(UIView*)view;
+ (UIImage*)imageFromView:(UIView*)view scaledToSize:(CGSize)newSize;
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage*)scaledToSize:(CGSize)newSize;
+ (UIImage *) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;
@end

