SRC_DIR = ./src
OUT_DIR = ./build
OBJ_DIR = ./build/obj
BIN_DIR = ./build/bin
DOC_DIR = ./build/doc

SRC_FILES = $(wildcard $(SRC_DIR)/*.c) 
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

.DEFAULT_GOAL := all

clean: $(OUT_DIR)
	@echo Borro los binarios
	@rm -r $(OUT_DIR)

all: $(OBJ_FILES)
	@echo Enlazando el binario final
	@mkdir -p $(BIN_DIR)
	@gcc $(OBJ_FILES) -o $(BIN_DIR)/app.out

doc:
	@mkdir -p $(DOC_DIR)
	@doxygen

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo Estoy compilando $< 
	@mkdir -p $(OBJ_DIR)
	@gcc -o $@ -c $< 