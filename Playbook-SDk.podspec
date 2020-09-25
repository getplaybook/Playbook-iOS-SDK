Pod::Spec.new do |s|
	s.name         = "PlaybookSDK"
	s.version      = "1.0"
	s.summary      = "PlaybookSDK"
	s.description  = "Playbook SDK for iOS application."
	s.homepage     = "https://getplaybook.io"
	s.documentation_url = 'https://doc.getplaybook.io'
	s.license      = "Commercial"
	s.authors      = { "Emre Efendioğlu" => "emre@unicrow.com" }
	s.platform     = :ios, "10.3"
	s.source = { :git => "https://github.com/getplaybook/Playbook-iOS-SDK.git", :tag => "v#{s.version}" }
	s.ios.vendored_frameworks = 'PlaybookSDK.framework'
	s.ios.frameworks = ["UIKit", "Foundation", "AVFoundation", "AudioToolbox"]
	s.requires_arc = true
end
