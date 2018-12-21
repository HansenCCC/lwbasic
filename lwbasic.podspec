#
#  Be sure to run `pod spec lint lwbasic.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "lwbasic"
  s.version      = "1.0.0"
  s.summary      = "Class expansion"
  s.description  = "A delightful iOS basic framework."
  s.homepage     = "https://github.com/HersonIQ/lwproducts.git"
  #s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  #s.license = "Copyright (c) 2018年 程恒盛. All rights reserved."
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "程恒盛" => "2534550460@qq.com" }
  s.social_media_url   = "https://www.zhihu.com/people/EngCCC/activities"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/HersonIQ/lwproducts.git", :tag => "#{s.version}" }
  s.frameworks = "Foundation","UIKit"
  #s.source_files  = "lwbasic/lwbasic/*"
  s.source_files  =  "lwbasic/*","lwbasic/lwbasic/*.{h,m}","lwbasic/**/*"

  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "lwbasic/lwbasic.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
