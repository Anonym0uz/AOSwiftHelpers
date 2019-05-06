Pod::Spec.new do |spec|
  spec.name         = "AOSwiftHelpers"
  spec.version      = "0.0.2"
  spec.summary      = "Swift helpers for you!"
  spec.homepage     = "https://github.com/Anonym0uz/AOSwiftHelpers"
  spec.license      = "MIT"
  spec.author       = { "Alexander Orlov" => "kimase1@yandex.ru" }
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  spec.source       = { :git => "https://github.com/Anonym0uz/AOSwiftHelpers.git", :tag => spec.version.to_s }
  spec.source_files = "AOSwiftHelpers", "AOSwiftHelpers/**/*.{h,m,swift}"

end
