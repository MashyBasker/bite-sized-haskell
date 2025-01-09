# Define the GHC compiler and flags
GHC = ghc
GHCFLAGS = -Wall
BUILD_DIR = build

# Specify the source file, which will be passed as an argument
SRC = $(word 2, $(MAKECMDGOALS))

# Define the output path for the executable, without the .hs extension
OUTPUT = $(BUILD_DIR)/$(basename $(SRC))

# Define the name of the object and interface files
OBJ = $(BUILD_DIR)/$(basename $(SRC)).o
HI = $(BUILD_DIR)/$(basename $(SRC)).hi

# Rule to compile the Haskell program
$(OUTPUT): $(SRC) $(OBJ) $(HI)
	# Create the build directory if it doesn't exist
	@mkdir -p $(BUILD_DIR)
	$(GHC) $(GHCFLAGS) -o $(OUTPUT) -outputdir $(BUILD_DIR) $(SRC)

# Rule to generate the object and interface files
$(OBJ) $(HI): $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(GHC) $(GHCFLAGS) -c -outputdir $(BUILD_DIR) $(SRC)

# Rule to run the program from the build directory
run: $(OUTPUT)
	$(BUILD_DIR)/$(basename $(SRC))

# Clean rule to remove generated files in the build directory
clean:
	rm -rf $(BUILD_DIR)

# Prevent make from interpreting files with .o or .hi extension as targets
.PHONY: clean run
