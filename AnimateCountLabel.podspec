#
# Be sure to run `pod lib lint AnimateCountLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnimateCountLabel'
  s.version          = '1.0.1'
  s.summary          = 'A short description of AnimateCountLabel.'

  s.homepage         = 'https://github.com/JKshared92/AnimateCountLabel'
  #s.screenshots      = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'comma' => '506702341@qq.com' }
  s.source           = { :git => 'https://github.com/JKshared92/AnimateCountLabel.git', :tag => '1.0.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AnimateCountLabel/Classes/**/*'

end
