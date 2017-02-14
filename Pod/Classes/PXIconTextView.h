//
//  PXIconTextView.h
//
//  Created by Daniel Blakemore on 5/1/14.
//
//  Copyright (c) 2015 Pixio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>

/**
 *  A uitextview with an icon in the top left corner that expands as more lines are entered.
 */
@interface PXIconTextView : UIView

/**
 *  The font to use for this instance.
 */
@property (nonatomic, nullable) UIFont * font UI_APPEARANCE_SELECTOR;

/**
 *  The minimum height of the text view with 1 line of text. The default value is 36.
 */
@property (nonatomic) CGFloat minHeight;

/**
 *  The maximum height that the text view should expand to. The default value is 100.
 */
@property (nonatomic) CGFloat maxHeight;

/**
 *  The icon to display in the top left corner of the text view.
 */
@property (nonatomic, nullable) UIImage * icon;

/**
 *  Placeholder text for the textview.
 */
@property (nonatomic, copy, nullable) NSString * placeholder;

/**
 *  The text in the textview.
 */
@property (nonatomic, copy, nullable) NSString * text;

/**
 *  The textview delegate.
 */
@property (nonatomic, assign) id<UITextViewDelegate> delegate;

@end
