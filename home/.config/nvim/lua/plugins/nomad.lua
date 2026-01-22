return {
	"nomad/nomad",
	version = "*",
	build = "cargo build --release && cp target/release/libnomad.dylib lua/nomad.so",
	opts = {},
}
