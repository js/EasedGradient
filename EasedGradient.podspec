Pod::Spec.new do |s|
  s.name         = "EasedGradient"
  s.version      = "0.1"
  s.summary      = "A tiny library for creating eased gradients"
  s.description  = <<-DESC
    Create eased gradients and avoid Mach Bands with this handy library
  DESC
  s.homepage     = "https://github.com/js/EasedGradient"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Johan Sørensen" => "johan@johansorensen.com" }
  s.social_media_url   = "https://twitter.com/johans"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/js/EasedGradient.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
