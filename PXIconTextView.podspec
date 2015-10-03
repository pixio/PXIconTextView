Pod::Spec.new do |s|
  s.name             = "PXIconTextView"
  s.version          = "0.1.2"
  s.summary          = "Icon on the left, text on the right and it resizes as you type."
  s.description      = <<-DESC
                       A convenient view with an icon, text view, and the ability to scroll to fit the text contents.
                       DESC
  s.homepage         = "https://github.com/pixio/PXIconTextView"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/PXIconTextView.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'UIPlaceholderTextView'
end
