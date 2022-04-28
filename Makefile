VFLAGS := -skip-unused
PRODFLAGS := $(VFLAGS) -prod
OUT := -o chess

test-win:
	v $(VFLAGS) $(OUT).exe .

prod-win:
	v $(PRODFLAGS) $(OUT).exe -cc msvc .

test-nix:
	v $(VFLAGS) $(OUT) .

prod-nix:
	v $(PRODFLAGS) $(OUT) -cc clang .