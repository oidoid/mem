import type { FontMeta } from './src/font-meta.ts'
import mono3x3 from './src/mem-mono-3x3.json' assert { type: 'json' }
import mono4x4 from './src/mem-mono-4x4.json' assert { type: 'json' }
import prop3x5 from './src/mem-prop-3x5.json' assert { type: 'json' }
import prop4x4 from './src/mem-prop-4x4.json' assert { type: 'json' }
import prop5x5 from './src/mem-prop-5x5.json' assert { type: 'json' }
import prop5x6 from './src/mem-prop-5x6.json' assert { type: 'json' }

export * from './src/font-meta.ts'
export const memMono3x3: FontMeta = mono3x3
export const memMono4x4: FontMeta = mono4x4
export const memProp3x5: FontMeta = prop3x5
export const memProp4x4: FontMeta = prop4x4
export const memProp5x5: FontMeta = prop5x5
export const memProp5x6: FontMeta = prop5x6
