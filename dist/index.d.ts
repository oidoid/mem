/** font metrics and detail metadata. */
export type Font = {
    /**
     * PostScript font name less than 63 characters and does not contain
     * `(){}[]<>%/ `. matches the font filename stem. Eg, "mem-mono-3x3".
     */
    id: string;
    /** the human readable font name. eg, "mem mono 3x3". */
    name: string;
    /**
     * the maximum width of any character in the font in pixels. usually present
     * in font name. eg, the max width of "mem prop 5x6" is five pixels.
     */
    cellWidth: number;
    /**
     * the maximum height of any character in the font in pixels, including
     * descenders but not leading. usually present in font name. eg, the max
     * height of "mem prop 5x6" is six pixels. the line height is
     * `cellHeight + leading` or seven pixels.
     */
    cellHeight: number;
    /** distance between lines in pixels. */
    leading: number;
    /** `cellHeight + leading`. */
    lineHeight: number;
    /**
     * the font's baseline as measured in pixels from the bottom of the cell
     * (`cellHeight`). when nonzero, this is the space available for descenders.
     */
    baseline: number;
    /**
     * variable distance between characters in pixels. the key is two characters
     * and the value may be negative.
     */
    kerning: {
        [pair: string]: number;
    };
    /**
     * character-to-character kerning pair widths in pixels. when a pair is not
     * present, `endOfLineKerning` is used when the pair matches the regular
     * expression `.$`, `defaultWhitespaceKerning` is used when the pair matches
     * the regular expression `.\s?|\s?.`, otherwise `defaultKerning` is used.
     */
    defaultKerning: number;
    /**
     * default kerning for when *either* the left or right character is a space or
     * tab.
     */
    defaultWhitespaceKerning: number;
    /** kerning for when the right character is a newline. */
    endOfLineKerning: number;
    /**
     * character width in pixels. When a character is not present,
     * `defaultCharWidth` is used.
     */
    charWidth: {
        [char: string]: number;
    };
    /**
     * character width in pixels. when a character is not present in `charWidth`,
     * `defaultCharWidth` is used.
     */
    defaultCharWidth: number;
};
export declare const memMono3x3: Font;
export declare const memMono4x4: Font;
export declare const memProp3x5: Font;
export declare const memProp4x4: Font;
export declare const memProp5x5: Font;
export declare const memProp5x6: Font;
