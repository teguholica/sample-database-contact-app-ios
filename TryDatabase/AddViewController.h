//
//  AddViewController.h
//  TryDatabase
//
//  Created by DWC Admin on 1/6/16.
//  Copyright © 2016 teguholica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
- (IBAction)save:(id)sender;

@property (strong) NSManagedObjectModel *contact;


@end
