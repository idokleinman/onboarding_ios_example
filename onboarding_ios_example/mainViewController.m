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
    
//    int r = (arc4random() % 2);

    NSLog(@"login");
    signupViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    svc.delegate = self;
    
      
//    [self addChildViewController:vc];
    [self showViewController:svc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)didFinishLoginProcess:(id)sender
{
    NSLog(@"operation");
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"operation"];
    [self showViewController:vc];
}

- (void)showViewController:(UIViewController *)viewController;
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
    viewController.view.frame = self.containerView.bounds;
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
