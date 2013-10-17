Pod::Spec.new do |s|
  s.name         = "LocalizationPOC"
  s.version      = "0.0.1"
  s.summary      = "Localization proof of concept for iOS. Let's you change the language on the fly."
  s.homepage     = "https://github.com/jeroentrappers/LocalizationPOC"
  s.license      = 'MIT'
  s.author       = { "Jeroen Trappers" => "jeroen.trappers@gmail.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/jeroentrappers/LocalizationPOC.git", :commit => "99ec53e67dd5e58b01e0e8f08d12518bb56648eb" }
  s.source_files  = 'LocalizationPOC/LocalizationSystem.{h,m}'
  s.requires_arc = true
end