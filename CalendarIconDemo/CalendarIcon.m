//
//  CalendarIconView.m
//  zero1Demo
//
//  Created by DAN Zeitman on 6/18/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "CalendarIcon.h"

@implementation CalendarIcon

@synthesize  day,month;

- (id)initWithFrame:(CGRect )aFrame
{
    self = [super initWithFrame:aFrame];
    if (self) {
        // Initialization code
        self.frame =  aFrame ;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self renderArtwork];
}
 
-(void)renderArtwork{
    //// Color Declarations
    UIColor* white = [UIColor whiteColor];//[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
 
     
   UIColor* black = [UIColor blackColor];// [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Frames
    CGRect frame = self.bounds;
 
    
    //// Subframes
    CGRect anchorTL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 0) * 0.2), floor((CGRectGetHeight(frame) - 0) * 0.4));
    CGRect anchorTR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 2 - floor((CGRectGetWidth(frame) - 2) * 0.19), CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 2) * 0.19), floor((CGRectGetHeight(frame) - 0) * 0.4));
    CGRect anchorBL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + CGRectGetHeight(frame) - 4 - floor((CGRectGetHeight(frame) - 4) * 0.03), floor((CGRectGetWidth(frame) - 0) * 0.07), floor((CGRectGetHeight(frame) - 4) * 0.03));
    CGRect anchorBR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 3 - floor((CGRectGetWidth(frame) - 3) * 0.07), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 4 - floor((CGRectGetHeight(frame) - 4) * 0.03), floor((CGRectGetWidth(frame) - 3) * 0.07), floor((CGRectGetHeight(frame) - 4) * 0.03));
    CGRect dayFrame1 = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.07), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.43), floor(CGRectGetWidth(frame) * 0.86), floor(CGRectGetHeight(frame) * 0.5));
    CGRect monthFrame1 = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.2), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.14), floor(CGRectGetWidth(frame) * 0.58), floor(CGRectGetHeight(frame) * 0.2));
    
    //// Abstracted Graphic Attributes
    NSString* dayContent = self.day;
    UIFont* dayFont = [UIFont fontWithName: @"Copperplate-Bold" size: 190];
    NSString* monthContent = self.month;
    UIFont* monthFont = [UIFont fontWithName: @"Copperplate" size: 32];;
    
    
    //// background Drawing
    UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRect:frame];
    [[UIColor whiteColor] setFill];
    [backgroundPath fill];
    
    
    
    //// calendarBackground Drawing
    UIBezierPath* calendarBackgroundPath = [UIBezierPath bezierPath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.87 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.51 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.44 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.85 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.91 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.16 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.1 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.51 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.57 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.83 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.59 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBL) + 0.44 * CGRectGetWidth(anchorBL), CGRectGetMinY(anchorBL) + 0.59 * CGRectGetHeight(anchorBL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.95 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.95 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.83 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.59 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [black setFill];
    [calendarBackgroundPath fill];
    
    
    
    //// day Drawing
    CGRect dayRect = CGRectMake(CGRectGetMinX(dayFrame1) + floor(CGRectGetWidth(dayFrame1) * 0.05), CGRectGetMinY(dayFrame1) + floor(CGRectGetHeight(dayFrame1) * 0.04), floor(CGRectGetWidth(dayFrame1) * 0.91), floor(CGRectGetHeight(dayFrame1) * 0.9));
    [white setFill];
  //  [dayContent drawInRect: dayRect withFont: dayFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    [self drawString:dayContent
      centeredInRect:dayFrame1 font:dayFont];

    
    //// month Drawing
    CGRect monthRect = CGRectMake(CGRectGetMinX(monthFrame1) + floor(CGRectGetWidth(monthFrame1) * 0), CGRectGetMinY(monthFrame1) + floor(CGRectGetHeight(monthFrame1) * 0.15), floor(CGRectGetWidth(monthFrame1) * 1), floor(CGRectGetHeight(monthFrame1) * 0.75));
    [white setFill];
   // [monthContent drawInRect: monthRect withFont: monthFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    [self drawString:monthContent
      centeredInRect:monthFrame1 font:monthFont];

 
}
-(void)drawit{
    //// Color Declarations
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect anchorTL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 0) * 0.21), floor((CGRectGetHeight(frame) - 0) * 0.41));
    CGRect anchorTR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 2 - floor((CGRectGetWidth(frame) - 2) * 0.2), CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 2) * 0.2), floor((CGRectGetHeight(frame) - 0) * 0.41));
    CGRect anchorBL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + CGRectGetHeight(frame) - 4 - floor((CGRectGetHeight(frame) - 4) * 0.03), floor((CGRectGetWidth(frame) - 0) * 0.08), floor((CGRectGetHeight(frame) - 4) * 0.03));
    CGRect anchorBR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 3 - floor((CGRectGetWidth(frame) - 3) * 0.08), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 4 - floor((CGRectGetHeight(frame) - 4) * 0.03), floor((CGRectGetWidth(frame) - 3) * 0.08), floor((CGRectGetHeight(frame) - 4) * 0.03));
    CGRect dayFrame1 = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.1), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.44), floor(CGRectGetWidth(frame) * 0.77), floor(CGRectGetHeight(frame) * 0.47));
    CGRect monthFrame1 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * 0.49), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 18) * 0.18), 53, 18);
    
    //// Abstracted Graphic Attributes
    NSString* dayContent = self.day;
    UIFont* dayFont = [UIFont fontWithName: @"Copperplate-Bold" size: 160];
    NSString* monthContent = self.month;
    UIFont* monthFont = [UIFont fontWithName: @"Copperplate" size: 21.0];
    
    // draw whitebackground
    UIBezierPath* bgd = [UIBezierPath bezierPathWithRect: frame];
    [[white colorWithAlphaComponent:1.0] setFill];
    [bgd fill];
    

    
    //// calendarBackground Drawing
    UIBezierPath* calendarBackgroundPath = [UIBezierPath bezierPath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.87 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.51 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.44 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.85 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.91 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.16 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.1 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.51 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.57 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.83 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.59 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBL) + 0.44 * CGRectGetWidth(anchorBL), CGRectGetMinY(anchorBL) + 0.59 * CGRectGetHeight(anchorBL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.95 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.95 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.83 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.59 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [black setFill];
    [calendarBackgroundPath fill];
    
    
    
    //// day Drawing
    CGRect dayRect = CGRectMake(CGRectGetMinX(dayFrame1) + floor(CGRectGetWidth(dayFrame1) * 0.1), CGRectGetMinY(dayFrame1) + floor(CGRectGetHeight(dayFrame1) * 0.02), floor(CGRectGetWidth(dayFrame1) * 0.83), floor(CGRectGetHeight(dayFrame1) * 0.93));
    [white setFill];
 //   [dayContent drawInRect: dayRect withFont: dayFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    [self drawString:dayContent
      centeredInRect:dayRect font:dayFont];
    
    //// month Drawing
    CGRect monthRect = CGRectMake(CGRectGetMinX(monthFrame1) + floor(CGRectGetWidth(monthFrame1) * -0.04), CGRectGetMinY(monthFrame1) + floor(CGRectGetHeight(monthFrame1) * 0), floor(CGRectGetWidth(monthFrame1) * 1.08), floor(CGRectGetHeight(monthFrame1) * 1));
    [white setFill];
    [monthContent drawInRect: monthRect withFont: monthFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    
   // [self drawString:monthContent  centeredInRect:monthRect font:monthFont];

}

