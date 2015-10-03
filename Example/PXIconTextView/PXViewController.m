//
//  PXViewController.m
//  PXIconTextView
//
//  Created by Daniel Blakemore on 05/01/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXViewController.h"
#import "PXView.h"

@interface PXViewController ()

@end

@implementation PXViewController

- (void)loadView
{
    [self setView:[[PXView alloc] init]];
}

- (PXView*)contentView
{
    return (PXView*)[self view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setTitle:@"PX Icon TextView"];
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    // Modify the colors of the navigation
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:0.35 green:0.88 blue:0.55 alpha:1]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [[[self contentView] leftText] setDelegate:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self contentView] endEditing:TRUE];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
