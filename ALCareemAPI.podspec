
Pod::Spec.new do |s|
    
    s.authors      = { '' => '' }
    s.license      = { :type => '.' }
    s.homepage     = '.'
    s.source       = { :git => '', :tag => '0.0.1' }
    s.summary      = '.'
    
    s.name                  = "ALCareemAPI"
    s.platform              = :ios
    s.ios.deployment_target = '9.2'
    s.requires_arc          = true
    s.source_files          = "Source/**/*.{swift}"
    s.version               = '0.0.1'
    
    s.dependency 'ALExtensions'
    s.dependency 'ALFunctions'
    s.dependency 'ALKeychain'
    s.dependency 'ALLogger'
    s.dependency 'ALWebAPI'
    s.dependency 'Bolts-Swift'
    s.dependency 'PhoneNumberKit'
    s.dependency 'Genome'
    
end
