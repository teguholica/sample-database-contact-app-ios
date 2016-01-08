//
//  AddViewController.m
//  TryDatabase
//
//  Created by DWC Admin on 1/6/16.
//  Copyright © 2016 teguholica. All rights reserved.
//

#import "AddViewController.h"
#import <CoreData/CoreData.h>

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize contact;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.contact) {
        [self.txtName setText:[self.contact valueForKey:@"name"]];
        [self.txtPhone setText:[self.contact valueForKey:@"phone"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.contact) {
        [self.contact setValue:self.txtName.text forKey:@"name"];
        [self.contact setValue:self.txtPhone.text forKey:@"phone"];
    } else {
        NSManagedObject *contacts = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
        
        [contacts setValue:self.txtName.text forKey:@"name"];
        [contacts setValue:self.txtPhone.text forKey:@"phone"];
    }
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
