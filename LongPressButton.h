//
//  LongPressButton.h
//  LiftingTracker
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Andrew Lilja
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
@property NSNumber *minimumValue;

@property id delegate;
@property CGPoint initialTouch;

- (void)updateValue:(UILongPressGestureRecognizer *)sender;
-(id)initWithValue:(int)initialValue withFrame:(CGRect)rect;

@end
