Pod::Spec.new do |spec|
  spec.name         = "AOSwiftHelpers"
  spec.version      = "0.0.1"
  spec.summary      = "Swift helpers for you!"
  #spec.description  = ""
  spec.homepage     = "https://github.com/Anonym0uz/AOSwiftHelpers"
  #spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Alexander Orlov" => "kimase1@yandex.ru" }
  #spec.social_media_url   = "https://twitter.com/EXAMPLE"
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/Anonym0uz/AOSwiftHelpers.git", :tag => "0.0.1" }
  spec.source_files  = 'AOSwiftHelpers/**/*.{swift}'
  #spec.resource  = "icon.png"
  #spec.resources = "Resources/*.png"

end
