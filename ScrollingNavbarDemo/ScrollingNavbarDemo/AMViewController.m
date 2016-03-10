//
//  AMViewController.m
//  ScrollingNavbarDemo
//
//  Created by Andrea on 08/11/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Remember to set the navigation bar to be NOT translucent
    [self.navigationController.navigationBar setTranslucent:NO];
    [self setTitle:@"Demo"];
    
    UIColor *tintColor = UIColorFromRGB(0x184fa2);
    if (!SystemVersionIsLessThan(@"7.0")) {
        SEL setBarTintColorSEL = NSSelectorFromString(@"setBarTintColor:");
        IMP imp = [self.navigationController.navigationBar methodForSelector:setBarTintColorSEL];
        void (*func)(id, SEL, UIColor *) = (void *)imp;
        func(self.navigationController.navigationBar, setBarTintColorSEL, tintColor);
    } else {
        [self.navigationController.navigationBar setTintColor:tintColor];
    }
}

@end
