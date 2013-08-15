//
//  BullEyeViewController.m
//  BullEye
//
//  Created by APPLE on 13-8-11.
//  Copyright (c) 2013年 Yujiang. All rights reserved.
//

#import "BullEyeViewController.h"

@interface BullEyeViewController ()
@property(nonatomic) int currentValue;
@property(nonatomic) int targetValue;
@property(nonatomic) int round;
@property(nonatomic) int score;
@end

@implementation BullEyeViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"目标数字： %d", self.targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"得分： %d", self.score];
    self.roundLabel.text = [NSString stringWithFormat:@"回合： %d", self.round];
}

- (void)startNewRound
{
    self.round += 1;
    self.targetValue = 1 + (arc4random() % 100);
    self.currentValue = 50;
    self.slider.value = self.currentValue;
}

- (IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (void)startNewGame
{
    self.score = 0;
    self.round = 1;
    [self updateLabels];
}

- (IBAction)showAlert
{
    int difference = abs(self.targetValue - self.slider.value);
    int point = 100 - difference;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        point += 100;
    } else if (difference < 5) {
        title = @"Great!";
        point += 50;
    } else if (difference < 10) {
        title = @"Pretty Good!";
    } else {
        title = @"Not Very Close...";
    }
    
    self.score += point;
    
    NSString *message = [NSString stringWithFormat:@"滑杆上的数字为：%d", self.currentValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"好的"
                              otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)slideMoved:(UISlider *)sender
{
    self.currentValue = lround(sender.value);
}

@end
