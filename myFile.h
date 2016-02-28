//
//  myFile.h
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myFile : NSObject
- (void)createPathInDocumentDirectory;

- (NSString *)pathInDocumentDirectory:(NSString *)fileName;

- (NSString *)pathInCacheDirectory:(NSString *)fileName;

- (BOOL)hasCachedImage:(NSURL *)url;

- (NSString *)pathForUrl:(NSURL *)url;

+ (myFile *)shareInstance;

@end
