//
//  WaitDriverViewController.m
//  UBERGuide
//
//  Created by Fincher Justin on 16/1/16.
//  Copyright © 2016年 hACKbUSTER. All rights reserved.
//

#import "WaitDriverViewController.h"
#import "UBERGuide-Swift.h"

@interface WaitDriverViewController ()


@end

@implementation WaitDriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    self.title = @"Driver is on the way..";
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
    self.driverProfileImageView.layer.masksToBounds = YES;
    
    if(self.dict == nil)
    {
        self.dict = [NSDictionary dictionary];
    }
    
    
    self.driverStarLabel.text = [NSString stringWithFormat:@"%@",[[self.dict objectForKey:@"driver"] objectForKey:@"rating"]];
    self.driverNameLabel.text = [[self.dict objectForKey:@"driver"] objectForKey:@"name"];
    self.carTypeLabel.text = [NSString stringWithFormat:@"%@ %@",[[self.dict objectForKey:@"vehicle"] objectForKey:@"make"],[[self.dict objectForKey:@"vehicle"] objectForKey:@"model"]];
    
    self.driverProfileImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.driverProfileImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.dict objectForKey:@"driver"] objectForKey:@"picture_url"]]]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    API *api = [[API alloc]init];
    [api requestMap:^(id object) {
        [self.mapWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[object objectForKey:@"data"] objectForKey:@"href"]]]];
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _driverProfileImageView.layer.cornerRadius = _driverProfileImageView.frame.size.width/2;
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

@end
