class Kshield < Formula
  desc "Local-first AI code review firewall"
  homepage "https://github.com/YTT-Global/kshield"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/YTT-Global/kshield/releases/download/v#{version}/kshield-aarch64-apple-darwin.tar.gz"
      sha256 "fe972ddb8b060d14f0c84f4be90b4aa7ef97e9726452921ecd42fdf777fd0224"
    else
      url "https://github.com/YTT-Global/kshield/releases/download/v#{version}/kshield-x86_64-apple-darwin.tar.gz"
      sha256 "b8c50caba7c6150b851986a5aeca98a2e2af6ba40bfd7cdd6c860e659d5e0d2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/YTT-Global/kshield/releases/download/v#{version}/kshield-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8169d751c57ccbdd0658011fe82971bb0b28bebcb08e95d7d5174f61abdc660d"
    else
      url "https://github.com/YTT-Global/kshield/releases/download/v#{version}/kshield-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee587f7a39b6701369fb08fe0d7ae3d14cfa15a2d29e9818dc982763569e9829"
    end
  end

  def install
    bin.install "kshield"
  end

  def caveats
    <<~EOS
      Run this inside any git repo to get started:

        kshield init

      This installs a pre-commit hook and sets up the backend (SQLite, no Docker needed).

      To check status at any time:
        kshield status
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kshield --version")
  end
end
