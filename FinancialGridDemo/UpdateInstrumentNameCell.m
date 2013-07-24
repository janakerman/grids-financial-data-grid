//
//  UpdateInstrumentNameCell.m
//  FinancialGridDemo
//
//  Created by Jan Akerman on 05/04/2013.
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

#import "UpdateInstrumentNameCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation UpdateInstrumentNameCell

// This is the init method that will be called by the data-source helper when creating cells so we must override this.
-(id)initWithReuseIdentifier:(NSString *)identifier {
    if (self = [super initWithReuseIdentifier:identifier]) {
        
        // This view is going to provide our rounded highlight effect.
        _highlightView = [[UIView alloc] initWithFrame:CGRectZero];
        _highlightView.backgroundColor = [UIColor clearColor];
        [self addSubview:_highlightView];
        
        // Add the label for our name cells name string.
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor darkGrayColor];
        _label.font = [UIFont fontWithName:@"Gill Sans" size:12.];
        _label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_label];
    }
    return self;
}

// At this point the cell will have been added to the grid with the correct size. Here we lay out the cells subviews.
-(void)layoutSubviews {
    
    _highlightView.frame = CGRectInset(self.bounds, 0, 1);
    
    _label.frame = CGRectInset(self.bounds, 10, 10);
    
}

-(void)showHighlight {
    UIColor *updateColor = [UIColor colorWithRed:255./255. green:226./255. blue:64./255. alpha:1];
    
    _highlightView.backgroundColor = updateColor;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:4];
    [UIView setAnimationDelay:1];
    
    _highlightView.backgroundColor = [UIColor clearColor];
    
    [UIView commitAnimations];
}

-(void)resetForReuse {
    _highlightView.backgroundColor = [UIColor clearColor];
    [_highlightView.layer removeAllAnimations];
}



@end
