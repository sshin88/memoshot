//
//  home_memoAppDelegate.h
//  home-memo
//
//  Created by zedoul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class home_memoViewController;

@interface home_memoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    home_memoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet home_memoViewController *viewController;

@end

