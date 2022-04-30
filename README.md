# chess.v

a tui chess game that would have multiplayer

## roadmap

* self-hostable servers
* exporting your game in PGN
* a basic AI opponent

## compiling

the game is written in V, which allows writing cross-platform code easily

for compiling it, you will need:

* `msvc` (windows) or `clang` (*nix-based)
* the V compiler
* `make`

if you intend to just play the game:

```sh
make prod-win
# or
make prod-nix
```

if you are developing:

```sh
git fetch
make test-win
# or
make test-nix
```