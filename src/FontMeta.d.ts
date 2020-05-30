interface FontMeta {
  /** The human readable font name. */
  name: string

  /**
   * The maximum width of any character in the font in pixels. Usually present
   * in font name. For example, the max width of "mem prop 5x6" is five pixels.
   */
  cel_width: number

  /**
   * The maximum height of any character in the font in pixels, including
   * descenders but not leading, in pixels. Usually present in font name. For
   * example, the max height of "mem prop 5x6" is six pixels. The line height is
   * `cel_height` + `leading` or seven pixels.
   */
  cel_height: number

  /** Distance between lines in pixels. */
  leading: number

  /** Distance between letters in pixels. */
  kerning: Record<string, number>

  /**
   * Character-to-character kerning pair widths in pixels. When a pair is not
   * present, `end_of_line_kerning` is used when the pair matches the regular
   * expression `.$`, `whitespace_kerning` is used when the pair matches the
   * regular expression `.\s`, otherwise `default_kerning` is used.
   */
  default_kerning: number

  whitespace_kerning: number

  end_of_line_kerning: number

  /**
   * Character width in pixels. When a character is not present,
   * `default_letter_width` is used.
   */
  letter_width: Record<string, number>

  /**
   * Character width in pixels. When a character is not present,
   * `default_letter_width` is used.
   */
  default_letter_width: number
}
