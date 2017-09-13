//
//  JQImagePicker.h
//
//  Created by 韩俊强 on 16/7/6.
//  Copyright © 2016年 HaRi. All rights reserved.
//  手机加iOS开发者交流群：①群:446310206 ②群:426087546
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ImagePickerType){
    ImagePickerCamera = 0,
    ImagePickerPhoto = 1
};
@class JQImagePicker;
@protocol JQImagePickerDelegate <NSObject>

- (void)imagePicker:(JQImagePicker *)imagePicker didFinished:(UIImage *)editedImage;
- (void)imagePickerDidCancel:(JQImagePicker *)imagePicker;
@end
@interface JQImagePicker : NSObject
+ (instancetype) sharedInstance;
//delegate
@property (nonatomic, assign) id<JQImagePickerDelegate> delegate;
//choose original image
- (void)showOriginalImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController;
//Custom cut. Cutting box's scale(height/Width) 0~1.5 default is 1
- (void)showImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController Scale:(double)scale;
@end
