#
# Be sure to run `pod lib lint OO.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OO'
  s.version          = '0.1.2'
  s.swift_version    = '4.2'
  s.summary          = 'Boilerplate helper, extensions and many more to kickstart iOS apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OO, which means Operation Override was designed to help me develop iOS apps faster with helper functions, extensions, etc. 
                       DESC

  s.homepage         = 'https://github.com/premieredesign/OO'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'premieredesign' => 'iamcmj@icloud.com' }
  s.source           = { :git => 'https://github.com/premieredesign/OO.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'OO/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OO' => ['OO/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
