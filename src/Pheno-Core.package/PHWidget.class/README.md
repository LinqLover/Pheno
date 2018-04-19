## Colors

Colors are managed via PHColorScheme. A PHColorScheme is a triple of foreground, background and border color. To influence the colors your PHWidget subclass gets you can either set a PHColorScheme directly (colorScheme:) or override colorMode and return one of the valid color modes as listed in `PHColorScheme class>>type:mode:` to modify the default color palettes. If you want to receive the same colorScheme as your parent, simply set `colorScheme: #inherit`.

## Layouting

Widgets are typically laid out with PHBoxLayouts, which use a height-for-width geometry model.

###Notes:
* Padding works as with the CSS setting `box-sizing: border-box`, meaning specifying a `padding` of `10` and a `maxSize` of `100 asPoint` will get you sizes of `100 asPoint` and not `110 asPoint`.