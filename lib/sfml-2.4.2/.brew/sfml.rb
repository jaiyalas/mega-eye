class Sfml < Formula
  # Don't update SFML until there's a corresponding CSFML release
  desc "Multi-media library with bindings for multiple languages"
  homepage "http://www.sfml-dev.org/"
  url "http://www.sfml-dev.org/files/SFML-2.4.2-sources.zip"
  sha256 "8ba04f6fde6a7b42527d69742c49da2ac529354f71f553409f9f821d618de4b6"
  head "https://github.com/SFML/SFML.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :optional
  depends_on "flac"
  depends_on "freetype"
  depends_on "jpeg"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "openal-soft" => :optional

  # https://github.com/Homebrew/homebrew/issues/40301
  depends_on :macos => :lion

  def install
    args = std_cmake_args
    args << "-DSFML_BUILD_DOC=TRUE" if build.with? "doxygen"

    # Always remove the "extlibs" to avoid install_name_tool failure
    # (https://github.com/Homebrew/homebrew/pull/35279) but leave the
    # headers that were moved there in https://github.com/SFML/SFML/pull/795
    rm_rf Dir["extlibs/*"] - ["extlibs/headers"]

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include "Time.hpp"
      int main() {
        sf::Time t1 = sf::milliseconds(10);
        return 0;
      }
    EOS
    system ENV.cxx, "-I#{include}/SFML/System", "-L#{lib}", "-lsfml-system",
           testpath/"test.cpp", "-o", "test"
    system "./test"
  end
end
