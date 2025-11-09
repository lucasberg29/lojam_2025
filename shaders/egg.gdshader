shader_type canvas_item;
uniform vec4 glow_color = vec4(1.0, 1.0, 1.0, 1.0); 
uniform float min_glow_size = 1;
uniform float max_glow_size = 5;
uniform float glow_speed = 2.0;

void fragment() {
	    float glow_size = mix(min_glow_size, max_glow_size, (sin(TIME * glow_speed) * 0.5) + 0.5);
    vec4 tex = texture(TEXTURE, UV);

    vec4 glow = vec4(0.0);

    vec2 tex_size = vec2(textureSize(TEXTURE, 0));
    vec2 pixel_size = 1.0 /tex_size;

    glow += texture(TEXTURE, UV + vec2(glow_size * pixel_size.x, 0.0));
    glow += texture(TEXTURE, UV + vec2(-glow_size * pixel_size.x, 0.0));
    glow += texture(TEXTURE, UV + vec2(0.0, glow_size * pixel_size.y));
    glow += texture(TEXTURE, UV + vec2(0.0, -glow_size * pixel_size.y));

    glow = glow_color * glow.a * (1.0 - tex.a);

    COLOR = tex + glow;
}
