Pod::Spec.new do |s|
  s.name         = 'LocalizationPOC'
  s.version      = '0.0.1'
  s.license      = 'Apache License, Version 2.0'
  s.summary      = 'Localization proof of concept for iOS, allows you to change the language on the fly.'
  s.homepage     = 'https://github.com/jeroentrappers/LocalizationPOC'
  s.author       = { 'Jeroen Trappers' => 'jeroen.trappers@gmail.com' }
  s.source       = { :git => 'https://github.com/rudensm/LocalizationPOC.git' }
  s.source_files = 'LocalizationPOC/LocalizationSystem.{h,m}'
  s.platform     = :ios
end
