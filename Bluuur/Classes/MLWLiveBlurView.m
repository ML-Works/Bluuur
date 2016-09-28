//
//  MLWLiveBlurView.m
//  Bluuur
//
//  Created by Anton Bukov on 27.05.16.
//  Copyright © 2016 MachineLearningWorks. All rights reserved.
//

#import "MLWLiveBlurView.h"

@interface MLWLiveBlurView ()

@property (strong, nonatomic) id mlw_observer_resign;
@property (strong, nonatomic) id mlw_observer_active;
@property (assign, nonatomic) BOOL animationStopped;
@property (assign, nonatomic) BOOL wasSuspended;
@property (assign, nonatomic) CGFloat blurProgressToRecover;
@property (strong, nonatomic) UIVisualEffect *effectToRecover;

@end

@implementation MLWLiveBlurView

- (void)updateLiveBlur {
    if (!self.effect && !self.effectToRecover) {
        return;
    }

    UIVisualEffect *effect = self.effectToRecover ?: self.effect;
    self.effect = nil;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.0
        animations:^{
            self.animationStopped = NO;
            self.effect = effect;
        }
        completion:^(BOOL finished) {
            typeof(self) self = weakSelf;
            [self stopAnimation];
        }];

    self.layer.speed = 0.0;
    self.layer.timeOffset = self.blurProgress;
}

- (void)stopAnimation {
    if (!self.animationStopped) {
        self.animationStopped = YES;
        self.layer.speed = 1.0;
        self.layer.timeOffset = 0.0;
        self.blurProgressToRecover = self.blurProgress;
        self.blurProgress = 0.0;
        self.effectToRecover = self.effect;
        self.effect = nil;
    }
}

- (void)setBlurProgress:(CGFloat)blurProgress {
    _blurProgress = blurProgress;
    self.layer.timeOffset = self.blurProgress;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    [self updateLiveBlur];

    if (self.mlw_observer_resign) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.mlw_observer_resign name:UIApplicationWillResignActiveNotification object:nil];
        self.mlw_observer_resign = nil;
    }

    if (self.mlw_observer_active) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.mlw_observer_active name:UIApplicationDidBecomeActiveNotification object:nil];
        self.mlw_observer_active = nil;
    }

    if (self.window) {
        __weak typeof(self) weakSelf = self;

        self.blurProgressToRecover = self.blurProgress;
        self.blurProgress = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            typeof(self) self = weakSelf;
            self.blurProgress = self.blurProgressToRecover;
        });

        self.mlw_observer_resign = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *_Nonnull note) {
            typeof(self) self = weakSelf;
            self.wasSuspended = YES;
            [self stopAnimation];
        }];

        self.mlw_observer_active = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *_Nonnull note) {
            typeof(self) self = weakSelf;
            if (!self.wasSuspended) {
                return;
            }
            self.wasSuspended = NO;
            [self updateLiveBlur];
            self.effectToRecover = nil;

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.blurProgress = self.blurProgressToRecover;
                self.blurProgressToRecover = 0.0;
            });
        }];
    }
}

@end
