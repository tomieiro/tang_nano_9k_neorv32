# Tang Nano 9K NEORV32

Projeto mínimo para sintetizar e gravar um SoC NEORV32 na Tang Nano 9K.

## Conteúdo

- `src/`: VHDL do SoC, top-level da Tang Nano 9K, constraints e timing.
- `bootloader/`: bootloader customizado usado para upload pela UART.
- `tang_nano_9k.gprj`: projeto Gowin.
- `neorv32.cfg`: configuração para debug/JTAG.

## Síntese

Abra `tang_nano_9k.gprj` no Gowin EDA e rode:

```text
Synthesis -> Place & Route -> Bitstream
```

O bitstream gerado fica em `impl/pnr/`.

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
