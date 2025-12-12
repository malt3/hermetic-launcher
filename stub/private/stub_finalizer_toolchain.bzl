"""Implementation of the stub_finalizer_toolchain rule."""

load("//stub/private/providers:finalizer_toolchain_info.bzl", "FinalizerToolchainInfo")

DOC = """\
Defines an image builder toolchain.

The image build tool can natively target any platform,
so it only has exec platform constraints.

See https://bazel.build/extending/toolchains#defining-toolchains.
"""

ATTRS = dict(
    finalizer = attr.label(
        doc = "A finalizer executable.",
        allow_single_file = True,
    ),
)

TOOLCHAIN_TYPE = str(Label("//stub:finalizer_toolchain_type"))

def _stub_finalizer_toolchain_impl(ctx):
    stub_finalizer_toolchain_info = FinalizerToolchainInfo(
        finalizer = ctx.file.finalizer,
    )
    toolchain_info = platform_common.ToolchainInfo(
        finalizer_info = stub_finalizer_toolchain_info,
    )

    return [toolchain_info]

stub_finalizer_toolchain = rule(
    implementation = _stub_finalizer_toolchain_impl,
    attrs = ATTRS,
    doc = DOC,
)
