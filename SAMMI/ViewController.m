//
//  ViewController.m
//  SAMMI
//
//  Created by Palak Patel on 1/7/17.
//  Copyright © 2017 Palak Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *viewsAnimate = [NSArray arrayWithObjects:_SAMMIview,_RobotView, _RobotHeight, _RobotWidth, _ViewWidth, _ViewHeight, nil];
    
    _RobotHeight.text = @"1208.5 mm";
    [_RobotHeight setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    
    for (id object in viewsAnimate) {
        [self startFade:object];
    }
   
    [self drawWidthHeight];
    [self viewSlideInFromBottomToTop:_ViewWidth];
    [self viewSlideInFromBottomToTop:_ViewHeight];
    NSLog(@"p");
    
}

-(void)viewSlideInFromBottomToTop:(UIView *)views
{
    CATransition *transition = nil;
    transition = [CATransition animation];
    transition.duration = 1.0;//kAnimationDuration
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromTop ;
   // transition.delegate = self;
    [views.layer addAnimation:transition forKey:nil];
}

-(void)drawHeight
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 10.0)];
    [path addLineToPoint:CGPointMake(0.0,740.0)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeLayer.lineWidth = 1.5;
    [self.ViewHeight.layer addSublayer:shapeLayer];
}

-(void)drawWidthHeight
{
    rrectW = CGRectMake(0.0, 0.0,_ViewWidth.frame.size.width, _ViewWidth.frame.size.height);
    
    CGFloat minx = CGRectGetMinX(rrectW), midx = CGRectGetMidX(rrectW), maxx = CGRectGetMaxX(rrectW);
    CGFloat miny = CGRectGetMinY(rrectW), maxy = CGRectGetMaxY(rrectW);
    
    NSLog(@"minx:%f     midx:%f    maxx:%f     miny:%f     maxy:%f   ",minx,midx,maxx,miny,maxy);
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(midx-20.0, maxy)];
    [path1 addLineToPoint:CGPointMake(midx-20.0,miny)];
    [path1 addLineToPoint:CGPointMake(minx, miny)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path1 CGPath];
    shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeLayer.lineWidth = 1.5;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.ViewWidth.layer addSublayer:shapeLayer];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(midx+20.0, maxy)];
    [path2 addLineToPoint:CGPointMake(midx+20.0,miny)];
    [path2 addLineToPoint:CGPointMake(maxx,miny)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = [path2 CGPath];
    shape.strokeColor = [[UIColor lightGrayColor] CGColor];
    shape.lineWidth = 1.5;
    shape.fillColor = [[UIColor clearColor] CGColor];
    [self.ViewWidth.layer addSublayer:shape];
    
    rrectH = CGRectMake(0.0, 0.0,_ViewHeight.frame.size.width, _ViewHeight.frame.size.height);
    CGFloat midhx = CGRectGetMidX(rrectH);
    CGFloat minhy = CGRectGetMinY(rrectH), mahxy = CGRectGetMaxY(rrectH);
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:CGPointMake(midhx, mahxy)];
    [path3 addLineToPoint:CGPointMake(midhx,minhy)];
    
    CAShapeLayer *shapeHeight = [CAShapeLayer layer];
    shapeHeight.path = [path3 CGPath];
    shapeHeight.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeHeight.lineWidth = 1.5;
    [self.ViewHeight.layer addSublayer:shapeHeight];
    
}

-(IBAction)startFade:(id)sender {
    
    [sender setAlpha:0.0f];
    
    //fade in
    [UIView animateWithDuration:2.0f animations:^{
        
        [sender setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        //fade out
        [UIView animateWithDuration:2.0f animations:^{
            
            [sender setAlpha:1.0f];
            
        } completion:nil];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
