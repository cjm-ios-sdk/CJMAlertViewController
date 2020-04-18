//
//  CJMViewController.m
//  CJMAlertViewController
//
//  Created by chenjm on 04/14/2020.
//  Copyright (c) 2020 chenjm. All rights reserved.
//

#import "CJMViewController.h"
#import <CJMAlertViewController.h>

@interface CJMViewController () <UITextFieldDelegate>

@end

@implementation CJMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CJMAlertViewController *vc = [[CJMAlertViewController alloc] init];
    
    // 设置标题
    vc.alertTitle = @"新建文件夹";
    
    [vc addLabelWithConfigurationHandler:^(UILabel * _Nonnull label) {
        label.text = @"请输入文件夹名称：";
    }];
    
    [vc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"名称";
        textField.delegate = self;
    }];
    
    [vc addLabelWithConfigurationHandler:^(UILabel * _Nonnull label) {
        label.text = @"\n请选择颜色：";
    }];
        
    [vc addScrollViewWithHeight:50 configurationHandler:^(UIScrollView * _Nonnull scrollView) {
        NSArray *array = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor orangeColor],
                           [UIColor magentaColor], [UIColor purpleColor], [UIColor purpleColor], [UIColor brownColor]];
        NSString *hcsString = @"H:|";

        NSMutableArray *vcsArray = [[NSMutableArray alloc] initWithCapacity:array.count * 4];
        NSMutableDictionary *hcsDict = [[NSMutableDictionary alloc] initWithCapacity:array.count];

        NSInteger i = 0;
        for (UIColor *color in array) {
            UIButton *button = [[UIButton alloc] init];
            [scrollView addSubview:button];
            button.backgroundColor = color;
            button.layer.borderWidth = 1;
            button.layer.borderColor = [UIColor grayColor].CGColor;
            button.layer.cornerRadius = 4;
            button.translatesAutoresizingMaskIntoConstraints = NO;

            NSArray *vcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[button(44)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];

            [vcsArray addObjectsFromArray:vcs];

            hcsString = [NSString stringWithFormat:@"%@[button%ld(44)]-", hcsString, i];
            [hcsDict setValue:button forKey:[NSString stringWithFormat:@"button%ld", i]];
            i++;
        }

        hcsString = [NSString stringWithFormat:@"%@|", hcsString];

        NSArray *hcsArray = [NSLayoutConstraint constraintsWithVisualFormat:hcsString options:0 metrics:nil views:hcsDict];

        [scrollView addConstraints:hcsArray];
        [scrollView addConstraints:vcsArray];

        [NSLayoutConstraint activateConstraints:hcsArray];
        [NSLayoutConstraint activateConstraints:vcsArray];
    }];
    
    CJMAlertAction *cancelAction = [CJMAlertAction actionWithTitle:@"取消" style:0 handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [vc addAction:cancelAction];
    
    CJMAlertAction *sureAction = [CJMAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    [vc addAction:sureAction];
    sureAction.enabled = NO;

    [self.navigationController presentViewController:vc animated:YES completion:^{
        
    }];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CJMAlertViewController *vc = (CJMAlertViewController *)self.navigationController.presentedViewController;
    [vc.view layoutIfNeeded];
    [UIView animateWithDuration:0.5 animations:^{
        vc.alertView.transform = CGAffineTransformMakeTranslation(0, -100);
    } completion:^(BOOL finished) {
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    CJMAlertViewController *vc = (CJMAlertViewController *)self.navigationController.presentedViewController;
    [vc.view layoutIfNeeded];
    [UIView animateWithDuration:0.5 animations:^{
        vc.alertView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
