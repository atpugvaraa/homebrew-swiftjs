class CreateSwiftjsApp < Formula
  desc "Scaffolding tool for swift.js applications"
  homepage "https://github.com/atpugvaraa/create-swiftjs-app"
  url "https://github.com/atpugvaraa/create-swiftjs-app/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "1fe0eb2d22c3707ac73d9c514451cb9012f3ac3a2b57e5b18399cb32f71cbfed"
  license "MIT"

  depends_on "go" => :build

  def install
    # Uses standard Homebrew Go arguments to build the binary and place it in 'bin'
    system "go", "build", *std_go_args(output: bin/"create-swiftjs-app"), "."
  end

  test do
    # Verifies the tool runs and prints usage information
    assert_match "Usage:", shell_output("#{bin}/create-swiftjs-app --help")
  end
end
