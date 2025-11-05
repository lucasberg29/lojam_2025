shader_type canvas_item;
uniform vec4 glow_color = vec4(3.0, 3.0, 2.9, 1.0); 
uniform float glow_size = 3;

void fragment() {
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
