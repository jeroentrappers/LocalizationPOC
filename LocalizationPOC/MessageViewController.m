//
//  MessageViewController.m
//  LocalizationPOC
//
//  Created by Jeroen Trappers on 28/04/12.
//  Copyright (c) 2012 iCapps. All rights reserved.
//

#import "MessageViewController.h"
#import "LocalizationSystem.h"

@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize theMessage;
@synthesize theFlag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = ICLocalizedString(@"Message Title", @"The demo title");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.theMessage.text = ICLocalizedString(@"Message", @"The demo message");

    self.theFlag.image = ICLocalizedImage(@"flag");
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [self setTheMessage:nil];
    [self setTheFlag:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
