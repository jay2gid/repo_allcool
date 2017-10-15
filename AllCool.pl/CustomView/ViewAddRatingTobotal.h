//
//  ViewAddRatingTobotal.h
//  AllCool.pl
//
//  Created by Sanjay on 26/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAddRatingTobotal : TPKeyboardAvoidingScrollView
{
    IBOutlet StarRatingControl *viewStarRating;
    IBOutlet ACFloatingTextfield *txtName;
    IBOutlet ACFloatingTextfield *txtEmail;
    IBOutlet ACFloatingTextfield *txtComment;
}

@property (nonatomic, strong) NSString *BID;

@end
