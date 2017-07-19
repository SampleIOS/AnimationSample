//
//  UsageView.m
//  SAMMI
//
//  Created by Palak Patel on 4/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import "UsageView.h"

@implementation UsageView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self drawBattery];
        NSLog(@"nscoder");
    }
    return self;
}

-(void)drawBattery
{
    [[NSBundle mainBundle] loadNibNamed:@"UsageView" owner:self options:nil];
    [self addSubview:self.batteryView];
    self.batteryView.frame = self.bounds;
    
    Width = _batteryView.frame.size.width-40.0;
    Height = _batteryView.frame.size.height;
    percentage = 0.8;
    
    //***********battery lead ******************
    
    rrect = CGRectMake(0,0,Width,Height);
    LeadX = CGRectGetMaxX(rrect), LeadY = CGRectGetMidY(rrect);
    
    CAShapeLayer *lead = [CAShapeLayer layer];
    lead.path = [[UIBezierPath bezierPathWithArcCenter:CGPointMake(LeadX,LeadY) radius:30 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:NO] CGPath];
    lead.strokeColor = [[UIColor lightGrayColor] CGColor];
    lead.lineWidth = 5.0;
    lead.fillColor = [[UIColor lightGrayColor] CGColor];
    [self.batteryView.layer addSublayer:lead];
    
    [self drawLayer:@"border"];
    [self performSelector:@selector(drawLayer:) withObject:@"level" afterDelay:5.0f];

    
   
}

-(void)drawLayer:(NSString *)battery
{
    shapeLayer = [CAShapeLayer layer];
    
    if ([battery isEqualToString: @"level"]) {
        CGFloat updateWidth = Width*percentage;
        CGFloat updateHeight = Height-8;
        rrect = CGRectMake(4.0, 4.0, updateWidth, updateHeight);
        shapeLayer.path = [[UIBezierPath bezierPathWithRoundedRect:rrect cornerRadius:10.0] CGPath];
        shapeLayer.strokeColor = [[UIColor clearColor] CGColor];
        shapeLayer.fillColor = [[UIColor greenColor] CGColor];
        
    }
    if ([battery isEqualToString: @"border"]) {
        rrect = CGRectMake(0,0,Width,Height);
        shapeLayer.path = [[UIBezierPath bezierPathWithRoundedRect:rrect cornerRadius:10.0] CGPath];
        shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
        shapeLayer.lineWidth = 3.0;
    } else {
        NSLog(@"battery");
    }
    [self.batteryView.layer addSublayer:shapeLayer];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

@end


