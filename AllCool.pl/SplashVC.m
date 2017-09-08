//
//  SplashVC.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "SplashVC.h"
#import "UIImage+GIF.h"
@interface SplashVC ()
{
    IBOutlet UIImageView *imgaeGif;

}
@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HIDE_NAV_BAR
    
  //  NSURL *url = [[NSBundle mainBundle] URLForResource:@"driver_call_icon" withExtension:@"gif"];

    
    UIImage* mygif = [UIImage sd_animatedGIFNamed:@"kufel5"];
    imgaeGif.image = mygif;
    
    [self performSelector:@selector(method) withObject:nil afterDelay:3];
}

-(void)method
{
    [self performSegueWithIdentifier:@"goLogin" sender:nil];
}

- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
 
}

@end
