//
//  MLWBluuurView.h
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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLWBluuurView : UIVisualEffectView

@property (nonatomic) CGFloat grayscaleTintLevel;
@property (nonatomic) CGFloat grayscaleTintAlpha;
@property (nonatomic) BOOL lightenGrayscaleWithSourceOver;
@property (nonatomic) UIColor *colorTint;
@property (nonatomic) CGFloat colorTintAlpha;
@property (nonatomic) CGFloat colorBurnTintLevel;
@property (nonatomic) CGFloat colorBurnTintAlpha;
@property (nonatomic) CGFloat darkeningTintAlpha;
@property (nonatomic) CGFloat darkeningTintHue;
@property (nonatomic) CGFloat darkeningTintSaturation;
@property (nonatomic) BOOL darkenWithSourceOver;
@property (nonatomic) CGFloat blurRadius;
@property (nonatomic) CGFloat saturationDeltaFactor;
@property (nonatomic) CGFloat scale;
@property (nonatomic) CGFloat zoom;

@end

NS_ASSUME_NONNULL_END
