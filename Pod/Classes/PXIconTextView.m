//
//  PXIconTextView.m
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

#import "PXIconTextView.h"

#import <UIPlaceholderTextView/UIPlaceholderTextView.h>

@interface PXIconTextView () <UITextViewDelegate>

@end

@implementation PXIconTextView
{
    UIImageView * _iconView;
    UIPlaceHolderTextView * _textView;
    
    NSLayoutConstraint * _inputHeightConstraint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (![self font]) {
            [self setFont:[UIFont systemFontOfSize:12]];
        }
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _minHeight = 36;
        _maxHeight = 100;
        
        _iconView = [UIImageView new];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        [_iconView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:_iconView];
        
        _textView = [UIPlaceHolderTextView new];
        [_textView setDelegate:self];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setFont:[self font]];
        [_textView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:_textView];
        
        NSDictionary* views = NSDictionaryOfVariableBindings(_iconView, _textView);
        NSDictionary* metrics = @{@"sp" : @8, @"iw" : @20};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-sp-[_iconView(iw)][_textView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-sp-[_iconView(iw)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textView]|" options:0 metrics:metrics views:views]];
        
        _inputHeightConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:_minHeight];
        
        [self addConstraint:_inputHeightConstraint];
    }
    return self;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    [_textView setFont:_font];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [_textView setPlaceholder:placeholder];
}

- (void)setIcon:(UIImage *)icon
{
    _icon = icon;
    [_iconView setImage:_icon];
}

#pragma mark - UITextViewDelegate

// this is the only implementation that has any functionality.
- (void)textViewDidChange:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [_delegate textViewDidChange:textView];
    }
    
    // adjust to fit height
    [self updateInputSize];
}

/**
 *  Update the height of the input view to reflect the text height
 */
- (void) updateInputSize
{
    // resize based on text change
    [[_textView layoutManager] ensureLayoutForTextContainer:[_textView textContainer]];
    CGRect inputFrame = [_textView frame];
    CGSize inputSize = [_textView sizeThatFits:CGSizeMake(inputFrame.size.width, CGFLOAT_MAX)];
    CGFloat height = ceilf(MIN(_maxHeight, MAX(inputSize.height + 8, _minHeight))); // account for padding in textview
    [_inputHeightConstraint setConstant:height];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        return [_delegate textViewShouldBeginEditing:textView];
    }
    return TRUE;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [_delegate textViewShouldEndEditing:textView];
    }
    return TRUE;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [_delegate textViewDidBeginEditing:textView];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [_delegate textViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([_delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [_delegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return TRUE;
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if ([_delegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        [_delegate textViewDidChangeSelection:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if ([_delegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)]) {
        return [_delegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
    }
    return TRUE;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    if ([_delegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)]) {
        return [_delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    return TRUE;
}

@end
