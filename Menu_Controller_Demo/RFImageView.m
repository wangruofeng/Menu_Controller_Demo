//
//  RFImageView.m
//  Menu_Controller_Demo
//
//  Created by 王若风 on 4/14/16.
//  Copyright © 2016 王若风. All rights reserved.
//

#import "RFImageView.h"

@implementation RFImageView

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:) || action == @selector(paste:));
}

#pragma mark - UIResponderStandardEditActions

- (void)copy:(id)sender {
    [[UIPasteboard generalPasteboard] setImage:self.image];
}

- (void)paste:(id)sender {
    
    UIImage *toBePastedImge = [[UIPasteboard generalPasteboard] image];
    self.image = toBePastedImge;
}


@end
