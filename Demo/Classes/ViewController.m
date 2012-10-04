//
//  SVProgressHUDViewController.m
//  SVProgressHUD
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "NSArray+SVProgressHUD.h"

@implementation ViewController


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Show Methods Sample

- (void)show {
	[SVProgressHUD show];
}

- (void)showWithStatus {
	[SVProgressHUD showWithStatus:@"Doing Stuff"];
}

- (IBAction)showWithProgress:(id)sender {
    progress = 0.0f;
    [SVProgressHUD setProgress:progress];
	[SVProgressHUD showWithStatus:@"Progressing" maskType:SVProgressHUDMaskTypeNone indicatorType:SVProgressHUDIndicatorTypeProgressBar networkIndicator:NO];
}

- (IBAction)showWhileEnumeratingObjects:(id)sender {
    // Make a load of objects
    int numOfObjects = 10000;
    NSMutableArray *objects = [NSMutableArray array];
    for (int i = 0; i < numOfObjects; i++) {
        [objects addObject:@(i)];
    }
    
    // Enumerate over them and show a SVProgressHUDIndicatorTypeProgressBar SVProgressHUD to show the progress
    [objects enumerateObjectsWithSVProgressHUDUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
    }];
}


#pragma mark -
#pragma mark Dismiss Methods Sample

- (void)dismiss {
	[SVProgressHUD dismiss];
}

- (void)dismissSuccess {
	[SVProgressHUD dismissWithSuccess:@"Great Success!"];
}

- (void)dismissError {
	[SVProgressHUD dismissWithError:@"Failed with Error"];
}

- (IBAction)increaseProgress:(id)sender {
    progress += 0.05;
    
    if (progress >= 1.0) {
        [SVProgressHUD dismissWithSuccess:@"Complete"];
    }
    else {
        [SVProgressHUD setProgress:progress];
    }
}

@end
