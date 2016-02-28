//
//  ViewController.m
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import "ViewController.h"
#import "myScroll.h"
#import "define.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setFrame:CGRectMake(0, 0, MY_WIDTH, MY_HEIGHT)];
    //self.scroll=[[myScroll alloc] initWithFrame:CGRectMake(0, 0,MY_WIDTH , MY_HEIGHT)];
    //self.scroll.imgArray=[NSArray arrayWithArray:urls];
    self.scroll=[myScroll shareInstance];
   // self.scroll=[[myScroll alloc] initWithFrame:CGRectMake(0, 0, MY_WIDTH, MY_HEIGHT)];
   // self.scroll.textArray=[NSArray arrayWithArray:texts];
    [self.view addSubview:self.scroll];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
