//
//  ViewController.m
//  Social
//
//  Created by Quix Creations Singapore iOS 1 on 30/8/15.
//  Copyright © 2015 Terry Chia. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)social:(id)sender {
    
    //Run it and you will know what is actionsheet about!
    
    UIActionSheet *share = [[UIActionSheet alloc]initWithTitle:@"SomeThing" delegate:self cancelButtonTitle:@"Ok!" destructiveButtonTitle:nil otherButtonTitles:@"Tweet!",@"Facebook", nil];
    
    [share showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
        //SLComposeViewController is by to social framework!
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            [tweetSheet setInitialText:@"Terry is learning how to integrate into Twitter with iOS!"];
            
            [self presentViewController:tweetSheet animated:YES completion:nil];
        } else{
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"You cannot send a Tweet now. Make sure you have at least a single Twitter account set up and your device is iOS 6." delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
            
            [alertView show];
        }
    }else if (buttonIndex == 1){
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            SLComposeViewController *faceBook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [faceBook setInitialText:@"Terry is learning how to integrate into Facebook with iOS"];
            
            [self presentViewController:faceBook animated:YES completion:nil];
        } else{
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"You cannot send a facebook post. Make sure you have at least a single Facebook account set up and your iOS device is iOS 6." delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
            
            [alertView show];
        }
    }
}
@end
