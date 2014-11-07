//
//  ViewController.m
//  Test POP UP
//
//  Created by Mubashir Meddekar on 01/11/14.
//  Copyright (c) 2014 Mubashir Meddekar. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIPopoverController *pop;
@end

@implementation ViewController
@synthesize pop;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)displayPopOver:(UIButton *)sender {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        TableViewController *table = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
        pop = [[UIPopoverController alloc]initWithContentViewController:table];
        pop.delegate = self;
        [pop setPopoverContentSize:CGSizeMake(180, 280) animated:YES];
        [pop presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone) {
    
    UIActionSheet *mySheet = [[UIActionSheet alloc]initWithTitle:@"Settings" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                              @"First",
                              @"Second",
                              @"Third",
                              @"Fourth",nil];
    [mySheet showInView:self.view];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        TableViewController *table = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
        [self presentViewController:table animated:YES completion:nil];
    }
    else if(buttonIndex ==1){
        NSLog(@"Add from Contacts");
    }
    else if(buttonIndex ==2){
        NSLog(@"Change Password");
    }
    else if (buttonIndex ==3){
        NSLog(@"Logout");
    }
}

@end
