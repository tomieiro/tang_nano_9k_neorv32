# Tang Nano 9K NEORV32

Projeto mínimo para sintetizar e gravar um SoC NEORV32 na Tang Nano 9K.

## Conteúdo

- `src/`: VHDL do SoC, top-level da Tang Nano 9K, constraints e timing.
- `bootloader/`: bootloader customizado usado para upload pela UART.
- `sdk/sw/`: SDK com bibliotecas NEORV32 e ferramentas de geração de imagem.
- `tang_nano_9k.gprj`: projeto Gowin.
- `neorv32.cfg`: configuração para debug/JTAG.

## Síntese

Abra `tang_nano_9k.gprj` no Gowin EDA e rode:

```text
Synthesis -> Place & Route -> Bitstream
```

O bitstream gerado fica em `impl/pnr/`.

Também é possível chamar o Gowin por CLI:

```sh
make build
```

Esse alvo executa:

```sh
gw_sh build.tcl
```

O Makefile força `QT_QPA_PLATFORM=minimal` para evitar erro do plugin `xcb`. Se necessário, troque:

```sh
make build QT_QPA_PLATFORM=xcb
```

Alvos do Makefile:
- `build`: sintetiza, place & route e gera bitstream (`impl/pnr/`)
- `flash`: grava o bitstream no FPGA com openFPGALoader
- `clean`: remove arquivos compilados

## SDK

O projeto inclui um SDK completo em `sdk/sw/` com:

```sh
sdk/sw/common/      # Inicialização NEORV32 (CRT0, linker script)
sdk/sw/image_gen/   # Ferramentas de geração de imagem
sdk/sw/lib/         # Bibliotecas NEORV32 (headers e source)
```

## Gravação

Exemplo com `openFPGALoader`:

```sh
make flash
```

O alvo usa:

```sh
openFPGALoader -b tangnano9k impl/pnr/tang_nano_9k.fs
```

## Limpeza

```sh
make clean
```
