//
//  ViewController.m
//  ActionsAndOutlets
//
//  Created by Chrisna Aing on 3/11/15.
//  Copyright (c) 2015 Chrisna Aing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

#pragma mark - Outlet Collection

// Order is not guaranteed in outlet collections. And, things should be private whenever it's
// possible to make them private!

@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *switches;

@end

@implementation ViewController

#pragma mark - First

- (IBAction)myAction:(id)sender {
}

- (IBAction)myActionImproved:(UIButton *)sender {
    [sender setTitle:@"First!" forState:UIControlStateNormal];
}

#pragma mark - Second

// A button can be tied to multiple actions, as seen below (and above too, actually). The extra
// wrinkle with the actions below is that the first one is triggered when the event is "touch up
// outside" whereas the second one is triggered when the event is "touch up inside."

// Also, to better align with best practices, we do not pass an argument into the action because we
// don't need one.

- (IBAction)touchOutside {
    NSLog(@"Touch up outside!");
}

- (IBAction)touch {
    NSLog(@"Touch up inside!");
}

#pragma mark - Third

// Passing in the event can be helpful if you want very specific information about a user's
// interaction with the screen.

- (IBAction)thirdAction:(UIButton *)sender forEvent:(UIEvent *)event {
    for (UITouch *touch in [[event allTouches] allObjects]) {
        NSLog(@"%@", NSStringFromCGPoint([touch locationInView:self.view]));
    }
}

#pragma mark - Toggling

// Instead of doing this with individual outlets, we can create an outlet collection and iterate
// through the list of UISwitches. This is way cleaner and less error-prone as well.

- (IBAction)toggleOn {
    for (UISwitch *s in self.switches) {
        [s setOn:YES animated:YES];
    }
}

- (IBAction)toggleOff {
    for (UISwitch *s in self.switches) {
        [s setOn:NO animated:YES];
    }
}

@end
