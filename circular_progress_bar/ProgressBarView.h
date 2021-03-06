//
//  ProgressBarView.h
//  circular_progress_bar
//
//  Created by Mason, Darren J on 3/27/15.
//  Copyright (c) 2015 Mason, Darren J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBarView : UIView
/**
 *  simple animation example
 */
-(void)animateProgressView;
/**
 *  Sets the progress of the progress bar
 *
 *  @param endStroke float
 */
-(void)setProgress:(float)endStroke;

@end
