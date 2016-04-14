//
//  RFLabel.m
//  UIMenu​ControllerDemo
//
//  Created by 王若风 on 4/14/16.
//  Copyright © 2016 王若风. All rights reserved.
//

#import "RFLabel.h"

@implementation RFLabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:) || action == @selector(paste:) || action == @selector(customAction:));
}

#pragma mark - UIResponderStandardEditActions

- (void)copy:(id)sender {
    [[UIPasteboard generalPasteboard] setString:self.text];
}

- (void)paste:(id)sender {
   NSString *toBePastedString = [[UIPasteboard generalPasteboard] string];
    self.text = toBePastedString;
}

- (void)customAction:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}

@end
