Pod::Spec.new do |s|
s.name         = "JQImagePicker"
s.version      = "0.0.4"
s.summary      = "IOS photos custom cut, custom width ratio cut, code calls simple refining."
s.homepage     = "https://github.com/xiaohange/JQImagePicker"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "韩俊强" => "532167805@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/xiaohange/JQImagePicker.git", :tag => s.version.to_s }
s.source_files  = "JQImagePicker/**/*.{h,m}"
s.public_header_files = "JQImagePicker/**/*.h"
s.requires_arc = true
end
