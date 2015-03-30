//
//  ProgressBarView.m
//  circular_progress_bar
//
//  Created by Mason, Darren J on 3/27/15.
//  Copyright (c) 2015 Mason, Darren J. All rights reserved.
//

#import "ProgressBarView.h"

@interface ProgressBarView()
    @property (nonatomic,retain) CAShapeLayer *progressLayer;
@end

@implementation ProgressBarView

#pragma mark - init methods
/**
 *  Call when you want to set the frame size
 *
 *  @param frame CGRect
 *
 *  @return ProgressBarView
 */
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createProgressLayer];
    }
    
    return self;

}
/**
 *  called when the storyboard defines the uiview
 *
 *  @param aDecoder NSCoder
 *
 *  @return ProgressBarView
 */
-(id)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self createProgressLayer];
    }
    
    return self;
}
#pragma mark - progress set up
/**
 *  Sets up the progress layer as a circle the size of this frame
 *  @private
 */
-(void)createProgressLayer{

    CGFloat startAngle = -M_PI_2;           //starts at 12 o'clock
    CGFloat endAngle = M_PI * 2 - M_PI_2;   //ends at 12 0'clock
    CGPoint enterPoint = CGPointMake(CGRectGetWidth(self.frame)/2 , CGRectGetHeight(self.frame)/2); //center point of the uiview with some padding
    int padding = 5;

    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:enterPoint radius:CGRectGetWidth(self.frame)/2-padding startAngle:startAngle endAngle:endAngle clockwise:YES];

    //create a color gradient
    CAGradientLayer *gradientMaskLayer = [self gardientMask];
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.path = circle.CGPath;
    _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
    _progressLayer.fillColor = nil;
    _progressLayer.strokeColor = [UIColor darkGrayColor].CGColor;
    _progressLayer.lineWidth = 4.0;
    _progressLayer.strokeStart = 0.0; //starting with nothing
    _progressLayer.strokeEnd = 0.0; //ending with nothing
    
    gradientMaskLayer.mask = _progressLayer;
    [self.layer addSublayer:gradientMaskLayer];

}
/**
 *  Simple little gradient this one is top lighter than bottom
 *
 *  @return CAGradientLayer
 */
-(CAGradientLayer*)gardientMask{

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    
    UIColor *colorTop = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
    UIColor *colorBottom = [UIColor colorWithRed:178.0/255.0 green:178.0/255.0 blue:178.0/255.0 alpha:1];
    
    NSArray *colorArray = [NSArray arrayWithObjects:(id)colorTop.CGColor,(id)colorBottom.CGColor, nil];

    
    gradientLayer.colors = colorArray;
    
    return gradientLayer;

}
#pragma mark - public methods

-(void)setProgress:(float)endStroke{
    _progressLayer.strokeEnd = endStroke; //adds a end stroke float each time this is called
}

-(void)animateProgressView{
    
    _progressLayer.strokeEnd = 0.0;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.duration = 1.0;
    animation.delegate = self;
    animation.removedOnCompletion = false;
    animation.additive = true;
    animation.fillMode = kCAFillModeForwards;
    
    [_progressLayer addAnimation:animation forKey:@"strokeEnd"];
 
}

@end
