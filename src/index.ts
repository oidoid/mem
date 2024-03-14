import mono3x3 from './mem-mono-3x3.json' with {type: 'json'}
import mono4x4 from './mem-mono-4x4.json' with {type: 'json'}
import prop3x5 from './mem-prop-3x5.json' with {type: 'json'}
import prop4x4 from './mem-prop-4x4.json' with {type: 'json'}
import prop5x5 from './mem-prop-5x5.json' with {type: 'json'}
import prop5x6 from './mem-prop-5x6.json' with {type: 'json'}

/** Font metrics and detail metadata. */
export type Font = {
  /**
   * PostScript font name less than 63 characters and does not contain any of
   * `(){}[]<>%/ `. Matches the font filename stem. Eg, "mem-mono-3x3".
   */
  readonly id: string

  /** The human readable font name. Eg, "mem mono 3x3". */
  readonly name: string

  /**
   * The maximum width of any character in the font in pixels. Usually present
   * in font name. For example, the max width of "mem prop 5x6" is five pixels.
   */
  readonly cellWidth: number

  /**
   * The maximum height of any character in the font in pixels, including
   * descenders but not leading. Usually present in font name. For example, the
   * max height of "mem prop 5x6" is six pixels. The line height is
   * `cellHeight + leading` or seven pixels.
   */
  readonly cellHeight: number

  /** Distance between lines in pixels. */
  readonly leading: number

  /** `cellHeight + leading`. */
  readonly lineHeight: number

  /**
   * The font's baseline as measured in pixels from the bottom of the cell
   * (`cellHeight`). When nonzero, this is the space available for descenders.
   */
  readonly baseline: number

  /**
   * Variable distance between characters in pixels. The key is two characters
   * and the value may be negative.
   */
  readonly kerning: {readonly [pair: string]: number}

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
   * `defaultCharWidth` is used.
   */
  readonly charWidth: {readonly [char: string]: number}

  /**
   * Character width in pixels. When a character is not present in `charWidth`,
   * `defaultCharWidth` is used.
   */
  readonly defaultCharWidth: number
}

export const memMono3x3: Font = mono3x3
export const memMono4x4: Font = mono4x4
export const memProp3x5: Font = prop3x5
export const memProp4x4: Font = prop4x4
export const memProp5x5: Font = prop5x5
export const memProp5x6: Font = prop5x6
