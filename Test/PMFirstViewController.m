//
//  PMFirstViewController.m
//  Test
//
//  Created by Adam Duke on 7/6/12.
//  Copyright (c) 2012 appRenaissance, LLC. All rights reserved.
//

#import "PMFirstViewController.h"

@interface PMFirstViewController ()

@property (nonatomic, strong) UIDatePicker *picker;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UITextField *field;
@end

@implementation PMFirstViewController

@synthesize picker = _picker;
@synthesize toolbar = _toolbar;
@synthesize field = _field;

-(void)loadView
{
    [super loadView];
    self.picker = [[UIDatePicker alloc] init];
    [self.picker addTarget:self action:@selector(handlePickerChanged:) forControlEvents:UIControlEventValueChanged];
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard:)];
    self.toolbar.items = [NSArray arrayWithObject:doneButton];
    self.field = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 25)];
    self.field.backgroundColor = [UIColor lightGrayColor];
    self.field.inputView = self.picker;
    self.field.inputAccessoryView = self.toolbar;
}

- (void)resignKeyboard:(id)sender
{
    [self.field resignFirstResponder];
}
- (void)handlePickerChanged:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)sender;
    NSString *dateString = [picker.date description];
    self.field.text = dateString;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"abc"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.field];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.field resignFirstResponder];
}
@end
