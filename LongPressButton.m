//
//  LongPressButton.m
//  LiftingTracker
//
//  Created by Andrew on 7/21/14.
//  Copyright (c) 2014 Andrew Lilja. All rights reserved.
//

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
        
        if(tempDisplay < 0){
            tempDisplay = 0;
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
