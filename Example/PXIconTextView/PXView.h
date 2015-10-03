//
//  PXView.h
//  PXIconTextView
//
//  Created by Calvin Kern on 5/21/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PXIconTextView/PXIconTextView.h>

@interface PXView : UIView

@property (nonatomic, readonly) PXIconTextView* leftText;
@property (nonatomic, readonly) PXIconTextView* rightText;

@end
