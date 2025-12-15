load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

_download_attrs = {
    "finalize-stub-aarch64-linux": {
        "name": "finalize_stub_aarch64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/finalize-stub-aarch64-linux",
        "sha256": "f359e88589167d1c4ff5b06fe60e18bcc1aa16a21d49f81056b46a2d059c9a64",
    },
    "finalize-stub-aarch64-macos": {
        "name": "finalize_stub_aarch64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/finalize-stub-aarch64-macos",
        "sha256": "af3533ddc9c5ab3460d7b0521d409cbbf8cc8c519bb6ff3d9d3207af7262700f",
    },
    "finalize-stub-x86_64-linux": {
        "name": "finalize_stub_x86_64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/finalize-stub-x86_64-linux",
        "sha256": "dce220b1ba5a2b44e48070a00e2a260923078bfda1b66f6ee584573ba90562cc",
    },
    "finalize-stub-x86_64-macos": {
        "name": "finalize_stub_x86_64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/finalize-stub-x86_64-macos",
        "sha256": "7763aa4f3b8da89428f83d9aed7b94c52dd4288890e7dabc59c0535747fa3ba4",
    },
    "finalize-stub-x86_64-windows.exe": {
        "name": "finalize_stub_x86_64_windows",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/finalize-stub-x86_64-windows.exe",
        "sha256": "20a7abb234d3e13ded1a502d12438efc67080780513db472def405c9dfb33810",
    },
    "runfiles-stub-aarch64-linux": {
        "name": "runfiles_stub_aarch64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-aarch64-linux",
        "sha256": "b1f13fe63b74a7f82bd0c0eaa9f2c03a2cc60fece0fd274f516e4b054a929bdb",
    },
    "runfiles-stub-aarch64-macos": {
        "name": "runfiles_stub_aarch64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-aarch64-macos",
        "sha256": "1457caa4aba493e5d2b79d5dc030d416e7224c67dea2ba25a2f36c8a87e4db12",
    },
    "runfiles-stub-x86_64-linux": {
        "name": "runfiles_stub_x86_64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-linux",
        "sha256": "701c118ca2b5f614b02b6bc9ffa0d91f0a09452176151f795f3bda3441426cd9",
    },
    "runfiles-stub-x86_64-macos": {
        "name": "runfiles_stub_x86_64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-macos",
        "sha256": "18f5718255630b14da29e719df2421572f563e752095d20783a3afc9cddd0179",
    },
    "runfiles-stub-x86_64-windows.exe": {
        "name": "runfiles_stub_x86_64_windows",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-windows.exe",
        "sha256": "30c3fbe6985d1b79f363957b26b72c41d3e035b8fa2561d4a2181c00549e705a",
    },
}

def _non_module_dependencies_impl(ctx):
    for filename, attrs in _download_attrs.items():
        http_file(
            name = attrs["name"],
            url = attrs["url"],
            sha256 = attrs["sha256"],
            downloaded_file_path = filename,
            executable = True,
        )
    return ctx.extension_metadata(
        root_module_direct_deps = "all",
        root_module_direct_dev_deps = [],
        reproducible = True,
    )


non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)
