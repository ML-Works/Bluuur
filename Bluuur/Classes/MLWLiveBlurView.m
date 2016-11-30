//
//  MLWLiveBlurView.m
//  Bluuur
//
//  Copyright (c) 2016 Machine Learning Works
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://opensource.org/licenses/MIT
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MLWLiveBlurView.h"

@interface MLWLiveBlurLayer : CALayer

@end

@implementation MLWLiveBlurLayer

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key {
    self.speed = 1.0;
    [super addAnimation:anim forKey:key];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self.delegate selector:@selector(appDidBecomeActive:) object:nil];
    [(NSObject *)self.delegate performSelector:@selector(appDidBecomeActive:) withObject:nil afterDelay:anim.duration + 0.1];
}

@end

//

@interface MLWLiveBlurView ()

@end

@implementation MLWLiveBlurView

+ (Class)layerClass {
    return [MLWLiveBlurLayer class];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return nil;
}

- (void)updateLiveBlur {
    if (!self.effect || !self.window) {
        return;
    }
    
    UIVisualEffect *effectToAnimate = self.effect;
    self.effect = nil;
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.effect = effectToAnimate;
    } completion:nil];
    self.layer.timeOffset = 0.0;
    self.layer.speed = 0.0;
}

- (void)setBlurProgress:(CGFloat)blurProgress {
    _blurProgress = blurProgress;
    self.layer.timeOffset = blurProgress;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    [self appDidBecomeActive:nil];

    if (self.window) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    }
}

- (void)appDidBecomeActive:(NSNotification *)note {
    [self updateLiveBlur];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        typeof(self) strongSelf = weakSelf;
        strongSelf.blurProgress = strongSelf.blurProgress;
    });
}

@end
