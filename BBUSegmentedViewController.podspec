Pod::Spec.new do |s|
  s.name             = "BBUSegmentedViewController"
  s.version          = "0.1.0"
  s.summary          = "Switch between child view-controllers using a segmented control at the top."
  s.homepage         = "https://github.com/neonichu/BBUSegmentedViewController"
  s.screenshots      = "https://raw.githubusercontent.com/neonichu/BBUSegmentedViewController/master/animated.gif"
  s.license          = 'MIT'
  s.author           = { "Boris Buegling" => "boris@buegling.com" }
  s.source           = { :git => "https://github.com/neonichu/BBUSegmentedViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/NeoNacho'

  s.ios.deployment_target = '7.0'

  s.requires_arc = true
  s.source_files = '*.m'
  s.public_header_files = 'BBUSegmentedViewController.h'
end
