Pod::Spec.new do |s|
  s.name          = "SyneriseSDK"
  s.version       = "3.6.23"
  s.summary       = "SyneriseSDK v. 3.6.23"
  s.description   = "iOS library for Synerise omnichannel platform"
  s.homepage      = "https://synerise.com"
  s.license       = { :type => "MIT" }
  s.authors       = "Synerise"
  s.platform      = :ios, "9.0"
  s.source        = { :git => 'https://github.com/Synerise/ios-sdk.git', :tag => s.version.to_s }
  s.exclude_files = [ 'SampleAppSwift/**' ]
  s.frameworks    = 'UIKit', 'Foundation'
  s.vendored_frameworks = 'Pod/SyneriseSDK.framework'
  s.requires_arc        = true
  s.xcconfig            = { "LIBRARY_SEARCH_PATHS" => '"$(PODS_ROOT)/SyneriseSDK"' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
