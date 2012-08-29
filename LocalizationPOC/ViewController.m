//
//  ViewController.m
//  LocalizationPOC
//
//  Created by Jeroen Trappers on 28/04/12.
//  Copyright (c) 2012 iCapps. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"
#import "ResourceViewController.h"
#import "LocalizationSystem.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setupUI];
}

- (void) setupUI
{
    //self.title = ICLocalizedString(@"Choose Language", @"Title of Language Chooser");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeLanguage:(UIButton *)sender {

    
    ICLocalizationSetLanguage(sender.titleLabel.text);
    
    [self setupUI];
}

- (IBAction)showString:(UIButton *)sender {
    
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

- (IBAction)showNib:(UIButton *)sender {
    
    ResourceViewController *resourceVC  = ICLocalizedViewController([ResourceViewController class]);
    
    [self.navigationController pushViewController:resourceVC animated:YES];
    
}
@end
