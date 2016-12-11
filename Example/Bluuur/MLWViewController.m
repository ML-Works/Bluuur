//
//  MLWViewController.m
//  Bluuur
//
//  Created by Anton Bukov on 05/27/2016.
//  Copyright (c) 2016 Anton Bukov. All rights reserved.
//

#import <Bluuur/Bluuur.h>

#import "MLWViewController.h"

@interface MLWViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet MLWBluuurView *blurView;

@end

@implementation MLWViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.blurView.blurRadius = self.slider.value;
}

- (IBAction)radiusChanged:(UISlider *)sender {
    self.blurView.blurRadius = sender.value;
}

- (IBAction)pan:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan ||
        recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint move = [recognizer translationInView:self.view];
        self.blurView.transform = CGAffineTransformMakeTranslation(move.x, move.y);
    }
    else {
        self.blurView.transform = CGAffineTransformIdentity;
    }
}

@end
