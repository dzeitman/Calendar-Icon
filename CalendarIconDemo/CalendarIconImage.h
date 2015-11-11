//
//  CalendarIconImage.h
//  zero1Demo
//
//  Created by DAN Zeitman on 6/19/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarIconImage : UIImage
-(id)initWithText:(NSString*)text andFrame:(CGRect)frame;
-(id)initWithDate:(NSDate *)date andFrame:(CGRect)frame;

@end
