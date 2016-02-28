//
//  ImageCacher.h
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myFile.h"
#import "ImageLoader.h"
@protocol ImageAddDelegate<NSObject>
- (void)addImage:(UIImageView *)imageView name:(NSString *)imageName and:(NSString*)text;

- (void)adjustContentSize:(BOOL)isEnd;
@end
@interface ImageCacher: NSObject{
    id<ImageAddDelegate> myDelegate;
}
@property (strong, nonatomic) myFile *fileUtil;
@property (strong, nonatomic) ImageLoader *imageLoader;
@property (strong, atomic) id<ImageAddDelegate > myDelegate;
- (void)cacheImage:(NSDictionary*)dic;

+ (ImageCacher *)shareInstance;
@end
