#
# Be sure to run `pod lib lint TutorialScrollViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TutorialScrollViewController"
  s.version          = "0.1.0"
  s.summary          = "A subclass of UIScrollViewController, which helps set up a working scrolling start-up tutorial view quickly"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  Whenever we make an app, it is really likely for us to include several tutorial views when app is first launched. Normally, these view are contained in a scrollViewController with paging enable. I believe most of you know how to achieve this from scratch, but it takes time. So this framework is aimed to minimize the work you need to do to set up a sound and working tutorial viewController
                       DESC

  s.homepage         = "https://github.com/lichenglu/TutorialScrollViewController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Chenglu Li" => "kabelee92@gmail.com" }
  s.source           = { :git => "https://github.com/lichenglu/TutorialScrollViewController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TutorialScrollViewController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
