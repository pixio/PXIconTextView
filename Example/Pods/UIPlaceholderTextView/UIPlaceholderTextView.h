//
//  UIPlaceHolderTextView.h
//
//  Created by Jason George on 11/09/09.
//  Edited by several others:
//  http://stackoverflow.com/a/1704469/579405
//
//  Licensed under cc by-sa 3.0:
//  http://creativecommons.org/licenses/by-sa/3.0/
//

#import <Foundation/Foundation.h>

/**
 *  A textview with placeholder text.
 */
@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end