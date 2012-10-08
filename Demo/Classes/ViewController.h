//
//  SVProgressHUDViewController.h
//  SVProgressHUD
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    CGFloat progress;
}

- (IBAction)show;
- (IBAction)showWithStatus;
- (IBAction)showWithProgress:(id)sender;
- (IBAction)showWhileEnumeratingObjects:(id)sender;

- (IBAction)dismiss;
- (IBAction)dismissSuccess;
- (IBAction)dismissError;

- (IBAction)increaseProgress:(id)sender;
@end

