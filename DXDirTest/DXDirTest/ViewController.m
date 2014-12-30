//
//  ViewController.m
//  DXDirTest
//
//  Created by dongxin on 14/12/11.
//  Copyright (c) 2014年 dongxin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[NSString stringWithFormat:@"%@/TestDir",NSHomeDirectory()];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    [self getFolderFilePathByRoot:path AndArray:arr];
    NSLog(@"Fuck");
    [self getFolderFilePathByRoot:path AndArray:arr];
    NSLog(@"fileList:%@",arr);
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)getFolderFilePathByRoot:(NSString *)rPath AndArray:(NSMutableArray *)arr{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:rPath error:&error];
    BOOL isDir = NO;
    
    for (NSString *file in fileList) {
        NSString *path = [rPath stringByAppendingPathComponent:file];
        [fileManager fileExistsAtPath:path isDirectory:(&isDir)];
        if (!isDir) {
            [arr addObject:path];
            isDir = NO;
        }else{
            [self getFolderFilePathByRoot:path AndArray:arr];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
