//
//  DrawView.m
//  zero1Demo
//
//  Created by DAN Zeitman on 6/18/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

@synthesize selectedTabIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* insetHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.75];
    UIColor* paperColor = [UIColor colorWithRed: 0.85 green: 0.8 blue: 0.63 alpha: 1];
    CGFloat paperColorRGBA[4];
    [paperColor getRed: &paperColorRGBA[0] green: &paperColorRGBA[1] blue: &paperColorRGBA[2] alpha: &paperColorRGBA[3]];
    
    UIColor* darkPaperColor = [UIColor colorWithRed: (paperColorRGBA[0] * 0.8) green: (paperColorRGBA[1] * 0.8) blue: (paperColorRGBA[2] * 0.8) alpha: (paperColorRGBA[3] * 0.8 + 0.2)];
    UIColor* lightPaperColor = [UIColor colorWithRed: (paperColorRGBA[0] * 0.5 + 0.5) green: (paperColorRGBA[1] * 0.5 + 0.5) blue: (paperColorRGBA[2] * 0.5 + 0.5) alpha: (paperColorRGBA[3] * 0.5 + 0.5)];
    UIColor* inkColor = [UIColor colorWithRed: 0.35 green: 0.73 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* paperGradientColors = [NSArray arrayWithObjects: 
                                    (id)paperColor.CGColor, 
                                    (id)[UIColor colorWithRed: 0.89 green: 0.85 blue: 0.72 alpha: 1].CGColor, 
                                    (id)lightPaperColor.CGColor, nil];
    CGFloat paperGradientLocations[] = {0, 0.15, 1};
    CGGradientRef paperGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)paperGradientColors, paperGradientLocations);
    
    //// Shadow Declarations
    CGColorRef highlight = insetHighlightColor.CGColor;
    CGSize highlightOffset = CGSizeMake(0, 1);
    CGFloat highlightBlurRadius = 0;
    CGColorRef shadow = [UIColor blackColor].CGColor;
    CGSize shadowOffset = CGSizeMake(-0, 1);
    CGFloat shadowBlurRadius = 11;
    
   /* 
    //// Rounded Rectangle 2 Drawing  Tab 1
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(120, 20, 80, 50) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow);
    [darkPaperColor setFill];
    [roundedRectangle2Path fill];
   
    ////// Rounded Rectangle 2 Inner Shadow
    CGRect roundedRectangle2BorderRect = CGRectInset([roundedRectangle2Path bounds], -highlightBlurRadius, -highlightBlurRadius);
    roundedRectangle2BorderRect = CGRectOffset(roundedRectangle2BorderRect, -highlightOffset.width, -highlightOffset.height);
    roundedRectangle2BorderRect = CGRectInset(CGRectUnion(roundedRectangle2BorderRect, [roundedRectangle2Path bounds]), -1, -1);
   
    UIBezierPath* roundedRectangle2NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle2BorderRect];
    [roundedRectangle2NegativePath appendPath: roundedRectangle2Path];
    roundedRectangle2NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = highlightOffset.width + round(roundedRectangle2BorderRect.size.width);
        CGFloat yOffset = highlightOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    highlightBlurRadius,
                                    highlight);
        
        [roundedRectangle2Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle2BorderRect.size.width), 0);
         [roundedRectangle2NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
         [roundedRectangle2NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    */
    
    /*
    //// Rounded Rectangle 3 Drawing tab 2
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(209, 20, 80, 50) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow);
    [darkPaperColor setFill];
    [roundedRectangle3Path fill];
    
    ////// Rounded Rectangle 3 Inner Shadow
    CGRect roundedRectangle3BorderRect = CGRectInset([roundedRectangle3Path bounds], -highlightBlurRadius, -highlightBlurRadius);
    roundedRectangle3BorderRect = CGRectOffset(roundedRectangle3BorderRect, -highlightOffset.width, -highlightOffset.height);
    roundedRectangle3BorderRect = CGRectInset(CGRectUnion(roundedRectangle3BorderRect, [roundedRectangle3Path bounds]), -1, -1);
    
    UIBezierPath* roundedRectangle3NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle3BorderRect];
    [roundedRectangle3NegativePath appendPath: roundedRectangle3Path];
    roundedRectangle3NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = highlightOffset.width + round(roundedRectangle3BorderRect.size.width);
        CGFloat yOffset = highlightOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    highlightBlurRadius,
                                    highlight);
        
        [roundedRectangle3Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle3BorderRect.size.width), 0);
        [roundedRectangle3NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [roundedRectangle3NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    */
    
   
    //// Bezier Drawing  first Tab
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(110, 26)];
    [bezierPath addLineToPoint: CGPointMake(110, 42)];
    [bezierPath addLineToPoint: CGPointMake(336, 42)];
    [bezierPath addLineToPoint: CGPointMake(336, 537)];
    [bezierPath addLineToPoint: CGPointMake(-2, 537)];
    [bezierPath addLineToPoint: CGPointMake(-2, 42)];
    [bezierPath addLineToPoint: CGPointMake(30, 42)];
    [bezierPath addLineToPoint: CGPointMake(30, 26)];
    [bezierPath addCurveToPoint: CGPointMake(36, 20) controlPoint1: CGPointMake(30, 22.69) controlPoint2: CGPointMake(32.69, 20)];
    [bezierPath addLineToPoint: CGPointMake(104, 20)];
    [bezierPath addCurveToPoint: CGPointMake(110, 26) controlPoint1: CGPointMake(107.31, 20) controlPoint2: CGPointMake(110, 22.69)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow);
    CGContextSetFillColorWithColor(context, shadow);
    [bezierPath fill];
    [bezierPath addClip];
    CGContextDrawLinearGradient(context, paperGradient, CGPointMake(-2, 278.5), CGPointMake(336, 278.5), 0);
    
    ////// Bezier Inner Shadow
    CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -highlightBlurRadius, -highlightBlurRadius);
    bezierBorderRect = CGRectOffset(bezierBorderRect, -highlightOffset.width, -highlightOffset.height);
    bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
    
    UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
    [bezierNegativePath appendPath: bezierPath];
    bezierNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = highlightOffset.width + round(bezierBorderRect.size.width);
        CGFloat yOffset = highlightOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    highlightBlurRadius,
                                    highlight);
        
        [bezierPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
        [bezierNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [bezierNegativePath fill];
    }
    CGContextRestoreGState(context);
    CGContextRestoreGState(context);
   
       /*
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(52, 25.5)];
    [starPath addLineToPoint: CGPointMake(50.13, 29.92)];
    [starPath addLineToPoint: CGPointMake(45.34, 30.34)];
    [starPath addLineToPoint: CGPointMake(48.97, 33.49)];
    [starPath addLineToPoint: CGPointMake(47.89, 38.16)];
    [starPath addLineToPoint: CGPointMake(52, 35.69)];
    [starPath addLineToPoint: CGPointMake(56.11, 38.16)];
    [starPath addLineToPoint: CGPointMake(55.03, 33.49)];
    [starPath addLineToPoint: CGPointMake(58.66, 30.34)];
    [starPath addLineToPoint: CGPointMake(53.87, 29.92)];
    [starPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight);
    [inkColor setFill];
    [starPath fill];
    
    ////// Star Inner Shadow
    CGRect starBorderRect = CGRectInset([starPath bounds], -shadowBlurRadius, -shadowBlurRadius);
    starBorderRect = CGRectOffset(starBorderRect, -shadowOffset.width, -shadowOffset.height);
    starBorderRect = CGRectInset(CGRectUnion(starBorderRect, [starPath bounds]), -1, -1);
    
    UIBezierPath* starNegativePath = [UIBezierPath bezierPathWithRect: starBorderRect];
    [starNegativePath appendPath: starPath];
    starNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(starBorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow);
        
        [starPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(starBorderRect.size.width), 0);
        [starNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [starNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    */
    /*
    
    //// Star 2 Drawing
    UIBezierPath* star2Path = [UIBezierPath bezierPath];
    [star2Path moveToPoint: CGPointMake(86, 25.5)];
    [star2Path addLineToPoint: CGPointMake(84.13, 29.92)];
    [star2Path addLineToPoint: CGPointMake(79.34, 30.34)];
    [star2Path addLineToPoint: CGPointMake(82.97, 33.49)];
    [star2Path addLineToPoint: CGPointMake(81.89, 38.16)];
    [star2Path addLineToPoint: CGPointMake(86, 35.69)];
    [star2Path addLineToPoint: CGPointMake(90.11, 38.16)];
    [star2Path addLineToPoint: CGPointMake(89.03, 33.49)];
    [star2Path addLineToPoint: CGPointMake(92.66, 30.34)];
    [star2Path addLineToPoint: CGPointMake(87.87, 29.92)];
    [star2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight);
    [inkColor setFill];
    [star2Path fill];
    
    ////// Star 2 Inner Shadow
    CGRect star2BorderRect = CGRectInset([star2Path bounds], -shadowBlurRadius, -shadowBlurRadius);
    star2BorderRect = CGRectOffset(star2BorderRect, -shadowOffset.width, -shadowOffset.height);
    star2BorderRect = CGRectInset(CGRectUnion(star2BorderRect, [star2Path bounds]), -1, -1);
    
    UIBezierPath* star2NegativePath = [UIBezierPath bezierPathWithRect: star2BorderRect];
    [star2NegativePath appendPath: star2Path];
    star2NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(star2BorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow);
        
        [star2Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(star2BorderRect.size.width), 0);
        [star2NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [star2NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    */
    
   /* 
    //// Star 3 Drawing
    UIBezierPath* star3Path = [UIBezierPath bezierPath];
    [star3Path moveToPoint: CGPointMake(69, 25.5)];
    [star3Path addLineToPoint: CGPointMake(67.13, 29.92)];
    [star3Path addLineToPoint: CGPointMake(62.34, 30.34)];
    [star3Path addLineToPoint: CGPointMake(65.97, 33.49)];
    [star3Path addLineToPoint: CGPointMake(64.89, 38.16)];
    [star3Path addLineToPoint: CGPointMake(69, 35.69)];
    [star3Path addLineToPoint: CGPointMake(73.11, 38.16)];
    [star3Path addLineToPoint: CGPointMake(72.03, 33.49)];
    [star3Path addLineToPoint: CGPointMake(75.66, 30.34)];
    [star3Path addLineToPoint: CGPointMake(70.87, 29.92)];
    [star3Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight);
    [inkColor setFill];
     [star3Path fill];
    
    ////// Star 3 Inner Shadow
    CGRect star3BorderRect = CGRectInset([star3Path bounds], -shadowBlurRadius, -shadowBlurRadius);
    star3BorderRect = CGRectOffset(star3BorderRect, -shadowOffset.width, -shadowOffset.height);
    star3BorderRect = CGRectInset(CGRectUnion(star3BorderRect, [star3Path bounds]), -1, -1);
    
    UIBezierPath* star3NegativePath = [UIBezierPath bezierPathWithRect: star3BorderRect];
    [star3NegativePath appendPath: star3Path];
    star3NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(star3BorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow);
        
        [star3Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(star3BorderRect.size.width), 0);
        [star3NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
         [star3NegativePath fill];
    }
    CGContextRestoreGState(context);
   
    CGContextRestoreGState(context);
     */
    
    //// Cleanup
    CGGradientRelease(paperGradient);
    CGColorSpaceRelease(colorSpace);
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 CGPoint point = [[touches anyObject] locationInView:self];
    NSLog(@"%f - %f",point.x,point.y);
    
    if (point.y > 20 && point.y < 40) {
        // in the tab height 
        if (point.x > 30 && point.x <110) {
            // tab a
              NSLog(@" Tab A tapped");
            
            self.selectedTabIndex = 0;
        }
        
        if (point.x > 120 && point.x <200) {
            // tab a
            NSLog(@" Tab B tapped");
             self.selectedTabIndex = 1;
        }
           
        if (point.x > 210 && point.x <290) {
            // tab a
            NSLog(@" Tab C tapped");
             self.selectedTabIndex = 2;
        }
        
    }
    
    //20- 40  y
   // 30 to 110, 120 - 200, 210 - 290, 
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   // CGPoint point = [[touches anyObject] locationInView:self];
    
  //  [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, point.x, point.y)];
    
  //  [self setNeedsDisplay];

}

@end
