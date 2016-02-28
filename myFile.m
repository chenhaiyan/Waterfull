//
//  myFile.m
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import "myFile.h"

@implementation myFile
+(myFile *)shareInstance{
    static myFile *instance;
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        instance=[[self alloc] init];
    });
    return instance;
}
/*
 @breif 创建缓存文件夹
 */
- (void)createPathInDocumentDirectory{
    // NSArray *path2=NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *diskCachePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"ImageCache"];
    NSLog(@"%@", diskCachePath);
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:diskCachePath]){
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:diskCachePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&error];
    }
}

/*
 @breif     获取沙盒中文档目录
 @param     fileName:文件名字
 */
- (NSString *)pathInDocumentDirectory:(NSString *)fileName{
    NSArray *fileArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                             NSUserDomainMask, YES);
    NSString *cacheDirectory = [fileArray objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:fileName];
}

/*
 @breif     获取沙盒中缓存文件目录
 @param     fileName:文件名字
 */
- (NSString *)pathInCacheDirectory:(NSString *)fileName{
    NSArray *fileArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                             NSUserDomainMask, YES);
    NSString *cacheDirectory = [fileArray objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:fileName];
}

/*
 @breif     判断是否已经缓存
 @param     url:图片名称
 */
- (BOOL)hasCachedImage:(NSURL *)url{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:[self pathForUrl:url]]){
        return YES;
    }else{
        return NO;
    }
}

/*
 @breif     根据URL的給图片命名
 @param     url:图片url
 */
- (NSString *)pathForUrl:(NSURL *)url{
    return [self pathInCacheDirectory:[NSString stringWithFormat:@"qiaoqiao-%u", [[url description] hash]]];
}

@end
