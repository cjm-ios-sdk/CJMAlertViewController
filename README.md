# CJMAlertViewController

[![CI Status](https://img.shields.io/travis/chenjm/CJMAlertViewController.svg?style=flat)](https://travis-ci.org/chenjm/CJMAlertViewController)
[![Version](https://img.shields.io/cocoapods/v/CJMAlertViewController.svg?style=flat)](https://cocoapods.org/pods/CJMAlertViewController)
[![License](https://img.shields.io/cocoapods/l/CJMAlertViewController.svg?style=flat)](https://cocoapods.org/pods/CJMAlertViewController)
[![Platform](https://img.shields.io/cocoapods/p/CJMAlertViewController.svg?style=flat)](https://cocoapods.org/pods/CJMAlertViewController)

由于UIAlertViewController的局限性，使得添加一些视图都比较古怪，为了解决这个问题，从而实现了CJMAlertViewController。

- 目前仅支持 Alert 的方式，不支持 ActionSheet 的方式

- 目前仅支持添加 UILabel，UITextField，UIScrollView， UIView

后续有时间再继续更新。


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


- 初始化

```objc
CJMAlertViewController *vc = [[CJMAlertViewController alloc] init];
// 设置标题
vc.alertTitle = @"新建文件夹";
```

- 添加UILabel

```objc
[vc addLabelWithConfigurationHandler:^(UILabel * _Nonnull label) {
    label.text = @"请输入文件夹名称：";
}];
```

- 添加 UITextField

```objc
[vc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.placeholder = @"名称";
    textField.delegate = self;
}];
```

- 添加 UIScrollView

```objc
[vc addScrollViewWithHeight:50 configurationHandler:^(UIScrollView * _Nonnull scrollView) {
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor redColor];
}];
```

- 添加 UIView

```objc
[vc addViewWithHeight:50 configurationHandler:^(UIView * _Nonnull view) {
    view.backgroundColor = [UIColor redColor];
}];
```

- 添加事件

```objc
CJMAlertAction *cancelAction = [CJMAlertAction actionWithTitle:@"取消" style:0 handler:^(UIAlertAction * _Nonnull action) {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}];

[vc addAction:cancelAction];

CJMAlertAction *sureAction = [CJMAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}];
[vc addAction:sureAction];
```

- 显示视图

```objc
[self.navigationController presentViewController:vc animated:YES completion:^{
    
}];
```




## Requirements

## Installation

CJMAlertViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CJMAlertViewController'
```

## Author

chenjm, cjiemin@163.com

## License

CJMAlertViewController is available under the MIT license. See the LICENSE file for more info.
