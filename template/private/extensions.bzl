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
        "sha256": "33437574632aef332e994e9265181796b6b695dfc002a35ac171534daef2d0c5",
    },
    "runfiles-stub-aarch64-linux": {
        "name": "runfiles_stub_aarch64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-aarch64-linux",
        "sha256": "b454ce9e990be145e22a3888efc82bfc6a6c1fb15e01703c75221bc5f878aada",
    },
    "runfiles-stub-aarch64-macos": {
        "name": "runfiles_stub_aarch64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-aarch64-macos",
        "sha256": "b87e7e6e3bdbded19f681b252bcb79f5dc224e9a3337bb547e707375e26b4a69",
    },
    "runfiles-stub-x86_64-linux": {
        "name": "runfiles_stub_x86_64_linux",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-linux",
        "sha256": "a54004c133e44cd9eaff833deec4722a9249f42f52c2b2083ed8c3b44ab99e1d",
    },
    "runfiles-stub-x86_64-macos": {
        "name": "runfiles_stub_x86_64_macos",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-macos",
        "sha256": "7852d05a6fad15ed167db1b03ca7cb06a8d0951c983e02ab35a92feabaad082f",
    },
    "runfiles-stub-x86_64-windows.exe": {
        "name": "runfiles_stub_x86_64_windows",
        "url": "https://github.com/malt3/hermetic-launcher/releases/download/binaries-20251215/runfiles-stub-x86_64-windows.exe",
        "sha256": "f281a03619cc36a9cb89bbf85b0205af29868c4d826836ebc26f52a774ed4611",
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
