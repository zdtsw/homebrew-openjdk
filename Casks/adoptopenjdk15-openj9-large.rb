# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk15-openj9-large" do
  version "15.0.2,7"
  sha256 "5d18cd31bdda9271d50045330881e9246d2c417cac07b91981019a26a1a9e47e"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-15.0.2%2B7_openj9-0.24.0/OpenJDK15U-jdk_x64_mac_openj9_macosXL_15.0.2_7_openj9-0.24.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jdk_x64_mac_openj9_macosXL_15.0.2_7_openj9-0.24.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jdk"

  caveats do
    discontinued

    <<~EOS
      Large Heap Casks have now been deprecated. Please use the Normal Heap Casks instead.
      See https://github.com/AdoptOpenJDK/openjdk-build/issues/2426 for more information.
    EOS
  end
end
