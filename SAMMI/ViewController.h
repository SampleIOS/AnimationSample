//
//  ViewController.h
//  SAMMI
//
//  Created by Palak Patel on 1/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
{
     CGRect rrectW, rrectH;
}

@property (weak, nonatomic) IBOutlet UIView *SAMMIview;
@property (weak, nonatomic) IBOutlet UIView *RobotView;
@property (weak, nonatomic) IBOutlet UILabel *RobotHeight;
@property (weak, nonatomic) IBOutlet UILabel *RobotWidth;
@property (weak, nonatomic) IBOutlet UIView *ViewHeight;
@property (weak, nonatomic) IBOutlet UIView *ViewWidth;



@end

