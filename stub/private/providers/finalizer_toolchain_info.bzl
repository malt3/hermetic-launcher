"""Defines providers for a finalizer tool a specific exec platform."""

DOC = """\
Information about a finalizer toolchain that can be used to finalize a template.
"""

FIELDS = dict(
    finalizer = "The finalizer executable (File).",
)

FinalizerToolchainInfo = provider(
    doc = DOC,
    fields = FIELDS,
)
