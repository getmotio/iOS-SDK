Pod::Spec.new do |s|
  s.name             = "MotioSDK"
  s.version          = "0.0.1"
  s.summary          = "MotioSDK for iOS devices."
  s.homepage         = "http://getmotio.com"
  s.license          = 'MIT'
  s.author           = { "Paul Ballesty" => "hello@getmotio.com" }
  s.source           = { :git => "https://github.com/getmotio/iOS-SDK.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/getmotio'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Resources'

  s.public_header_files = 'Classes/**/*.h'
end
