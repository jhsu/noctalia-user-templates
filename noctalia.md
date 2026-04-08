# Template Syntax

Templates use the syntax {{colors.name.mode.format}}:

name: The color name (e.g., primary, surface, on_surface)
mode: default, dark, or light. Use default to follow the system theme.
format: Output format (see below)

# Available Colors

Noctalia generates a complete 48-color Material Design 3 palette:

Primary Colors (8)
Color Name	Description
primary	Main accent color
on_primary	Text/icons on primary
primary_container	Container using primary
on_primary_container	Text/icons on primary container
primary_fixed	Fixed primary (consistent across modes)
primary_fixed_dim	Dimmed fixed primary
on_primary_fixed	Text on fixed primary
on_primary_fixed_variant	Variant text on fixed primary
Secondary Colors (8)
Color Name	Description
secondary	Secondary accent color
on_secondary	Text/icons on secondary
secondary_container	Container using secondary
on_secondary_container	Text/icons on secondary container
secondary_fixed	Fixed secondary
secondary_fixed_dim	Dimmed fixed secondary
on_secondary_fixed	Text on fixed secondary
on_secondary_fixed_variant	Variant text on fixed secondary
Tertiary Colors (8)
Color Name	Description
tertiary	Tertiary accent color
on_tertiary	Text/icons on tertiary
tertiary_container	Container using tertiary
on_tertiary_container	Text/icons on tertiary container
tertiary_fixed	Fixed tertiary
tertiary_fixed_dim	Dimmed fixed tertiary
on_tertiary_fixed	Text on fixed tertiary
on_tertiary_fixed_variant	Variant text on fixed tertiary
Error Colors (4)
Color Name	Description
error	Error/warning color
on_error	Text/icons on error
error_container	Container for errors
on_error_container	Text/icons on error container
Surface Colors (11)
Color Name	Description
surface	Main background
on_surface	Primary text color
surface_variant	Alternative surface
on_surface_variant	Text on surface variant
surface_dim	Dimmed surface
surface_bright	Bright surface
surface_container_lowest	Lowest elevation container
surface_container_low	Low elevation container
surface_container	Standard container
surface_container_high	High elevation container
surface_container_highest	Highest elevation container
Outline & Utility Colors (4)
Color Name	Description
outline	Border/divider color
outline_variant	Subtle outline variant
shadow	Shadow color
scrim	Overlay/scrim color
Inverse Colors (3)
Color Name	Description
inverse_surface	Inverted surface
inverse_on_surface	Text on inverse surface
inverse_primary	Inverted primary
Background Colors (2)
Color Name	Description
background	Background (alias for surface)
on_background	Text on background

## Filters

Modify colors using filters with the | syntax:

accent = {{colors.primary.default.hex | lighten 10}}
overlay = {{colors.surface.default.hex | set_alpha 0.8}}
muted = {{colors.error.default.hex | grayscale}}

### Chain multiple filters:

highlight = {{colors.primary.default.hex | lighten 10 | set_alpha 0.9}}

## Color Filters

Filter	Argument	Description
grayscale	none	Convert to grayscale
invert	none	Invert the color
lighten	percentage (0-100)	Increase lightness
darken	percentage (0-100)	Decrease lightness
saturate	percentage (0-100)	Increase saturation
desaturate	percentage (0-100)	Decrease saturation
set_alpha	float (0.0-1.0)	Set alpha/opacity
set_lightness	percentage (0-100)	Set absolute lightness
set_saturation	percentage (0-100)	Set absolute saturation
set_hue	degrees (0-360)	Set absolute hue
set_red	value (0-255)	Set red channel
set_green	value (0-255)	Set green channel
set_blue	value (0-255)	Set blue channel
auto_lightness	percentage	Lighten if dark, darken if light
blend	"#hex", amount	Blend hue toward target color
harmonize	"#hex"	M3 harmonize (max 15° hue shift)
