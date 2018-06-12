Pod::Spec.new do |s|

  s.name         = "Xcode9to10Preparation"
  s.version      = "0.0.1"
  s.summary      = "Provides functions from Xcode 10 in Xcode 9"

  s.description  = <<-DESC
                   If you found some interesting functions (allSatisfy) in Xcode 10 you can use them right now in Xcode 9 with this library
                   DESC

  s.homepage     = "https://github.com/RomanPodymov/Xcode9to10Preparation"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "RomanPodymov" => "podymfrombryansk@yandex.ru" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  # s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/RomanPodymov/Xcode9to10Preparation.git", :tag => s.version.to_s }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.swift_version = '4.2'

end
