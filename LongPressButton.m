//
//  LongPressButton.m
//  LiftingTracker
//
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

#import "LongPressButton.h"

@implementation LongPressButton

-(id)initWithValue:(int)initialValue withFrame:(CGRect)rect{
    self = [super initWithFrame:rect];
    if (self) {
        self.value = initialValue;
        self.scalingValue = 15;
        self.defaultColor = [UIColor blueColor];
        self.matchedValueColor = [UIColor redColor];
        self.active = true;
        self.minimumValue = nil;
        [self setTitle:[@(self.value) stringValue] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)updateValue:(UILongPressGestureRecognizer *)sender{
    if(self.active){
        CGPoint touchPoint = [sender locationInView:sender.view];
        float offset = self.initialTouch.y - self.frame.size.height/2;
        float verticalCenter = -offset + touchPoint.y - self.frame.size.height/2 ;
        
        int delta = round((verticalCenter)/self.scalingValue);
        int tempDisplay = self.value - delta;
        
        if(self.minimumValue != nil && tempDisplay < [self.minimumValue intValue]){
            tempDisplay = [self.minimumValue intValue];
        }
        switch(sender.state){
            case UIGestureRecognizerStateEnded:
                self.value = tempDisplay;
                [self.delegate valueUpdated:self newValue:self.value];
                break;
                
            case UIGestureRecognizerStateBegan:
                self.initialTouch = [sender locationInView:sender.view];
                break;
                
            default:
                [self setTitle:[@(tempDisplay) stringValue] forState:UIControlStateNormal];
                break;
        }
    }
}

@end
