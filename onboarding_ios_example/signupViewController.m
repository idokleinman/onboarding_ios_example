//
//  signupViewController.m
//  test_container
//
//  Created by Ido on 12/28/14.
//  Copyright (c) 2014 spark. All rights reserved.
//

#import "signupViewController.h"

@interface signupViewController ()

@end

@implementation signupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)exitButton:(id)sender {
    
    /*
    [self.parentViewController dismissViewControllerAnimated:YES completion:^{
        //
    }];
     */
    [self.delegate didFinishLoginProcess:self];
}

@end
