//
//  PTAMainViewController.m
//  Modal VC From BarButtonItem
//
//  Created by Andrew Wilcox on 2012-Nov-14.
//  Copyright (c) 2012 Wilcox Technologies LLC. All rights reserved.
//

#import "PTAMainViewController.h"
#import "PTAModalViewController.h"

@interface PTAMainViewController ()

-(void)actionTapped:(id)action;
-(void)dismissTappedInModalVC:(id)action;

@end

@implementation PTAMainViewController

-(void)dismissTappedInModalVC:(id)action
{
	[self dismissModalViewControllerAnimated:YES];
	self.navigationItem.title = @"No more action button in 6.x!";
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch(buttonIndex)
	{
		case 0:
		{
			PTAModalViewController *detailViewController = [[PTAModalViewController alloc] initWithNibName:nil bundle:nil];
			detailViewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissTappedInModalVC:)] autorelease];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
			[detailViewController release];
			[self presentModalViewController:navigationController animated:YES];
			break;
		}
		case 1:
		{
			UIViewController *vc = [[UIViewController alloc] initWithNibName:nil bundle:nil];
			vc.navigationItem.title = @"Tweet";
			vc.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissTappedInModalVC:)] autorelease];
			
			UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
			[vc release];
			
			UIWebView *descriptView = [[UIWebView alloc] initWithFrame:vc.view.bounds];
			descriptView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
			[descriptView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/intent/tweet?text=Hello+woof"]]]];
			[descriptView setScalesPageToFit:YES];
			
			[vc.view addSubview:descriptView];
			[descriptView release];
			
			[self presentModalViewController:navi animated:YES];
			[navi release];
		}
		default:
			break;
	}
}

-(void)actionTapped:(id)action
{
	UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Tap either button."
							   delegate:self
						  cancelButtonTitle:@"Close"
					     destructiveButtonTitle:nil
						  otherButtonTitles:@"Open Grey VC", @"Open Twitter Web View", nil];
	sheet.tag = 1;
	[sheet showFromToolbar:self.navigationController.toolbar];
	[sheet release];
}

-(void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.navigationItem.title = @"Press Action Button";
	
	UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionTapped:)];
	[self setToolbarItems:[NSArray arrayWithObject:actionButton]];
	[actionButton release];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.navigationController setToolbarHidden:NO animated:NO];
	//NSLog(@"There are %d toolbar items: %@", self.toolbarItems.count, self.toolbarItems);
}

-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[self.navigationController setToolbarHidden:YES animated:NO];
	//NSLog(@"There are %d toolbar items: %@", self.toolbarItems.count, self.toolbarItems);
}

@end
