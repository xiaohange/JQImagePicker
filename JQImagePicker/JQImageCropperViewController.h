//
//  JQImageCropperViewController.h
//
//  Created by 韩俊强 on 12/30/13.
//  Copyright (c) 2013 HaRi. All rights reserved.
//  手机加iOS开发者交流群：①群:446310206 ②群:426087546
//

#import <UIKit/UIKit.h>

typedef void(^submitBlock)(UIViewController *viewController , UIImage *image);
typedef void(^cancelBlock)(UIViewController *viewController);

@interface JQImageCropperViewController : UIViewController
@property (nonatomic, copy) submitBlock submitblock;
@property (nonatomic, copy) cancelBlock cancelblock;
@property (nonatomic, assign) CGRect cropFrame;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end
