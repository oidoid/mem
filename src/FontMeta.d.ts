interface FontMeta {
  /**
   * PostScript font name less than 63 characters and does not contain any of
   * `(){}[]<>%/ `.
   */
  readonly id: string

  /** The human readable font name. */
  readonly name: string

  /**
   * The maximum width of any character in the font in pixels. Usually present
   * in font name. For example, the max width of "mem prop 5x6" is five pixels.
   */
  readonly cellWidth: number

  /**
   * The maximum height of any character in the font in pixels, including
   * descenders but not leading, in pixels. Usually present in font name. For
   * example, the max height of "mem prop 5x6" is six pixels. The line height is
   * `cellHeight + leading` or seven pixels.
   */
  readonly cellHeight: number

  /** Distance between lines in pixels. */
  readonly leading: number

  /**
   * The font's baseline as measured in pixels from the bottom of the cel
   * (`cellHeight`). When nonzero, this is the space available for descenders.
   */
  readonly baseline: number

  /** Distance between letters in pixels. */
  readonly kerning: Readonly<Record<string, number>>

  /**
   * Character-to-character kerning pair widths in pixels. When a pair is not
   * present, `endOfLineKerning` is used when the pair matches the regular
   * expression `.$`, `whitespaceKerning` is used when the pair matches the
   * regular expression `.\s`, otherwise `defaultKerning` is used.
   */
  readonly defaultKerning: number

  /**
   * Kerning for when *either* the left or right character is a space or tab.
   */
  readonly whitespaceKerning: number

  /** Kerning for when the right character is a newline. */
  readonly endOfLineKerning: number

  /**
   * Character width in pixels. When a character is not present,
   * `defaultLetterWidth` is used.
   */
  readonly letterWidth: Readonly<Record<string, number>>

  /**
   * Character width in pixels. When a character is not present,
   * `defaultLetterWidth` is used.
   */
  readonly defaultLetterWidth: number
}
