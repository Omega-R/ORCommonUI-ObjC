#
# Be sure to run `pod lib lint ORCommonUI-ObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ORCommonUI-ObjC'
  s.version          = '1.0.0'
  s.summary          = 'ORCommonUI-ObjC - UI extensions, custom views, controllers.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "UIView+Extended, UIView+Mask, ORTopAlignedLabel, UIScrollView+DisableDelaysContentTouches, UIImage+ImageWithAlpha, etc."

  s.homepage         = 'https://bitbucket.org/omegarinc/orcommonui-objc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxim Soloviev' => 'mswok85@gmail.com' }
  s.source           = { :git => 'https://bitbucket.org/omegarinc/orcommonui-objc.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ORCommonUI-ObjC/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ORCommonUI-ObjC' => ['ORCommonUI-ObjC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
