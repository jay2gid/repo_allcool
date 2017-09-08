//
//  HeaderView.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "HeaderView.h"
#import "DrewerVeiw.h"
@implementation HeaderView

- (void)drawRect:(CGRect)rect {

}

- (IBAction)tapMenu:(id)sender
{
   DrewerVeiw *obj =  [[[NSBundle mainBundle] loadNibNamed:@"DrewerView" owner:self options:nil]objectAtIndex:0];
    obj.backSelf = self.selfBack;
    [self.selfBack.view addSubview:obj];
}

@end
