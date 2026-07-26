shader_type canvas_item;

uniform float scale_x : hint_range(0.0, 3.0) = 1.2;
uniform bool is_dying = false;
uniform float death_progress : hint_range(0.0, 1.0) = 0.0;

void vertex() {
    //if (is_dying) {
        //// squash effect while dying
        //VERTEX.x *= mix(1.0, 0.2, death_progress);
        //VERTEX.y *= mix(1.0, 0.0, death_progress);
    //} else {
        //VERTEX.x *= scale_x;
    //}
}

void fragment() {
	
    //if (is_dying) {
        //// fade out
        //COLOR.a *= 1.1 - death_progress;
    //}
}