-(void)drawArtwork{

    //// Color Declarations
    UIColor *white =  [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor *black =  [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
        
    //// Frames
    CGRect frame = self.bounds;  
    
    //// Subframes
    CGRect anchorTL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 0) * 0.21), floor((CGRectGetHeight(frame) - 0) * 0.37));
    CGRect anchorTR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 2 - floor((CGRectGetWidth(frame) - 2) * 0.21), CGRectGetMinY(frame) + 0, floor((CGRectGetWidth(frame) - 2) * 0.21), floor((CGRectGetHeight(frame) - 0) * 0.37));
    CGRect anchorBL = CGRectMake(CGRectGetMinX(frame) + 0, CGRectGetMinY(frame) + CGRectGetHeight(frame) - 14 - floor((CGRectGetHeight(frame) - 14) * 0.03), floor((CGRectGetWidth(frame) - 0) * 0.08), floor((CGRectGetHeight(frame) - 14) * 0.03));
    CGRect anchorBR = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 5 - floor((CGRectGetWidth(frame) - 5) * 0.08), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 14 - floor((CGRectGetHeight(frame) - 14) * 0.03), floor((CGRectGetWidth(frame) - 5) * 0.08), floor((CGRectGetHeight(frame) - 14) * 0.03));
    CGRect dayFrame = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.05), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.4), floor(CGRectGetWidth(frame) * 0.9), floor(CGRectGetHeight(frame) * 0.51));
    CGRect monthFrame = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.24), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.13), floor(CGRectGetWidth(frame) * 0.52), floor(CGRectGetHeight(frame) * 0.18));
    
    //// Abstracted Graphic Attributes
    NSString* dayContent = self.day;
    UIFont* dayFont = [UIFont fontWithName: @"Copperplate-Bold" size: 172];
    NSString* monthContent = self.month;
    UIFont* monthFont = [UIFont fontWithName: @"Copperplate" size: 40];
    
    
    // draw whitebackground
    UIBezierPath* bgd = [UIBezierPath bezierPathWithRect: frame];
    [[white colorWithAlphaComponent:1.0] setFill];
    [bgd fill];
    
    //// calendarBackground Drawing
    UIBezierPath* calendarBackgroundPath = [UIBezierPath bezierPath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.87 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.51 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.39 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.44 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.85 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.54 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.91 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.62 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.59 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.97 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.3 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.16 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.05 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.1 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.51 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.54 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.57 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.62 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.59 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.63 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.3 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.87 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.74 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.69 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBL) + 0.44 * CGRectGetWidth(anchorBL), CGRectGetMinY(anchorBL) + 0.59 * CGRectGetHeight(anchorBL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.14 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.95 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.88 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.95 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorBR) + 0.74 * CGRectGetWidth(anchorBR), CGRectGetMinY(anchorBR) + 0.69 * CGRectGetHeight(anchorBR))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.57 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.53 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.76 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.87 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.82 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.59 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.15 * CGRectGetHeight(anchorTL)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTL) + 0.53 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.08 * CGRectGetHeight(anchorTL)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.11 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTL) + 0.48 * CGRectGetWidth(anchorTL), CGRectGetMinY(anchorTL) + 0.49 * CGRectGetHeight(anchorTL))];
    [calendarBackgroundPath closePath];
    [calendarBackgroundPath moveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.57 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.53 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.41 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.53 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.48 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.24 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addCurveToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.15 * CGRectGetHeight(anchorTR)) controlPoint1: CGPointMake(CGRectGetMinX(anchorTR) + 0.18 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.08 * CGRectGetHeight(anchorTR)) controlPoint2: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.11 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(anchorTR) + 0.13 * CGRectGetWidth(anchorTR), CGRectGetMinY(anchorTR) + 0.49 * CGRectGetHeight(anchorTR))];
    [calendarBackgroundPath closePath];
    [black setFill];
    [calendarBackgroundPath fill];
    
    
    
    //// day Drawing
  //  CGRect dayRect = CGRectMake(CGRectGetMinX(dayFrame) + floor(CGRectGetWidth(dayFrame) * 0.05), CGRectGetMinY(dayFrame) + floor(CGRectGetHeight(dayFrame) * 0.07), floor(CGRectGetWidth(dayFrame) * 0.89), floor(CGRectGetHeight(dayFrame) * 0.87));
    
    CGRect dayRect = CGRectMake(CGRectGetMinX(dayFrame), CGRectGetMinY(dayFrame) ,  CGRectGetWidth(dayFrame), CGRectGetHeight(dayFrame) );
    
    [white setFill];
  //  [dayContent drawInRect: dayRect withFont: dayFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    [self drawString:dayContent
      centeredInRect:dayRect font:dayFont];

    
    //// month Drawing
    CGRect monthRect = CGRectMake(CGRectGetMinX(monthFrame) + floor(CGRectGetWidth(monthFrame) * 0.04), CGRectGetMinY(monthFrame) + floor(CGRectGetHeight(monthFrame) * 0.13), floor(CGRectGetWidth(monthFrame) * 0.88), floor(CGRectGetHeight(monthFrame) * 0.75));
    [white setFill];
   // [monthContent drawInRect: monthRect withFont: monthFont lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    [self drawString:monthContent
      centeredInRect:monthRect font:monthFont];


}

 

- (void) drawString: (NSString *) string
   centeredInRect: (CGRect) rect
             font: (UIFont *) font {
    CGSize textSize = [string sizeWithFont: font
                       constrainedToSize: rect.size
                           lineBreakMode: UILineBreakModeWordWrap];
    
    // Center text rect inside of |rect|.
    CGRect textRect = CGRectMake (CGRectGetMidX(rect) - textSize.width / 2.0,
                                  CGRectGetMidY(rect) - textSize.height / 2.0,
                                  textSize.width, textSize.height);
    
    [string drawInRect: textRect
            withFont: font
       lineBreakMode: UILineBreakModeWordWrap
           alignment: UITextAlignmentCenter];
    
} 

 

 

@end
