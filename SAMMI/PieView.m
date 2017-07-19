//
//  PieView.m
//  SAMMI
//
//  Created by Palak Patel on 11/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import "PieView.h"

@implementation PieView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self drawPieView];
       // [self drawPie];
        NSLog(@"nscoder");
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self drawPieView];
        NSLog(@"frame");
    }
    return self;
}

-(void)drawPieView
{
    [[NSBundle mainBundle] loadNibNamed:@"PieView" owner:self options:nil];
    [self addSubview:self.PieImage];
    self.PieImage.frame = self.bounds;
    
  //  int volume = [self getRandomNumberBetween:0 to:100];
    
    CGFloat width = CGRectGetWidth(self.bounds)/2;
    CGFloat height = CGRectGetHeight(self.bounds)/2;
    CGPoint location = CGPointMake(width, height);
    
    CGFloat radius = 180.0;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [[self makeCircleAtLocation:location radius:radius EndAngle:0.0] CGPath];
    shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 10.0;
    [self.layer addSublayer:shapeLayer];
}


-(void)drawPie
{
    int randomNumber = [self getRandomNumberBetween:1 to:5];
    CGFloat width = CGRectGetWidth(self.bounds)/2;
    CGFloat height = CGRectGetHeight(self.bounds)/2;
    CGPoint location = CGPointMake(width, height);
    CGFloat radius = 180.0;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [[self makeCircleAtLocation:location radius:radius EndAngle:randomNumber] CGPath];
    shapeLayer.strokeColor = [[UIColor greenColor] CGColor];
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 10.0;
    [self.layer addSublayer:shapeLayer];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

//- (void)drawRect:(CGRect)rect {
    // Drawing code
//}

/*********draw circle ******/
- (UIBezierPath *)makeCircleAtLocation:(CGPoint)location radius:(CGFloat)radius EndAngle:(CGFloat)EndAngle
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI*2
                 clockwise:NO];
    return path;
}

@end
