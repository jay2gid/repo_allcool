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

- (IBAction)btnLoginClk:(id)sender
{
    if (txtEmail.text.length < 1)
    {
        [txtEmail becomeFirstResponder];
        [WebServiceCalls alert:@"Enter Email first."];
    }
    else if (txtPass.text.length < 1)
    {
        [txtPass becomeFirstResponder];
        [WebServiceCalls alert:@"Enter Email first."];
    }
    else if (![WebServiceCalls isValidEmail:txtEmail.text])
    {
        [txtEmail becomeFirstResponder];
        [WebServiceCalls alert:@"Enter valid Email."];
    }
    else
    {
        [self LoginAPI];
    }
}

-(void) LoginAPI
{
    SVHUD_START
    
    NSDictionary *dict = @{@"email":txtEmail.text, @"password":txtPass.text, @"type":@"user"};
    
    // http://allcool.pl/api_ios/check_login.php

    [WebServiceCalls POST:@"check_login.php" parameter:dict completionBlock:^(id JSON, WebServiceResult result)
    {
        SVHUD_STOP
        NSLog(@"%@", JSON);
        
        if ([JSON[@"success"] integerValue] == 1)
        {
            //[WebServiceCalls alert:JSON[@"message"]];
            
            /*
             {
             message = "Zalogowano z sukcesem";
             success = 1;
             "user_detail" =     {
             address = "        ";
             city = "";
             contact = "";
             country = Poland;
             "dat_add" = "2017-03-22 02:26:13";
             dob = "";
             firstname = RRahul;
             image = "http://allcool.pl/assests/images/user/1494731616_1494731613908.jpg";
             lastname = Jangid;
             msg = "Zalogowano z sukcesem";
             newsletter = "";
             postcode = "";
             quote = "";
             title = Pan;
             useremail = "rahuljangid1993@gmail.com";
             userid = 1;
             usrtype = 2;
             };
             }
             */
            
            NSString *setUserID = [NSString stringWithFormat:@"%@", JSON[@"user_detail"][@"userid"]];
            [[NSUserDefaults standardUserDefaults] setObject:setUserID forKey:@"userid"];
            
            UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            FirstVC *obj = [storybord instantiateViewControllerWithIdentifier:@"FirstVC"];
            [self.navigationController pushViewController:obj animated:YES];
        }
        else
        {
            [WebServiceCalls alert:JSON[@"message"]];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

GESTURE_POP_DELEGATE
@end
