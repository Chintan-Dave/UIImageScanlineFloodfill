
Pod::Spec.new do |s|
  s.name         = "UIImageScanlineFloodfill"
  
  s.version      = "1.0.1"
  
  s.summary      = "This is an Objective-C implementation of Scanline Flood Fill Algorithm."
  
  s.description  = "http://ilearnios.wordpress.com/2013/07/18/scanline-flood-fill-algorithm-with-or-without-tolerance-in-objective-c/"
  
  s.homepage     = "https://github.com/Chintan-Dave/UIImageScanlineFloodfill"
  
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author       = { "Chintan R Dave" => "chintan@zealousweb.com" }
  
  s.source       = { :git => "https://github.com/Chintan-Dave/UIImageScanlineFloodfill.git", :tag => "1.0.1" }

  s.platform     = :ios, '5.0'

  s.source_files = 'Source Code', 'Source Code/*.{h,m}'

  s.frameworks   = 'QuartzCore', 'CoreGraphics'
  
  s.requires_arc = true
end
