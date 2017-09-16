//
//  Config.h
//  Vizzou'
//
//  Created by Ashish Kumar Sharma on 04/07/16.
//  Copyright © 2016 Ashish Kumar Sharma. All rights reserved.
//

#ifndef Config_h

#define WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define BASE_URL @"http://www.townhouseapp.com/"
#define kClientID @"431281662590-2sm5ihqbmrvkv9ohg9rf80d880ucv6r8.apps.googleusercontent.com";
#define BASE_URL_SOURCE @"http://www.townhouseapp.com"

#define USER_ID_ [[NSUserDefaults standardUserDefaults]objectForKey:@"ID"]
#define USER_NAME_ [[NSUserDefaults standardUserDefaults]objectForKey:@"name"]


////// --- COLORS

#define WHITE_COLOR [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define BLACK_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
#define CLEAR_COLOR [UIColor clearColor]
#define GRAY_COLOR [UIColor grayColor]

#define STATUS_COLOR [UIColor colorWithRed:52.0/255.0 green:172.0/255.0 blue:232.0/255.0 alpha:1]

#define APP_COLOR_HEADER [UIColor colorWithRed:49/255.0 green:201/255.0 blue:255/255.0 alpha:1]

#define APP_COLOR_BLUE [UIColor colorWithRed:0/255.0 green:122/255.0 blue:232/255.0 alpha:1]

#define APP_COLOR_RED [UIColor colorWithRed:183/255.0 green:0/255.0 blue:0/255.0 alpha:1]

#define IOS_DEVICE_ID [[NSUserDefaults standardUserDefaults] objectForKey:@"device_id"]

#define APP_COLOR_SKYCOLOR [UIColor colorWithRed:49/255.0 green:190/255.0 blue:232/255.0 alpha:1]



////// --- FIX CODES

#define timeOutTime 20

#define HIDE_KEY [self.view endEditing:YES];

#define MBHUD_START [MBProgressHUD showHUDAddedTo:self.view animated:YES];
#define MBHUD_STOP  [MBProgressHUD hideHUDForView:self.view animated:YES];

#define SVHUD_START [SVProgressHUD show];
#define SVHUD_STOP  [SVProgressHUD dismiss];

#define HIDE_KEY_ON_TOUCH -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { HIDE_KEY }

#define HIDE_NAV_BAR self.navigationController.navigationBarHidden = YES;

#define POP_BACK [self.navigationController popViewControllerAnimated:YES];

#define STATUS_BAR_WHITE UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = WHITE_COLOR; [self.view addSubview:status];

#define STATUS_BAR UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = STATUS_COLOR; [self.view addSubview:status];

#define GET_HEADER_VIEW   HeaderView *header = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];header.selfBack = self;[self.view addSubview:header];header.frame = CGRectMake(0, 0, WIDTH, 64);




#define GET_HEADER_VIEW_WITH_BACK ViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"ViewHeader" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64); if(is_Poster){ header.backgroundColor = HEADER_COLOR_POSTER;}else{header.backgroundColor = HEADER_COLOR_WORKER;}


#define GET_HEADER_MAIN header = [[[NSBundle mainBundle] loadNibNamed:@"ViewHeader" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64); header.viewBack.hidden = YES; header.lblTitle.text = @"Home"; header.ViewMenu.hidden = NO; if(is_Poster){ header.backgroundColor = HEADER_COLOR_POSTER;}else{header.backgroundColor = HEADER_COLOR_WORKER;}

#define GESTURE_POP_DELEGATE - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{ return YES; }

#define GESTURE_POP self.navigationController.interactivePopGestureRecognizer.enabled = YES; self.navigationController.interactivePopGestureRecognizer.delegate = self;


#define SET_CORNER layer.cornerRadius = 5;

#define Config_h

#endif
