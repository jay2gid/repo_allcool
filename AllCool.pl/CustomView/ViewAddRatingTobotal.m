//
//  ViewAddRatingTobotal.m
//  AllCool.pl
//
//  Created by Sanjay on 26/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "ViewAddRatingTobotal.h"

@implementation ViewAddRatingTobotal

@synthesize BID;

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    txtName.text = User_Name;
    txtEmail.text = User_Email;
}

- (IBAction)btnSendClk:(id)sender
{
    if (txtComment.text.length > 0)
    {
        [self add_Comment];
    }
    else
    {
        [WebServiceCalls alert:@"Enter comment first."];
    }
}

-(void) add_Comment
{
    // http://allcool.pl/api_ios/festival/singlebeer_rating.php

    NSString *star = [NSString stringWithFormat:@"%ld", viewStarRating.rating];
    
    SVHUD_START
    NSDictionary *dict = @{@"uid":UserID, @"bid":BID, @"rating":star, @"comment":txtComment.text, @"email":User_Email, @"type":User_Type};
    
    [WebServiceCalls POST:@"festival/singlebeer_rating.php" parameter:dict completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         
         @try
         {
             if ([JSON[@"success"] integerValue] == 1)
             {
             }
             else
             {
                 [WebServiceCalls alert:@"Unable to fetch data. try again"];
             }
         }
         @catch (NSException *exception)
         {
             [WebServiceCalls alert:@"Unable to fetch data. try again"];
         }
         @finally
         {
         }
     }];
}

- (IBAction)tapCross:(id)sender
{
    [self removeFromSuperview];
}

@end
