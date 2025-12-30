class Swiftjs < Formula
  desc "SwiftUI on Web Toolchain"
  homepage "https://github.com/atpugvaraa/swift.js"
  url "https://github.com/atpugvaraa/swift.js/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "066284f1f4ee47b5da1a1fea13a44001c2cca9c8bce268bf08f488b18c08a14a"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on "oven-sh/bun/bun"

  # Explicitly depend on the scaffolder from this same tap
  depends_on "atpugvaraa/swiftjs/create-swiftjs-app"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install Dir[".build/**/release/swiftjs"].first
  end

  test do
    # Basic smoke test to ensure the binary executes
    system "#{bin}/swiftjs", "--help"
  end
end
