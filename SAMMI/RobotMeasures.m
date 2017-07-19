//
//  RobotMeasures.m
//  SAMMI
//
//  Created by Palak Patel on 4/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import "RobotMeasures.h"

@implementation RobotMeasures

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self drawlines];
        NSLog(@"nscoder");
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self drawlines];
        NSLog(@"frame");
    }
    return self;
}

-(void)drawlines
{
    [[NSBundle mainBundle] loadNibNamed:@"RobotMeasures" owner:self options:nil];
    [self addSubview:self.RobotMeasures];
    self.RobotMeasures.frame = self.bounds;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
