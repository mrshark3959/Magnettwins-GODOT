shader_type canvas_item;

void fragment() {
    vec3 grey_color = vec3(0.5, 0.5, 0.5); // RGB values for grey
    COLOR = vec4(grey_color, texture(TEXTURE, UV).a); // Maintain original alpha
}
