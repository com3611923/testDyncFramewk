//
//  ViewController.m
//  testDync
//
//  Created by caobin on 16/3/22.
//  Copyright © 2016年 caobin. All rights reserved.
//

#import "ViewController.h"
#import <dyncframewk/Run.h>
#import <dyncframewk/DyncViewController.h>
#import <dlfcn.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    Run *run = [Run new];
//    [run testRun];
    NSString *dylicDir = [NSString stringWithFormat:@"%@/Library/Frame",NSHomeDirectory()];
    NSString *documentsPath = [NSString stringWithFormat:@"%@/Dylib.framework/dyncframewk",dylicDir];
    [self dlopenLoadDylibWithPath:documentsPath];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(100, 100, 200, 30)];
    button1.layer.borderColor = [UIColor blueColor].CGColor;
    //
    button1.layer.borderWidth=1.0;
    //
    button1.layer.cornerRadius =5;
    [button1 setTitle:@"Run" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(onTriggerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(100, 200, 200, 30)];
    button2.layer.borderColor = [UIColor blueColor].CGColor;
    //
    button2.layer.borderWidth=1.0;
    //
    button2.layer.cornerRadius =5;
    [button2 setTitle:@"DyncViewController" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(goToDyncController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dlopenLoadDylibWithPath:(NSString *)path
{
    void *libHandle = NULL;
    libHandle = dlopen([path cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
    if (libHandle == NULL) {
        char *error = dlerror();
        NSLog(@"dlopen error: %s", error);
    } else {
        NSLog(@"dlopen load framework success.");
    }
    
    
    
    
}

- (IBAction)onTriggerButtonAction:(id)sender {
    Class rootClass = NSClassFromString(@"Run");
    if (rootClass) {
        id object = [[rootClass alloc] init];
        [(Run *)object testRun];
    }
}
- (IBAction)goToDyncController:(id)sender {
    
    Class rootClass = NSClassFromString(@"DyncViewController");
    if (rootClass) {
        DyncViewController *controller = [[rootClass alloc] init];
        
        [self.navigationController pushViewController:controller animated:YES];
    }

    
    
}

@end
