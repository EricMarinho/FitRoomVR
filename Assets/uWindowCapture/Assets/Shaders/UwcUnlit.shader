Shader "uWindowCapture/Unlit"
{
    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("Texture", 2D) = "white" {}
        [Enum(UnityEngine.Rendering.CullMode)] _Cull("Culling", Int) = 2
        [Toggle(UWC_FLIP_X)] _FlipX("Flip X", Int) = 0
        [Toggle(UWC_FLIP_Y)] _FlipY("Flip Y", Int) = 0
    }

    SubShader
    {
        Tags 
        { 
            "RenderType" = "Opaque" 
            "Queue" = "Geometry"
            "PreviewType" = "Plane"
        }

        LOD 100

        Pass
        {
            Cull [_Cull]

            CGPROGRAM
            #pragma target 3.0
            #include "./UwcCommon.cginc"
            #pragma vertex vert
            #pragma exclude_renderers gles xbox360 ps3
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile ___ UWC_FLIP_X
            #pragma multi_compile ___ UWC_FLIP_Y
            ENDCG
        }
    }

    // Add separate passes for each eye in VR
    SubShader
    {
        Tags 
        { 
            "RenderType" = "Opaque" 
            "Queue" = "Overlay"
            "PreviewType" = "Plane"
            "StereoEyeIndex" = "0" // Left eye
        }

        LOD 100

        Pass
        {
            Cull [_Cull]

            CGPROGRAM
            #pragma target 3.0
            #include "./UwcCommon.cginc"
            #pragma vertex vert
            #pragma exclude_renderers gles xbox360 ps3
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile ___ UWC_FLIP_X
            #pragma multi_compile ___ UWC_FLIP_Y
            ENDCG
        }
    }

    SubShader
    {
        Tags 
        { 
            "RenderType" = "Opaque" 
            "Queue" = "Overlay"
            "PreviewType" = "Plane"
            "StereoEyeIndex" = "1" // Right eye
        }

        LOD 100

        Pass
        {
            Cull [_Cull]

            CGPROGRAM
            #pragma target 3.0
            #include "./UwcCommon.cginc"
            #pragma vertex vert
            #pragma exclude_renderers gles xbox360 ps3
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile ___ UWC_FLIP_X
            #pragma multi_compile ___ UWC_FLIP_Y
            ENDCG
        }
    }

    Fallback "Unlit/Texture"
}