//
//  MLWLiveBlurView.h
//  Bluuur
//
//  Created by Anton Bukov on 27.05.16.
//  Copyright © 2016 MachineLearningWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

// Live blur idea from here: https://gist.github.com/n00neimp0rtant/27829d87118d984232a4

@interface MLWLiveBlurView : UIVisualEffectView

/**
 *  Blur progress from \c 0.0 (no blur) to \c 1.0 (full blur)
 */
@property (assign, nonatomic) CGFloat blurProgress;

@end
