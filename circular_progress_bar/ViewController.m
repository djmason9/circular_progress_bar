//
//  ViewController.m
//  circular_progress_bar
//
//  Created by Mason, Darren J on 3/27/15.
//  Copyright (c) 2015 Mason, Darren J. All rights reserved.
//

#import "ViewController.h"
#import "ProgressBarView.h"

@interface ViewController ()
    @property (nonatomic,retain) IBOutlet ProgressBarView *progressView;
@property (nonatomic,retain) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDownload:(id)sender {
    
//    [_progressView animateProgressView]; //basic demo
    //just a timer to pass a number to our update
    _timer =[NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector(updateProgress:) userInfo: nil repeats: YES];

}

/**
 *  This just updates the progress bar 0.01 at a time.
 *
 *  @param timer <#timer description#>
 */
-(void)updateProgress:(NSTimer *)timer {
    static float percent = 0;
    [_progressView setProgress:percent];
    
    percent += 0.01;
    
    //stop timer at 100%
    if(percent>=1){
        [_timer invalidate];
    }
}


@end
