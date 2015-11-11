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

    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}

@end
