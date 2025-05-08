Shader "Custom/GaussianBlur2D"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _BlurSize ("Blur Size", Float) = 1.0
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        LOD 100

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            Cull Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _MainTex;
            float4 _MainTex_TexelSize;
            float _BlurSize;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float gaussianWeight(float x, float sigma)
            {
                return exp(- (x * x) / (2.0 * sigma * sigma));
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 texelSize = _MainTex_TexelSize.xy * _BlurSize;
                float sigma = 2.0;

                fixed4 color = fixed4(0,0,0,0);
                float weightSum = 0.0;

                // Sample 9 times horizontally and vertically
                for (int x = -4; x <= 4; x++)
                {
                    for (int y = -4; y <= 4; y++)
                    {
                        float weight = gaussianWeight(x, sigma) * gaussianWeight(y, sigma);
                        color += tex2D(_MainTex, uv + float2(x, y) * texelSize) * weight;
                        weightSum += weight;
                    }
                }

                return color / weightSum;
            }
            ENDCG
        }
    }
}
