//
//  signupViewController.h
//  test_container
//
//  Created by Ido on 12/28/14.
//  Copyright (c) 2014 spark. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol signupViewControllerDelegate <NSObject>
@required
-(void)didFinishLoginProcess:(id)sender;

@end

@interface signupViewController : UIViewController
@property (nonatomic, strong) id<signupViewControllerDelegate> delegate;
//@property (nonatomic, strong) UIViewController *parent
@end
