//
//  MessageViewController.h
//  LocalizationPOC
//
//  Created by Jeroen Trappers on 28/04/12.
//  Copyright (c) 2012 iCapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *theMessage;
@property (weak, nonatomic) IBOutlet UIImageView *theFlag;

@end
