Pod::Spec.new do |s|
  s.name             = 'Bluuur'
  s.version          = '0.2.2'
  s.summary          = 'Native dynamic-radius live blur for iOS'

  s.description      = <<-DESC
                       This UIVisualEffectsView subclass allows to dynamically adjust
                       blur radius by changing property blurProgress from 0.0 to 1.0.
                       DESC

  s.homepage         = 'https://github.com/ML-Works/Bluuur'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anton Bukov' => 'k06a@mlworks.com' }
  s.source           = { :git => 'https://github.com/ML-Works/Bluuur.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/k06a'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Bluuur/Classes/**/*'
end
