//
//  CMViewController.m
//  AnimateCountLabel
//
//  Created by comma on 04/18/2018.
//  Copyright (c) 2018 comma. All rights reserved.
//

#import "CMViewController.h"
#import <AnimateCountLabel/UILabel+AnimateCount.h>

@interface CMViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic, assign) BOOL didChange;

@end

@implementation CMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickChange:(id)sender {
    if (self.didChange) {
        [self.countLabel changeNumberFrom:@"1000" to:@"-1000" duration:2];
    }else {
        [self.countLabel changeNumberFrom:@"-1000" to:@"1000" duration:2];
    }
    self.didChange = !self.didChange;
}

@end
