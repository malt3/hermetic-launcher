load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

_download_attrs = {
    "finalize-stub-aarch64-linux": {
        "name": "finalize_stub_aarch64_linux",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/finalize-stub-aarch64-linux",
        "sha256": "f359e88589167d1c4ff5b06fe60e18bcc1aa16a21d49f81056b46a2d059c9a64",
    },
    "finalize-stub-aarch64-macos": {
        "name": "finalize_stub_aarch64_macos",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/finalize-stub-aarch64-macos",
        "sha256": "df6140c913d87402d525621142308402b0d9a72ce865e8f8a84bcbefa4973aaa",
    },
    "finalize-stub-x86_64-linux": {
        "name": "finalize_stub_x86_64_linux",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/finalize-stub-x86_64-linux",
        "sha256": "dce220b1ba5a2b44e48070a00e2a260923078bfda1b66f6ee584573ba90562cc",
    },
    "finalize-stub-x86_64-macos": {
        "name": "finalize_stub_x86_64_macos",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/finalize-stub-x86_64-macos",
        "sha256": "376cf75d4333239d912c86ef3e856c5a0939aeb01acaab59afeb9e7d564aae7c",
    },
    "finalize-stub-x86_64-windows.exe": {
        "name": "finalize_stub_x86_64_windows",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/finalize-stub-x86_64-windows.exe",
        "sha256": "839c4056cf59224418f66bfcf1f02ab7a12b045962c4235fe7a3a17d234bce64",
    },
    "runfiles-stub-aarch64-linux": {
        "name": "runfiles_stub_aarch64_linux",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/runfiles-stub-aarch64-linux",
        "sha256": "b454ce9e990be145e22a3888efc82bfc6a6c1fb15e01703c75221bc5f878aada",
    },
    "runfiles-stub-aarch64-macos": {
        "name": "runfiles_stub_aarch64_macos",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/runfiles-stub-aarch64-macos",
        "sha256": "bf61f68df91872d4b4e96f996cd5b4cfb92c6f18683db08d7948a9cafe3b0bf7",
    },
    "runfiles-stub-x86_64-linux": {
        "name": "runfiles_stub_x86_64_linux",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/runfiles-stub-x86_64-linux",
        "sha256": "a54004c133e44cd9eaff833deec4722a9249f42f52c2b2083ed8c3b44ab99e1d",
    },
    "runfiles-stub-x86_64-macos": {
        "name": "runfiles_stub_x86_64_macos",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/runfiles-stub-x86_64-macos",
        "sha256": "2d8779fb12543948d51a180e49fa363fd0a6a6c62dd375d5533f0cc7d9a0ba07",
    },
    "runfiles-stub-x86_64-windows.exe": {
        "name": "runfiles_stub_x86_64_windows",
        "url": "https://github.com/malt3/runfiles-stub/releases/download/v0.1.20251212/runfiles-stub-x86_64-windows.exe",
        "sha256": "b3f2e55b1fd03facb9c0795102d70826330666ae46f49344152caef86fd2cc0c",
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
