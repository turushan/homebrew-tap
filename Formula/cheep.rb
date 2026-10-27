class Cheep < Formula
  desc "Safe, unofficial Namecheap CLI with stable JSON for scripts and AI agents"
  homepage "https://cheep.sh"
  url "https://github.com/turushan/cheep/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8510dec62e84e7924d8add39be0ee41f947f617dc2cbc226154ccef2646c7029"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X github.com/turushan/cheep/internal/buildinfo.version=#{version}
      -X github.com/turushan/cheep/internal/buildinfo.commit=7d349e80af5d4f1463cac7aff39646891a847d59
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/cheep"
  end

  test do
    assert_match "cheep #{version}", shell_output("#{bin}/cheep version")
  end
end
