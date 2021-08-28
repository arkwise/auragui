OUTPUT_FORMAT("elf32-i386")

FORCE_COMMON_ALLOCATION

SECTIONS {
  .text : {
	*(.text)
	*(.data)
	*(.rodata*)
	*(.bss)
	*(COMMON)
  }
}
