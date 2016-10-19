//
//  CalendarIconImage.m
//  zero1Demo
//
//  Created by DAN Zeitman on 6/19/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//
 
#import "CalendarIconImage.h"
#import "UIImage+snapshot.h"
#import "CalendarIcon.h"
@implementation CalendarIconImage

-(id)init{
       self =  [super init];
   // self = [self initWithText:nil andFrame:CGRectMake(0, 0, 100, 100)];
     
    return self;
} 

-(id)initWithDate:(NSDate*)theDate andFrame:(CGRect)frame{
   
    NSString  *text = @"";
    NSString  *text2 = @"";
    // use current date if nil
    if( theDate != nil){
        
        NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
        // format the day
        [df2 setDateFormat:@"d"];
        text  =  [df2 stringFromDate:theDate];  
        
        df2.dateStyle = kCFDateFormatterLongStyle;
        
        text2  =  [[[df2 stringFromDate:theDate] componentsSeparatedByString:@" "] objectAtIndex:0];  
        
    }else {
        
        NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
    
        [df2 setDateFormat:@"d"];
        text  =  [df2 stringFromDate:[NSDate date]];  
        
        df2.dateStyle = NSDateFormatterLongStyle;
        
        text2  =  [[[df2 stringFromDate:[NSDate date]] componentsSeparatedByString:@" "] objectAtIndex:0];  
    }
    
 
    
    CalendarIcon *iconView = [[CalendarIcon alloc] initWithFrame:frame];
     
    [iconView setDay:text];
    [iconView setMonth:text2];
    
    return  (CalendarIconImage *)[UIImage maskImage:[UIImage imageFromView:iconView] withMask:[UIImage imageFromView:iconView]];
}
 


-(id)initWithText:(NSString*)text andFrame:(CGRect)frame{
 //  self =  [super init];
    
    NSString  *text2 = @"";
    // use current date if nil
    if([text length] == 0 || text == nil){
        
        NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
       
        [df2 setDateFormat:@"dd"];
        text  =  [df2 stringFromDate:[NSDate date]];  
        
         df2.dateStyle = NSDateFormatterLongStyle;
        
       text2  =  [[[df2 stringFromDate:[NSDate date]] componentsSeparatedByString:@" "] objectAtIndex:0];  
        
    }
    
    CalendarIcon *iconView = [[CalendarIcon alloc] initWithFrame:frame];

     [iconView setDay:text];
     [iconView setMonth:text2];
   
    
      return  (CalendarIconImage *)[UIImage maskImage:[UIImage imageFromView:iconView] withMask:[UIImage imageFromView:iconView]];
}
 

@end
