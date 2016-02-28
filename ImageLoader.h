//
//  ImageLoader.h
//  textAndImage
//
//  Created by 123 on 16/2/27.
//  Copyright (c) 2016年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLoader : UIViewController
+ (ImageLoader *) shareInstance;

- (void)loadImage:(NSMutableArray *)array;

- (UIImageView *)compressImage:(float)width imageView:(UIImageView *)imgV imageName:(NSString *)name flag:(BOOL) isView;

@property(strong, nonatomic) NSMutableArray *imagesArray;

@end
