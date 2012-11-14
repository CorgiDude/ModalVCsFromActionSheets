//
//  PTAModalViewController.m
//  Modal VC From BarButtonItem
//
//  Created by Andrew Wilcox on 2012-Nov-14.
//  Copyright (c) 2012 Wilcox Technologies LLC. All rights reserved.
//

#import "PTAModalViewController.h"

@interface PTAModalViewController ()

@end

@implementation PTAModalViewController

-(void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor darkGrayColor];
	self.navigationItem.title = @"Dismiss this view ->";
}


@end
