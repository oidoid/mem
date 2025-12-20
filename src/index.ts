import mono3x3 from './mem-mono-3x3.json' with {type: 'json'}
import mono4x4 from './mem-mono-4x4.json' with {type: 'json'}
import prop3x5 from './mem-prop-3x5.json' with {type: 'json'}
import prop4x4 from './mem-prop-4x4.json' with {type: 'json'}
import prop5x5 from './mem-prop-5x5.json' with {type: 'json'}
import prop5x6 from './mem-prop-5x6.json' with {type: 'json'}

/** font metrics and detail metadata. */
export type Font = {
  /**
   * PostScript font name less than 63 characters and does not contain
   * `(){}[]<>%/ `. matches the font filename stem. Eg, "mem-mono-3x3".
   */
  id: string

  /** the human readable font name. eg, "mem mono 3x3". */
  name: string

  /**
   * the maximum width of any character in the font in pixels. usually present
   * in font name. eg, the max width of "mem prop 5x6" is five pixels.
   */
  cellW: number

  /**
   * the maximum height of any character in the font in pixels, including
   * descenders but not leading. usually present in font name. eg, the max
   * height of "mem prop 5x6" is six pixels. the line height is
   * `cellH + leading` or seven pixels.
   */
  cellH: number

  /** distance between lines in pixels. */
  leading: number

  /** `cellH + leading`. */
  lineH: number

  /**
   * the font's baseline as measured in pixels from the bottom of the cell
   * (`cellH`). when nonzero, this is the space available for descenders.
   */
  baseline: number

  /**
   * variable distance between characters in pixels. the key is two characters
   * and the value may be negative.
   */
  kerning: {[pair: string]: number}

  /**
   * character-to-character kerning pair widths in pixels. when a pair is not
   * present, `endOfLineKerning` is used when the pair matches the regular
   * expression `.$`, `defaultWhitespaceKerning` is used when the pair matches
   * the regular expression `.\s?|\s?.`, otherwise `defaultKerning` is used.
   */
  defaultKerning: number

  /**
   * default kerning for when *either* the left or right character is a space or
   * tab.
   */
  defaultWhitespaceKerning: number

  /** kerning for when the right character is a newline. */
  endOfLineKerning: number

  /**
   * character width in pixels. When a character is not present, `defaultCharW`
   * is used.
   */
  charW: {[char: string]: number}

  /**
   * character width in pixels. when a character is not present in `charW`,
   * `defaultCharW` is used.
   */
  defaultCharW: number

  /** whether a character descends below the baseline. */
  descends: {[char: string]: boolean}
}

export const memMono3x3: Font = mono3x3
export const memMono4x4: Font = mono4x4
export const memProp3x5: Font = prop3x5
export const memProp4x4: Font = prop4x4
export const memProp5x5: Font = prop5x5
export const memProp5x6: Font = prop5x6
