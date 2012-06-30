//
//  DrawViewController.m
//  zero1Demo
//
//  Created by DAN Zeitman on 6/18/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//
 
#import "UIImage+snapshot.h"
#import "DrawViewController.h"
//#import "CalendarIcon.h"

#import "CalendarIconImage.h"
 
@interface DrawViewController ()

@end

@implementation DrawViewController
@synthesize previewImageView;
@synthesize datePicker;

 

 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  //  self.view.backgroundColor = [UIColor whiteColor];
     
  
     [self renderImages];
    [self setTabBarIcon];
}
 

 

 
- (IBAction)updateDateValue:(id)sender {
    
   // NSDate *theDate =   [datePicker date];
      NSDate *theDate = self.datePicker.date;
    
    
    int imageWidth = 300;
    int imageHeight = 300;
    
    CGRect imageFrame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    CalendarIconImage *calendarIcon = [[CalendarIconImage alloc] initWithDate:theDate  andFrame:imageFrame];
    
    
    
    previewImageView.image = [UIImage imageWithImage:calendarIcon scaledToSize:CGSizeMake(CGRectGetWidth(previewImageView.frame) , CGRectGetHeight(previewImageView.frame))];
    
    
    previewImageView.contentMode = UIViewContentModeCenter;
    
    
    self.tabBarItem.image =  [UIImage imageWithImage:calendarIcon scaledToSize:CGSizeMake(32, 32)];
    
     self.tabBarItem.title = @"Schedule";
   
}

 
-(void)renderImages{ 
    
         
    int imageWidth = 300;
    int imageHeight = 300;
    
    CGRect imageFrame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    CalendarIconImage *calendarIcon = [[CalendarIconImage alloc] initWithText:nil andFrame:imageFrame];
    
 
    
    previewImageView.image = [UIImage imageWithImage:calendarIcon scaledToSize:CGSizeMake(CGRectGetWidth(previewImageView.frame) , CGRectGetHeight(previewImageView.frame))];
    

    previewImageView.contentMode = UIViewContentModeCenter;
    
}


-(void)setTabBarIcon{
    
    
  CalendarIconImage *calendarIcon = [[CalendarIconImage alloc] initWithText:nil  andFrame:CGRectMake(0, 0, 300, 300)];
    
    self.tabBarItem.image =  [UIImage imageWithImage:calendarIcon scaledToSize:CGSizeMake(32, 32)];
    
    self.tabBarItem.title = @"Schedule";

}


- (void)viewDidUnload
{
    [self setPreviewImageView:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
