//
//  LoginVC.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    HIDE_NAV_BAR
    GESTURE_POP
    
    btnForgot.layer.shadowColor = BLACK_COLOR.CGColor;
    btnForgot.layer.shadowOffset = CGSizeMake(1, 1);
    btnForgot.layer.shadowOpacity = 10;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

GESTURE_POP_DELEGATE
@end
