//
//  ViewController.m
//  Menu_Controller_Demo
//
//  Created by 王若风 on 4/14/16.
//  Copyright © 2016 王若风. All rights reserved.
//

#import "ViewController.h"
#import "RFLabel.h"
#import "RFImageView.h"

#pragma clang diagnostic ignored "-Wundeclared-selector"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RFLabel *topLabel;
@property (weak, nonatomic) IBOutlet RFLabel *bottomLabel;

@property (weak, nonatomic) IBOutlet RFImageView *leftImageView;
@property (weak, nonatomic) IBOutlet RFImageView *rightImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.topLabel.userInteractionEnabled = YES;
    self.bottomLabel.userInteractionEnabled = YES;
    self.leftImageView.userInteractionEnabled = YES;
    self.rightImageView.userInteractionEnabled = YES;
    
    
    UIGestureRecognizer *gestureRecognizer1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    UIGestureRecognizer *gestureRecognizer2 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    UIGestureRecognizer *gestureRecognizer3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    UIGestureRecognizer *gestureRecognizer4 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    
    [self.topLabel addGestureRecognizer:gestureRecognizer1];
    [self.bottomLabel addGestureRecognizer:gestureRecognizer2];
    [self.leftImageView addGestureRecognizer:gestureRecognizer3];
    [self.rightImageView addGestureRecognizer:gestureRecognizer4];
}

- (void)handleLongPressGesture:(UIGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [recognizer.view becomeFirstResponder];
        
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        
        // add a custom menu item
        UIMenuItem *customItem = [[UIMenuItem alloc] initWithTitle:@"Custom" action:@selector(customAction:)];
        menuController.menuItems = [NSArray arrayWithObject:customItem];
        
        [menuController setTargetRect:recognizer.view.frame inView:recognizer.view.superview];
        [menuController setMenuVisible:YES animated:YES];
        
    }
}

@end
