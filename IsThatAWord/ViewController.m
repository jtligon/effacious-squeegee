//
//  ViewController.m
//  IsThatAWord
//
//  Created by Jeff Ligon on 11/5/15.
//  Copyright © 2015 Visceral Origami. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic,strong)AVSpeechSynthesizer *synth;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synth = [[AVSpeechSynthesizer alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.synth = nil;
    self.wordField = nil;
    self.tryButton = nil;
}

-(IBAction)checkCurrentWord:(id)sender{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.wordField.text];
    [utterance setRate:0.5f];
    [self.synth speakUtterance:utterance];
    if ([self isDictionaryWord:self.wordField.text]) {
        AVSpeechUtterance *confirm = [AVSpeechUtterance speechUtteranceWithString:@"is a word"];
        [utterance setRate:0.5f];
        [self.synth speakUtterance:confirm];
    }else{
        AVSpeechUtterance *deny = [AVSpeechUtterance speechUtteranceWithString:@"is not a word"];
        [utterance setRate:0.5f];
        [self.synth speakUtterance:deny];
    }
}

-(bool)isDictionaryWord:(NSString*)wordToCheck{
    UITextChecker *Checker = [[UITextChecker alloc] init];
    
    NSRange range = NSMakeRange(0, wordToCheck.length);
    
    
    NSRange misspelledRange = [Checker rangeOfMisspelledWordInString:[wordToCheck lowercaseString] range:range startingAt:0 wrap:NO language:@"en_US"];
    
    bool isValidWord = misspelledRange.location == NSNotFound;
    
    return isValidWord;
}
@end
