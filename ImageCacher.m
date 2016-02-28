//
//  ImageCacher.m
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import "ImageCacher.h"
#import "myFile.h"
#import "ImageLoader.h"
#import "define.h"
@implementation ImageCacher
+ (ImageCacher *)shareInstance{
    static ImageCacher *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init{
    self = [super init];
    if(self){
        self.fileUtil = [myFile shareInstance];
        self.imageLoader = [ImageLoader shareInstance];
    }
    return self;
}

- (void)cacheImage:(NSDictionary*)dic{
    NSURL *url = [dic objectForKey:@"URL"];
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSString *texts=[dic objectForKey:@"Text"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSString *fileName = [_fileUtil pathForUrl:url];
    if(data){
        [fileManage createFileAtPath:fileName contents:data attributes:nil];
    }
    UIImageView *imageView = [dic objectForKey:@"imageView"];
    imageView.image = [UIImage imageWithData:data];
    imageView = [self.imageLoader compressImage:MY_WIDTH/2 imageView:imageView imageName:nil flag:YES];
    [self.myDelegate addImage:imageView name:fileName and:texts];
    [self.myDelegate adjustContentSize:NO];

}

@end
