//
//  mainViewController.m
//  test_container
//
//  Created by Ido on 12/28/14.
//  Copyright (c) 2014 spark. All rights reserved.
//

#import "mainViewController.h"
#import "signupViewController.h"

@interface mainViewController () <signupViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIViewController *currentVC;


@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    signupViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    svc.delegate = self;
    [self showViewController:svc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)didFinishLoginProcess:(id)sender
{
    NSLog(@"operation");
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"operation"];
    [self showViewController:vc];
}

- (void)showViewController:(UIViewController *)viewController
{
    if (self.currentVC)
    {
        [self addChildViewController:viewController];
        [self transitionFromViewController:self.currentVC toViewController:viewController duration:0.5f options:UIViewAnimationOptionTransitionFlipFromTop animations:nil completion:nil];
        [self hideViewController:self.currentVC];
    }
    self.currentVC = viewController;
    [self.containerView endEditing:YES];
    [self addChildViewController:viewController];
    [self.containerView addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}


- (void)hideViewController:(UIViewController *)viewController;
{
    [self.containerView endEditing:YES];
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}


@end
