Shader "Deformer"
{
    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
        [Gamma] _Metallic("Metallic", Range(0, 1)) = 0
        _Glossiness("Smoothness", Range(0, 1)) = 0.5
        _Deform("Deform", Range(0, 1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            Tags { "LightMode"="Deferred" }
            Cull Off
            CGPROGRAM
            #pragma target 5.0
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
            #pragma multi_compile_prepassfinal noshadowmask nodynlightmap nodirlightmap nolightmap
            #include "Deformer.hlsl"
            ENDCG
        }
        Pass
        {
            Tags { "LightMode"="ShadowCaster" }
            Cull Off
            CGPROGRAM
            #pragma target 5.0
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
            #pragma multi_compile_prepassfinal noshadowmask nodynlightmap nodirlightmap nolightmap
            #ifndef UNITY_PASS_SHADOWCASTER
            #define UNITY_PASS_SHADOWCASTER
            #endif
            #include "Deformer.hlsl"
            ENDCG
        }
    }
}
