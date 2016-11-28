//
//  MLWLiveBlurView.h
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

// Live blur idea from here: https://gist.github.com/n00neimp0rtant/27829d87118d984232a4

@interface MLWLiveBlurView : UIVisualEffectView

/**
 *  Blur progress from \c 0.0 (no blur) to \c 1.0 (full blur)
 */
@property (assign, nonatomic) CGFloat blurProgress;

@end
