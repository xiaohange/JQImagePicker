# JQImagePicker
前言
===
iOS照片自定义裁剪, 自定义宽高比裁剪, 经典16:9等裁剪方式,代码调用简单精炼.
##### 1.自定义裁剪

![自定义裁剪](https://github.com/xiaohange/JQImagePicker/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE1.gif?raw=true)

##### 2.系统自带裁剪
![系统自带裁剪](https://github.com/xiaohange/JQImagePicker/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE2.gif?raw=true)

## 更新记录

- 0.0.1 
发布第一版本 0.0.1

## Installation

 - 1.Drag all source files under floder `JQImagePicker ` to your project.
 
 - 2.pod: `JQImagePicker `

## Usage

```
#import "JQImagePicker.h"
```
##### 1.系统自带裁剪

```
// 拍照
 JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showOriginalImagePickerWithType:ImagePickerCamera InViewController:self];
```

```
// 相册
JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showOriginalImagePickerWithType:ImagePickerPhoto InViewController:self];
```
##### 2.自定义裁剪
```
// 拍照
 JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showImagePickerWithType:ImagePickerCamera InViewController:self Scale:scale];
```
```
// 相册
JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showImagePickerWithType:ImagePickerPhoto InViewController:self Scale:scale];
```

##### 3.JQImagePickerDelegate
```
- (void)imagePickerDidCancel:(JQImagePicker *)imagePicker
{
    NSLog(@"取消");
}

- (void)imagePicker:(JQImagePicker *)imagePicker didFinished:(UIImage *)editedImage
{
    NSLog(@"裁剪后:%@",editedImage);
}
```
## Star

[CSDN博客](http://blog.csdn.net/qq_31810357)    

手机加iOS开发者交流群：①群:446310206 ②群:426087546 喜欢就❤️❤️❤️star一下吧！ 

Love is every every every star! Your support is my renewed motivation!

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).