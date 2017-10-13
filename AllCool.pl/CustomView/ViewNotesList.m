//
//  ViewNotesList.m
//  AllCool.pl
//
//  Created by Sanjay on 13/10/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "ViewNotesList.h"

@implementation ViewNotesList

- (void)drawRect:(CGRect)rect {

    self.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        
    } completion:^(BOOL finished) {
        
    }];
    
    _tableList.delegate = self;
    _tableList.dataSource = self;
    [_tableList reloadData];
}

- (IBAction)tapBack:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

#pragma mark Table

-(CGFloat)tableView:(UITableView* )tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ViewNotesList" owner:self options:nil]objectAtIndex:1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController * alert=[UIAlertController
                               
                               alertControllerWithTitle:@"Options" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Edit"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //What we write here????????**
                                    
                                    
                                }];
    
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Delete"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //What we write here????????**
                                   
                               }];
    
    UIAlertAction* cancel = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action)
                               {
                                   
                               }];
    [alert addAction:cancel];

    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self.selfBack presentViewController:alert animated:YES completion:nil];
}

@end
