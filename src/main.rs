// Platform-specific implementations
// Linux uses raw syscalls, macOS uses libc

#![no_std]
#![no_main]

#[cfg(target_os = "linux")]
#[path = "linux.rs"]
mod platform;

#[cfg(target_os = "macos")]
#[path = "macos.rs"]
mod platform;
