Pod::Spec.new do |s|
  s.name             = 'Bluuur'
  s.version          = '0.3.0'
  s.summary          = 'Native dynamic-radius live blur for iOS'

  s.description      = <<-DESC
                       This UIVisualEffectsView subclass allows to
                       dynamically adjust blur radius and other values
                       by changing a lot of properties.
                       DESC

  s.homepage         = 'https://github.com/ML-Works/Bluuur'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anton Bukov' => 'k06a@mlworks.com' }
  s.social_media_url = 'https://twitter.com/k06a'

  s.source           = { :git => 'https://github.com/ML-Works/Bluuur.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'Bluuur/Classes/**/*'
end
