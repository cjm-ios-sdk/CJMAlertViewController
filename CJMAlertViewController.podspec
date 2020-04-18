#
# Be sure to run `pod lib lint CJMAlertViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CJMAlertViewController'
  s.version          = '0.1.0'
  s.summary          = '自定义 CJMAlertViewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
由于UIAlertViewController的局限性，使得添加一些视图都比较古怪，为了解决这个问题，从而实现了CJMAlertViewController。
                       DESC

  s.homepage         = 'https://github.com/cjm-ios-sdk/CJMAlertViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenjm' => 'cjiemin@163.com' }
  s.source           = { :git => 'https://github.com/cjm-ios-sdk/CJMAlertViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CJMAlertViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CJMAlertViewController' => ['CJMAlertViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
