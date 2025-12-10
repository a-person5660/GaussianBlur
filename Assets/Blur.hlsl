#ifndef BLUR_INCLUDE
#define BLUR_INCLUDE

TEXTURE2D_X(_BlitTexture);

void Blur_float(float2 uv, float2 dir, out float4 color)
{
    const float weight[5] = { 0.061360, 0.244770, 0.387740, 0.244770, 0.06136 };
    color = float4(0, 0, 0, 0);
    for (int i = -2; i <= 2; i++)
    {
        uint2 pixelCoords = uint2(uv * _ScreenSize.xy + dir * i);
        color += LOAD_TEXTURE2D_X_LOD(_BlitTexture, pixelCoords, 0) * weight[i + 2];
    }
}

#endif //BLUR_INCLUDE
