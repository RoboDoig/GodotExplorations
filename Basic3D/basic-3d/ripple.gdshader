// NOTE: Shader automatically converted from Godot Engine 4.5.1.stable.mono's StandardMaterial3D.
shader_type spatial;

uniform float wave_height = 0.2;
uniform sampler2D example_texture : source_color;

void vertex() {
	VERTEX.y += sin(TIME * 5.0 + VERTEX.x * 15.0) * wave_height;
	VERTEX.z += sin(TIME * 5.0 + VERTEX.x * 7.0) * wave_height;
}

void fragment() {
	vec3 color;
	vec2 scrollUV = UV;
	scrollUV.x += TIME * 0.5;
	vec3 texColor = texture(example_texture, scrollUV).rgb;
	color.r = (sin(TIME * 5.0 + VERTEX.x * 10.0) + 1.0) * 0.5 + texColor.r;
	color.g = (sin(TIME * 3.0 + VERTEX.x * 6.0) + 1.0) * 0.5 + texColor.g;
	color.b = (sin(TIME * 2.0 + VERTEX.x * 7.0) + 1.0) * 0.5 + texColor.b;
	
	ALBEDO = color;
}
