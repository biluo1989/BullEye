//
//  BullEyeViewController.h
//  BullEye
//
//  Created by APPLE on 13-8-11.
//  Copyright (c) 2013年 Yujiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullEyeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)startOver;
- (IBAction)showAlert;
- (IBAction)slideMoved:(UISlider *)sender;

@end
