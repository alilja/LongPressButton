//
//  LongPressButton.h
//  LiftingTracker
//
//  Created by Andrew on 7/21/14.
//  Copyright (c) 2014 Andrew Lilja. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LongPressDelegate <NSObject>
@optional
-(void)valueUpdated:(id)sender newValue:(int)value;
@end

@interface LongPressButton : UIButton

@property int value;

#pragma mark Display settings
@property UIColor *matchedValueColor;
@property UIColor *defaultColor;

#pragma mark Behavior settings
@property float scalingValue;
@property BOOL active;

@property id delegate;
@property CGPoint initialTouch;

- (void)updateValue:(UILongPressGestureRecognizer *)sender;
-(id)initWithValue:(int)initialValue withFrame:(CGRect)rect;

@end
