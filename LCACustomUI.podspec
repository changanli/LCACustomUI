#
# Be sure to run `pod lib lint LCACustomUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCACustomUI'
  s.version          = '1.0.2'
  s.summary          = '一些自定义UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 一些常用自定义UI,依赖于LCAExtension
                       DESC

  s.homepage         = 'https://github.com/changanli/LCACustomUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '931985308@qq.com' => 'lichangan' }
  s.source           = { :git => 'https://github.com/changanli/LCACustomUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LCACustomUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LCACustomUI' => ['LCACustomUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'LCAExtension'
end
