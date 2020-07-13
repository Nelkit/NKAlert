Pod::Spec.new do |spec|
  spec.name         = "NKAlert"
  spec.version      = "0.0.5"
  spec.summary      = "UI framework to show message in customs alerts is a alternative to UIAlert of swift."
  spec.description  = <<-DESC
    NKAlert is a small UI framework to show message in custom alerts, is a alternative to native UIAlert of swift.
  DESC

  spec.homepage     = "https://github.com/Nelkit/NKAlert/blob/master/README.md"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Nelkit Chavez" => "nelkitisael792@gmail.com" }
  # Or just: spec.author    = "Nelkit Chavez"
  # spec.authors            = { "Nelkit Chavez" => "nelkitisael792@gmail.com" }
  spec.social_media_url   = "https://twitter.com/nelkitchavez"

  spec.platform     = :ios, "12.0"
  spec.swift_version     = "5.0"
  spec.source       = { :git => "https://github.com/Nelkit/NKAlert.git", :tag => "#{spec.version}" }

  spec.source_files  = "NKAlert/Source/*.{swift}", "NKAlert/Source/Icons/*.{swift}"
  #spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
