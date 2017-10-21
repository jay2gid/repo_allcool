//
//  LoginVC.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "LoginVC.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface LoginVC ()<FBSDKLoginButtonDelegate>
{
    FBSDKLoginButton *loginButton;
}

@end

@implementation LoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    HIDE_NAV_BAR
    GESTURE_POP
    
    btnForgot.layer.shadowColor = BLACK_COLOR.CGColor;
    btnForgot.layer.shadowOffset = CGSizeMake(1, 1);
    btnForgot.layer.shadowOpacity = 10;
    
    loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    loginButton.loginBehavior = FBSDKLoginBehaviorWeb;
    loginButton.hidden = true;
    loginButton.delegate = self;
}
- (IBAction)tapFacebookLogin:(id)sender
{
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)tapGoogleLogin:(id)sender
{
    
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
        NSDictionary *dict = @{@"email":txtEmail.text, @"password":txtPass.text, @"type":@"user"};

        [self LoginWithParamerter:dict];
    }
}

-(void)LoginWithParamerter:(NSDictionary *)param
{
    SVHUD_START
    [WebServiceCalls POST:@"check_login.php" parameter:param completionBlock:^(id JSON, WebServiceResult result)
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
            
            NSString *setUserName = [NSString stringWithFormat:@"%@ %@", JSON[@"user_detail"][@"firstname"], JSON[@"user_detail"][@"lastname"]];
            [[NSUserDefaults standardUserDefaults] setObject:setUserName forKey:@"username"];
            
            NSString *setEmailID = [NSString stringWithFormat:@"%@", JSON[@"user_detail"][@"useremail"]];
            [[NSUserDefaults standardUserDefaults] setObject:setEmailID forKey:@"useremail"];
            
            NSString *setUserType = [NSString stringWithFormat:@"%@", JSON[@"user_detail"][@"usrtype"]];
            [[NSUserDefaults standardUserDefaults] setObject:setUserType forKey:@"usertype"];
            
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


#pragma mark Facebook Delegate

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error
{
    ////  NSLog(@"%@",result);
    ////  NSLog(@"%@",result);
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email" forKey:@"fields"];
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
     {
         if(!error)
         {
             NSMutableDictionary *dic = [NSMutableDictionary dictionary];
             [dic setObject:result[@"name"] forKey:@"name"];
             [dic setObject:@"facebook" forKey:@"type"];

             if (result[@"email"])
             {
                 [dic setObject:result[@"email"] forKey:@"name"];
             }
             else
             {
                 [dic setObject:[NSString stringWithFormat:@"%@@fb.com",result[@"id"]] forKey:@"email"];
             }
             
             [self LoginWithParamerter:dic];
             
             FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
             [loginManager logOut];
         }
     }];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton { 
    
}


GESTURE_POP_DELEGATE

@end
