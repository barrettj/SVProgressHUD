//
//  NSArray+SVProgressHUD.h
//  SVProgressHUD
//
//  Created by Luke Stringer on 04/10/2012.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (SVProgressHUD)

/*
    Enumerates through an NSArray using enumerateObjectsUsingBlock: method, 
    and updates an SVProgressHUD progress bar as each object is iterated over.
 */
- (void)enumerateObjectsWithSVProgressHUDUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);

@end
