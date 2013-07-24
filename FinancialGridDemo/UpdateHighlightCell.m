//
//  UpdateHighlightCell.m
//  FinancialGridDemo
//
//  Created by Jan Akerman on 04/04/2013.
//
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "UpdateHighlightCell.h"
#import <QuartzCore/QuartzCore.h>

#define ICON_HEIGHT 20
#define ICON_WIDTH 20

@implementation UpdateHighlightCell {
    UIImage *_upImage;
    UIImage *_downImage;
}

// This is the init method that will be called by the data-source helper when creating cells so we must override this.
-(id)initWithReuseIdentifier:(NSString *)identifier {
    
    if (self = [super initWithReuseIdentifier:identifier]) {
        
        // At this point the cell will not have been added to the grid so we can not position its subviews. We must handle the subview positioning in the layoutSubviews method.
        // Load in the up and down arrow images.
        _upImage = [UIImage imageNamed:@"green-up-arrow.png"];
        _downImage = [UIImage imageNamed:@"red-down-arrow.png"];
        
        // This view is going to provide our rounded highlight effect.
        _highlightView = [[UIView alloc] initWithFrame:CGRectZero];
        _highlightView.backgroundColor = [UIColor clearColor];
        _highlightView.layer.cornerRadius = 10;
        [self addSubview:_highlightView];
        
        // Add the image view for our cells up or down arrow.
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_iconView];
        
        // Add the label for our cells value.
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textColor = [UIColor darkGrayColor];
        _label.textAlignment = NSTextAlignmentRight;
        _label.font = [UIFont fontWithName:@"Gill Sans" size:12.];
        _label.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
        
    }
    return self;
}

// At this point the cell will have been added to the grid with the correct size. Here we lay out the cells subviews.
-(void)layoutSubviews {
    _highlightView.frame = CGRectInset(self.bounds, 1, 2);
    
    _iconView.frame = CGRectMake(10, self.frame.size.height/2 - ICON_HEIGHT/2, ICON_WIDTH, ICON_HEIGHT);
    
    _label.frame = CGRectMake(_iconView.frame.origin.x + _iconView.frame.size.width + 10,
                              0,
                              self.frame.size.width - (_iconView.frame.origin.x + _iconView.frame.size.width + 10) - 5,
                              self.frame.size.height);
}

// This is a public method that is called with a change in the previous value. If the delta provided is positive it will highlight the cell green, if the delta provided is negative it will highlight the cell red. The cell will then slowly return back to its original colour over 4 seconds. 
- (void)showHighlightForDelta:(NSNumber *)delta {
    
    UIColor *highlightColor;
    if ([delta  floatValue] > 0) {
        highlightColor = [UIColor greenColor];
        
    } else if ([delta floatValue] < 0) {
        highlightColor = [UIColor redColor];
    }
    
    _highlightView.backgroundColor = highlightColor;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:4];
    [UIView setAnimationDelay:1];
    
    _highlightView.backgroundColor = [UIColor clearColor];
    
    [UIView commitAnimations];
}

// This is a public method that is called with a change in the previous value. If the delta provided is positive the cell will display an up arrow in its iconView, if the change is negative the cell will display a down arrow in its iconView.
- (void)showArrowForDelta:(NSNumber *)delta {
    if ([delta  floatValue] > 0) {
        _iconView.image = _upImage;
    } else if ([delta floatValue] < 0) {
        _iconView.image = _downImage;
    }
}

// Since this is a custom cell, we must reset our cells state so that it is ready to be re-used by the grid.
-(void)resetForReuse {
    [super resetForReuse];
    
    _highlightView.backgroundColor = [UIColor clearColor];
    [_highlightView.layer removeAllAnimations];
    _iconView.image = nil;
}


@end
