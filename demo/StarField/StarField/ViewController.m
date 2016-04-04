//
//  ViewController.m
//  StarField
//
//  Created by Tin Blanc on 4/4/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *red, *violet, *brown, *green;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];

    [self location];
    
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    
    [self animateStar];
}

- (void) location {
    red.center = CGPointMake(self.view.bounds.size.width * 0.5, (self.view.bounds.size.height - 60) * 0.5);
    violet.center = CGPointMake(self.view.bounds.size.width * 0.5, (self.view.bounds.size.height - 60) * 0.5);
    brown.center = CGPointMake(self.view.bounds.size.width * 0.5, (self.view.bounds.size.height - 60) * 0.5);
    green.center = CGPointMake(self.view.bounds.size.width * 0.5, (self.view.bounds.size.height - 60) * 0.5);

}

-(void) animateStar{
    [UIView animateWithDuration:1 animations:^{
        brown.center = CGPointMake((self.view.bounds.size.width * 0.5) - 100, ((self.view.bounds.size.height - 60) * 0.5) - 100);
        red.center = CGPointMake((self.view.bounds.size.width * 0.5) + 100, ((self.view.bounds.size.height - 60) * 0.5) + 100);
        green.center = CGPointMake((self.view.bounds.size.width * 0.5) + 100, ((self.view.bounds.size.height - 60) * 0.5) - 100);
        violet.center = CGPointMake((self.view.bounds.size.width * 0.5) - 100, ((self.view.bounds.size.height - 60) * 0.5) + 100);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            brown.center = CGPointMake((self.view.bounds.size.width * 0.5) - 100, (self.view.bounds.size.height - 60) * 0.5);
            red.center = CGPointMake((self.view.bounds.size.width * 0.5) + 100, (self.view.bounds.size.height - 60) * 0.5);
            green.center = CGPointMake((self.view.bounds.size.width * 0.5), ((self.view.bounds.size.height - 60) * 0.5) - 100);
            violet.center = CGPointMake((self.view.bounds.size.width * 0.5), ((self.view.bounds.size.height - 60) * 0.5) + 100);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                [self location];
            } completion:^(BOOL finished) {
                [self animateStar];
            }];
            
        }];
        
    }];
    
    
}


@end
