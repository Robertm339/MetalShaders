//
//  Shaders.metal
//  ShaderExamples
//
//  Created by Robert Martinez on 10/22/23.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 recolor(float2 position, half4 color) {
    return half4(position.x / position.y, 0, position.y / position.x, color.a);
}

[[ stitchable ]] half4 relativeRecolor(float2 position, half4 color, float2 size) {
    return half4(color.r, color.g, color.b, color.a * (position.y / size.y));
}

[[ stitchable ]] half4 rainbowRecolor(float2 position, half4 color, float2 size) {
    float2 newColor = position / size;
    return half4(newColor.x, newColor.y, 1 - newColor.x, color.a);
}


[[ stitchable ]] half4 interlace(float2 position, half4 color, float2 size, float lineWidth, float strength, half4 lineColor, float offset) {
    position.y += fmod(offset * lineWidth * 2, lineWidth * 2); 
    
    if (fmod(position.y, lineWidth * 2) <= lineWidth) {
        return color;
    } else {
        return mix(color, lineColor, strength) * color.a;
    }
}

[[ stitchable ]] float2 wave(float2 position, float time, float speed, float strength, float smoothing) {
    position.y += sin(time * speed + position.y / smoothing) * strength;
    return  position;
}
