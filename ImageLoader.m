//
//  ImageLoader.m
//  Test515
//
//  Created by silicon on 14-5-15.
//  Copyright (c) 2014年 silicon. All rights reserved.
//

#import "ImageLoader.h"

@interface ImageLoader ()

@end

@implementation ImageLoader

+ (ImageLoader *)shareInstance{
    static ImageLoader *loader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loader = [[ImageLoader alloc] init];
    });
    return loader;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)loadImage:(NSMutableArray *)array{
    self.imagesArray = [NSMutableArray arrayWithObjects:
                  @"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                  @"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg",
                  @"http://img1.bdstatic.com/img/image/8662934349b033b5bb5c55e5d9834d3d539b700bcce.jpg",
                  @"http://imgstatic.baidu.com/img/image/7af40ad162d9f2d3cdc19be8abec8a136227cce1.jpg",
                  @"http://imgstatic.baidu.com/img/image/weimeiyijing0207.jpg",
                  @"http://e.hiphotos.baidu.com/image/w%3D400/sign=2e56c8010ed79123e0e095749d355917/ae51f3deb48f8c5470385d2638292df5e1fe7fd4.jpg",
                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=e37cc47c6509c93d07f20ff7af3cf8bb/7a899e510fb30f2468cc6271ca95d143ad4b0369.jpg",
                  @"http://b.hiphotos.baidu.com/image/w%3D400/sign=ac0b8e2b92ef76c6d0d2fa2bad17fdf6/a71ea8d3fd1f4134dedc5974271f95cad0c85ed4.jpg",
                  @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                  @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                  @"http://f.hiphotos.baidu.com/image/w%3D400/sign=657110132ff5e0feee1888016c6134e5/c83d70cf3bc79f3d6db2fb3ab8a1cd11728b296c.jpg",
                  @"http://g.hiphotos.baidu.com/image/w%3D400/sign=4be7f3c141166d223877149476230945/e850352ac65c10384d5fbac8b0119313b07e8992.jpg",
                  @"http://imgstatic.baidu.com/img/image/meinvbizhi0207.jpg",
                  @"http://h.hiphotos.baidu.com/image/w%3D400/sign=880260efb68f8c54e3d3c42f0a292dee/d0c8a786c9177f3e405a5a0c72cf3bc79f3d5640.jpg",
                  @"http://a.hiphotos.baidu.com/image/w%3D400/sign=55af4af479899e51788e3b1472a7d990/f9198618367adab42ab8824a89d4b31c8701e44b.jpg",
                  @"http://imgstatic.baidu.com/img/image/a50f4bfbfbedab64947d23a7f536afc379311e4d.jpg",
                  @"http://img2.bdstatic.com/img/image/5086f061d950a7b0208c22b6db060d9f2d3562cc885.jpg",
                  @"http://imgstatic.baidu.com/img/image/6a.jpg",
                        nil];
}
/*
 压缩图片，根据图片的大小按比例压缩
 width:每列试图的宽度
 返回一个UIImageView
 */
- (UIImageView *)compressImage:(float)width imageView:(UIImageView *)imgV imageName:(NSString *)name flag:(BOOL) isView{
    if(isView){
        
        if (imgV.image) {
            
            float orgi_width = [imgV image].size.width;
            float orgi_height = [imgV image].size.height;
            
            //按照每列的宽度，以及图片的宽高来按比例压缩
            float new_width = width - 5;
            float new_height = (width * orgi_height)/orgi_width;
            
            //重置imageView的尺寸
            [imgV setFrame:CGRectMake(0, 0, new_width, new_height)];
            
            return imgV;}
        
        else
            return nil;
        
    }else{
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageWithContentsOfFile:name];
        
        float orgi_width = [imageV image].size.width;
        float orgi_height = [imageV image].size.height;
        
        //按照每列的宽度，以及图片的宽高来按比例压缩
        float new_width = width - 5;
        float new_height = (width * orgi_height)/orgi_width;
        
        //重置imageView的尺寸
        [imageV setFrame:CGRectMake(0, 0, new_width, new_height)];
        
        return imageV;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














