//
//  PXView.m
//  PXIconTextView
//
//  Created by Calvin Kern on 5/21/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import <PXIconTextView/PXIconTextView.h>

@implementation PXView
{
    PXIconTextView* _leftText;
    PXIconTextView* _rightText;
}

@synthesize leftText = _leftText;
@synthesize rightText = _rightText;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftText = [[PXIconTextView alloc] init];
        [_leftText setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [_leftText setBackgroundColor:[UIColor orangeColor]];
        [_leftText setIcon:[UIImage imageNamed:@"fry"]];
        [_leftText setPlaceholder:@"Talk about Fry"];

        [self addSubview:_leftText];

        _rightText = [[PXIconTextView alloc] init];
        [_rightText setBackgroundColor:[UIColor purpleColor]];
        [_rightText setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [_rightText setIcon:[UIImage imageNamed:@"leela"]];
        [_rightText setPlaceholder:@"Talk about Leela"];
        [self addSubview:_rightText];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:[self constraints]];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_leftText, _rightText);
    NSDictionary* metrics = @{@"sp" : @10, @"msp" : @120, @"th" : @40};
    
    // Horizontal
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-sp-[_leftText]-sp-[_rightText]-sp-|" options:0 metrics:metrics views:views]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftText attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightText attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
    // Vertical
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightText attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftText attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0.0]];
    
    [super updateConstraints];
}

@end
