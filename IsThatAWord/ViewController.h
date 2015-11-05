//
//  ViewController.h
//  IsThatAWord
//
//  Created by Jeff Ligon on 11/5/15.
//  Copyright © 2015 Visceral Origami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *tryButton;
@property (strong, nonatomic) IBOutlet UITextField *wordField;

-(IBAction)checkCurrentWord:(id)sender;

@end

