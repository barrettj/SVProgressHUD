//
//  NSArray+SVProgressHUD.m
//  SVProgressHUD
//
//  Created by Luke Stringer on 04/10/2012.
//
//

#import "NSArray+SVProgressHUD.h"
#import "SVProgressHUD.h"

@implementation NSArray (SVProgressHUD)

/*
 Enumerates through an NSArray using enumerateObjectsUsingBlock: method,
 and updates an SVProgressHUDIndicatorTypeProgressBar SVProgressHUD as each object is iterated over.
 */
- (void)enumerateObjectsWithSVProgressHUDUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block {
    // Setup SVProgressHUD with type SVProgressHUDIndicatorTypeProgressBar
    __block float progress = 0.0f;
    [SVProgressHUD setProgress:progress];
	[SVProgressHUD showWithStatus:@"Enumerating" maskType:SVProgressHUDMaskTypeNone indicatorType:SVProgressHUDIndicatorTypeProgressBar networkIndicator:NO];
    
    // Use GCD to execute block on another thread
    // Leave main thread free to update SVProgressHUD
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            // Execute block
            block(obj, idx, stop);
            
            // Update the SVProgressHUD's progress
            progress = (float)(idx+1) /(float)self.count;
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD setProgress:progress];
            });
            
            // Dismiss if last element
            if (idx+1 == self.count) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                });
            }
        }];
        
    });

}

@end
