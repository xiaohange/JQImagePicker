//
//  ViewController.m
//  JQImagePickerDemo
//
//  Created by 韩俊强 on 2017/9/13.
//  Copyright © 2017年 HaRi. All rights reserved.
//  手机加iOS开发者交流群：①群:446310206 ②群:426087546
//

#import "ViewController.h"
#import "UIImage+GCAdd.h"
#import "JQImagePicker.h"

double scale = 9.0/16.0; // 经典16:9裁剪

@interface ViewController ()<JQImagePickerDelegate>

@property (nonatomic, assign) BOOL customCut;
@property (weak, nonatomic) IBOutlet UIImageView *currentImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstrint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstrint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 系统裁剪
- (IBAction)systemCutAction:(id)sender
{
    _customCut = NO;
    [self createAlertViewController:NO];
}

// 自定义裁剪
- (IBAction)customCutAction:(id)sender
{
    _customCut = YES;
    [self createAlertViewController:YES];
}

// 选择照片方式
- (void)createAlertViewController:(BOOL)cut
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"请选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (cut) { // 自定义裁剪
            JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showImagePickerWithType:ImagePickerCamera InViewController:self Scale:scale];
        } else {// 普通裁剪
            JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showOriginalImagePickerWithType:ImagePickerCamera InViewController:self];
        }
    }];
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (cut) {
            JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showImagePickerWithType:ImagePickerPhoto InViewController:self Scale:scale];
        } else {
            JQImagePicker *imagePicker = [JQImagePicker sharedInstance];
            imagePicker.delegate = self;
            [imagePicker showOriginalImagePickerWithType:ImagePickerPhoto InViewController:self];
        }
        
    }];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:closeAction];
    [alertVC addAction:libraryAction];
    [alertVC addAction:photoAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - JQImagePicker Delegate

- (void)imagePickerDidCancel:(JQImagePicker *)imagePicker
{
    NSLog(@"取消");
}

- (void)imagePicker:(JQImagePicker *)imagePicker didFinished:(UIImage *)editedImage
{
    NSLog(@"%@",editedImage);
    if (_customCut) {
        UIImage * customImage = [editedImage imageByResizeToSize:CGSizeMake(400*(16.0/9),400)];
        self.widthConstrint.constant = 400*scale;
        self.heightConstrint.constant = 200*scale;
        self.currentImageView.image = customImage;
    } else {
        self.widthConstrint.constant = 200;
        self.heightConstrint.constant = 200;
        self.currentImageView.image = editedImage;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
