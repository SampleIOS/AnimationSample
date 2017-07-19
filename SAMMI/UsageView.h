//
//  UsageView.h
//  SAMMI
//
//  Created by Palak Patel on 4/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsageView : UIView
{
    float percentage;
    CGFloat Width,Height,LeadX, LeadY;
    CAShapeLayer *shapeLayer;
    CGRect rrect;
}
@property (weak, nonatomic) IBOutlet UIView *batteryView;


@end
