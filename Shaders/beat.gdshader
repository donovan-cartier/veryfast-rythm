shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform bool enabled = true;
uniform float white_level = 1;

void fragment() {
	if (enabled){
		COLOR.rgb = textureLod(screen_texture, SCREEN_UV, 0.0).rgb * white_level;
	} else {
    	COLOR = textureLod(screen_texture, SCREEN_UV, 0.0);
	}
}
