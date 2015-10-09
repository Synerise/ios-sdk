Pod::Spec.new do |s|
  s.name             = "SyneriseSDK"
  s.version          = "1.2.5"
  s.summary          = "iOS library for Synerise omnichannel platform."
  s.homepage         = "http://synerise.com"
  s.author           = { "Synerise" => "developer@synerise.com" }
  s.license          = 'MIT'
  s.source           = { :git => "https://github.com/Synerise/ios-sdk.git", :tag => s.version.to_s }
  s.source_files     =  'SyneriseSDK/SyneriseSDK.framework/Versions/A/Headers/*.h'
  s.vendored_frameworks = 'SyneriseSDK/SyneriseSDK.framework'
  s.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration', 'MobileCoreServices', 'CoreLocation', 'CoreBluetooth'
  s.social_media_url = 'https://twitter.com/synerise'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/SyneriseSDK"',
  'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Headers/SyneriseSDK"' }
  #s.resource_bundles = {
  #    'SyneriseSDK' => ['Pod/Assets/*.png']
  #  }
  # s.dependency 'AFNetworking', '~> 2.3'
end
