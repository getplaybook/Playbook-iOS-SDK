Pod::Spec.new do |s|
	s.name         = "PlaybookSDK"
	s.version      = "1.5.6"
	s.summary      = "PlaybookSDK"
	s.description  = "Playbook SDK for iOS application."
	s.homepage     = "https://getplaybook.io"
	s.documentation_url = 'https://doc.getplaybook.io'
	s.license      = "Commercial"
	s.authors      = { "Emre Efendioğlu" => "emre@unicrow.com" }
	s.source = { :git => "https://github.com/getplaybook/Playbook-iOS-SDK.git", :tag => "#{s.version}" }
	s.public_header_files = "PlaybookSDK.framework/Headers/*.h"
    s.source_files = "PlaybookSDK.framework/Headers/*.h"
	s.ios.vendored_frameworks = 'PlaybookSDK.framework'
	s.ios.frameworks = ["UIKit", "Foundation", "AVFoundation", "AudioToolbox"]
	s.requires_arc = true
	s.platform     = :ios, "10.3"
	s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
	s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end