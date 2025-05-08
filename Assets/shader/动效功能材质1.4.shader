// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Effect1/动效功能材质1.4"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("开启双面", Float) = 2
		[Enum(Off,0,On,1)]_ZWrite("深度模式", Float) = 0
		[Enum(AddItive,1,AlphaBlend,10)]_Dst1("叠加模式", Float) = 10
		[HDR]_Main2Color("第二层贴图颜色", Color) = (1,1,1,1)
		[HDR]_MainColor("第一层贴图颜色", Color) = (1,1,1,1)
		_MainTex("第一层贴图", 2D) = "white" {}
		[Toggle]_MainTex2RGB("贴图通道选择", Float) = 0
		[Toggle]_MainTexRGB("贴图通道选择", Float) = 0
		_MaintexPower("第一层贴图对比度", Float) = 1
		_MainTexRotator("第一层贴图旋转", Float) = 0
		_MainTexU1("第一层贴图流动U", Float) = 0
		_MainTexV1("第一层贴图流动V", Float) = 0
		[Toggle(_USEPOLARMAINTEX_ON)] _UsePolarMainTex("开启极坐标", Float) = 0
		[Toggle(_USEPARTICLECUSTOM_ON)] _UseParticleCustom("使用粒子自定义属性XY", Float) = 0
		[Header(Ramp)][Toggle(_USEMAINTEX2_ON)] _UseMainTex2("开启第二层贴图", Float) = 0
		_MainTex2("第二层贴图", 2D) = "white" {}
		_MainTex2Power("第二层贴图对比度", Float) = 1
		_MainTex2Rotator("第二层贴图旋转", Float) = 0
		_MainTex2SpeedU("第二层贴图流动U", Float) = 0
		_MainTex2SpeedV("第二层贴图流动V", Float) = 0
		[Toggle(_USEMASK01_ON)] _UseMask01("开启第一层遮罩", Float) = 0
		_Mask1("遮罩第一层", 2D) = "white" {}
		[Toggle]_Mask1RGB("贴图通道选择", Float) = 1
		_DisturbanceTex2Rotator1("遮罩旋转", Float) = 0
		_DisturbanceMaskRotator("遮罩旋转", Float) = 0
		_DisturbanceTex1Rotator("遮罩旋转", Float) = 0
		_MaskRotator1("遮罩旋转", Float) = 0
		_Mask1Power("遮罩第一层对比度", Float) = 1
		_MaskSpeedU1("遮罩流动速度U", Float) = 0
		_MaskSpeedV1("遮罩流动速度V", Float) = 0
		[Toggle(_USEPOLARMASK1_ON)] _UsePolarMask1("开启极坐标", Float) = 0
		[Toggle]_UseMaskParticleCustom("使用粒子自定义属性ZW", Float) = 0
		[Toggle]_UseMask1And2("开启第二层遮罩", Float) = 0
		[Toggle]_UseVertexOffsetMask("开启顶点动画遮罩", Float) = 0
		_Mask2("遮罩第二层", 2D) = "white" {}
		_VertexOffsetMask("顶点动画遮罩", 2D) = "white" {}
		[Toggle]_Mask2RGB("贴图通道选择", Float) = 1
		[Toggle]_VertexOffsetRGB("贴图通道选择", Float) = 0
		_MaskRotator2("遮罩旋转", Float) = 0
		_VertexOffsetRotator("顶点动画遮罩旋转", Float) = 0
		_Mask2SpeedU("遮罩流动速度U", Float) = 0
		_Mask2SpeedV("遮罩流动速度V", Float) = 0
		[Header(RaoDong)][Toggle(_USEDISTURBANCE_ON)] _UseDisturbance("开启扰动效果", Float) = 0
		_DisturbanceTex1("扰动贴图第一层", 2D) = "white" {}
		[Toggle]_DisturbanceTex1RGB("使用透明图", Float) = 0
		_DisturbanceScaleU("扰动强度U", Range( -1 , 1)) = 0.9118451
		_DisturbanceScaleV("扰动强度V", Range( -1 , 1)) = 0
		_DisturbanceTex1U("扰动流动1_U", Float) = 0
		_DisturbanceTex1V("扰动流动1_V", Float) = 0
		[Toggle]_UseDisturbance1And2("开启第二层扰动", Float) = 0
		[Toggle]_UseDisturbanceADD("使用ADD模式", Float) = 0
		[Toggle]_UseDisturbanceMask("开启扰动遮罩", Float) = 0
		_DisturbanceMask("扰动贴图遮罩", 2D) = "white" {}
		_DisturbanceTex2("扰动贴图第二层", 2D) = "white" {}
		[Toggle]_DisturbanceMaskRGB("使用透明图", Float) = 0
		[Toggle]_DisturbanceTex2RGB("使用透明图", Float) = 0
		_DisturbanceTex2U("扰动流动2_U", Float) = 0
		_DisturbanceMaskU("扰动流动_U", Float) = 0
		_DisturbanceTex2V("扰动流动2_V", Float) = 0
		_DisturbanceMaskV("扰动流动_V", Float) = 0
		[Header(Dissolve)][Toggle(_USEDISSOLVE2_ON)] _UseDissolve2("开启贴图溶解", Float) = 0
		_DissolveTex1("溶解贴图", 2D) = "white" {}
		[Toggle]_DissolveTex1RGB("贴图通道选择", Float) = 1
		_DissolveRotator("溶解遮罩旋转", Float) = 0
		_DissolveTex_U("溶解贴图流动_U", Float) = 0
		_DissolveTex_V("溶解贴图流动_V", Float) = 0
		_DissolveIntensityCustom1z1("溶解强度", Range( 0 , 1)) = 0
		_SoftaDissolve1("软硬边强度", Range( 0 , 1)) = 1
		_DissolveWidth("溶解沟边宽度", Range( 0 , 1)) = 0.1
		[HDR]_DissolveWidthColor("溶解沟边颜色", Color) = (0,0,0,0)
		[Toggle(_USEPARTICLEDISSOLVE_ON)] _UseParticleDissolve("开启使用粒子自定义2(X)", Float) = 0
		[Toggle(_USEDISSOLVEMASK_ON)] _UseDissolveMask("开启溶解贴图遮罩", Float) = 0
		_DissolveMask("溶解贴图遮罩(开启上方按钮才起作用)", 2D) = "white" {}
		[Toggle]_DissolveMaskRGB("贴图通道选择", Float) = 1
		[Toggle]_DissolveMaskADD("使用Add模式", Float) = 0
		_DissolveMaskRotator("溶解遮罩旋转", Float) = 0
		_DissolveMaskTexU("溶解遮罩贴图流动_U", Float) = 0
		_DissolveMaskTexV("溶解遮罩贴图流动_V", Float) = 0
		[Header(Vertex Offser)]_VertexOffsetAxial("顶点动画轴向XYZ", Vector) = (0,0,0,0)
		_VertexOffsetScale("顶点动画强度", Float) = 0
		_VertexOffsetTillingU("噪波图TillingU", Float) = 1
		_VertexOffsetTillingV("噪波图TillingV", Float) = 1
		_VertexOffsetSpeedU("噪波图流动U", Float) = 0
		_VertexOffsetSpeedV("噪波图流动V", Float) = 0
		[HideInInspector]_DissolveTex1_ST("DissolveTex1", Vector) = (1,1,0,0)
		[HideInInspector]_MainTex_ST("MainTex_ST", Vector) = (1,1,0,0)
		[HideInInspector]_Mask1_ST("Mask1_ST", Vector) = (1,1,0,0)
		[HideInInspector]_MainTex2_ST("MainTex2_ST", Vector) = (1,1,0,0)
		[HideInInspector]_DissolveMask_ST("DissolveMask_ST", Vector) = (1,1,0,0)
		[Toggle(_USEDEPTH_ON)] _UseDepth("开启软粒子", Float) = 0
		[Toggle(_USEVERTEXOFFSET_ON)] _UseVertexOffset("开启顶点动画", Float) = 0
		_DepthFade1("软粒子强度", Float) = 0.1
		_AlphaScale("Alpha", Float) = 1
		[Toggle]_UsePolarDissolveMask("开启溶解遮罩极坐标", Float) = 0
		[Toggle]_UsePolarDissolve1("开启溶解极贴图坐标", Float) = 0
		[Toggle]_sePolarDissolveMask1("Float 6", Float) = 0
		_TexBlendValue("混合值", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[Enum(Multiply,0,Add,1,Blend,2)]_UseTexBlend("贴图混合模式", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		_VertexOffsetMaskScale("遮罩强度", Range( 0 , 1)) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_CullMode]
		ZWrite [_ZWrite]
		Blend SrcAlpha [_Dst1]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _USEVERTEXOFFSET_ON
		#pragma shader_feature_local _USEDISSOLVE2_ON
		#pragma shader_feature_local _USEMAINTEX2_ON
		#pragma shader_feature_local _USEDISTURBANCE_ON
		#pragma shader_feature_local _USEPOLARMAINTEX_ON
		#pragma shader_feature_local _USEPARTICLECUSTOM_ON
		#pragma shader_feature_local _USEDISSOLVEMASK_ON
		#pragma shader_feature_local _USEPARTICLEDISSOLVE_ON
		#pragma shader_feature_local _USEMASK01_ON
		#pragma shader_feature_local _USEPOLARMASK1_ON
		#pragma shader_feature_local _USEDEPTH_ON
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 uv2_texcoord2;
			float4 screenPos;
		};

		uniform float _ZWrite;
		uniform float _CullMode;
		uniform float _Dst1;
		uniform float _VertexOffsetTillingU;
		uniform float _VertexOffsetTillingV;
		uniform float _VertexOffsetSpeedU;
		uniform float _VertexOffsetSpeedV;
		uniform float _VertexOffsetScale;
		uniform float3 _VertexOffsetAxial;
		uniform sampler2D _VertexOffsetMask;
		uniform float4 _VertexOffsetMask_ST;
		uniform float _VertexOffsetRotator;
		uniform float _VertexOffsetRGB;
		uniform float _VertexOffsetMaskScale;
		uniform float _UseVertexOffsetMask;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _MainTexRotator;
		uniform float _DisturbanceScaleU;
		uniform float _DisturbanceScaleV;
		uniform sampler2D _DisturbanceTex1;
		uniform float _DisturbanceTex1U;
		uniform float _DisturbanceTex1V;
		uniform float4 _DisturbanceTex1_ST;
		uniform float _DisturbanceTex1Rotator;
		uniform float _DisturbanceTex1RGB;
		uniform sampler2D _DisturbanceTex2;
		uniform float _DisturbanceTex2U;
		uniform float _DisturbanceTex2V;
		uniform float4 _DisturbanceTex2_ST;
		uniform float _DisturbanceTex2Rotator1;
		uniform float _DisturbanceTex2RGB;
		uniform float _UseDisturbanceADD;
		uniform float _UseDisturbance1And2;
		uniform sampler2D _DisturbanceMask;
		uniform float _DisturbanceMaskU;
		uniform float _DisturbanceMaskV;
		uniform float4 _DisturbanceMask_ST;
		uniform float _DisturbanceMaskRotator;
		uniform float _DisturbanceMaskRGB;
		uniform float _UseDisturbanceMask;
		uniform float _MainTexU1;
		uniform float _MainTexV1;
		uniform float _MaintexPower;
		uniform float4 _MainColor;
		uniform sampler2D _MainTex2;
		uniform float _MainTex2SpeedU;
		uniform float _MainTex2SpeedV;
		uniform float4 _MainTex2_ST;
		uniform float _sePolarDissolveMask1;
		uniform float _MainTex2Rotator;
		uniform float _MainTex2RGB;
		uniform float4 _Main2Color;
		uniform float _MainTex2Power;
		uniform float _UseTexBlend;
		uniform float _TexBlendValue;
		uniform float _SoftaDissolve1;
		uniform sampler2D _DissolveTex1;
		uniform float _DissolveTex_U;
		uniform float _DissolveTex_V;
		uniform float4 _DissolveTex1_ST;
		uniform float _UsePolarDissolve1;
		uniform float _DissolveRotator;
		uniform float _DissolveTex1RGB;
		uniform sampler2D _DissolveMask;
		uniform float _DissolveMaskTexU;
		uniform float _DissolveMaskTexV;
		uniform float4 _DissolveMask_ST;
		uniform float _UsePolarDissolveMask;
		uniform float _DissolveMaskRotator;
		uniform float _DissolveMaskRGB;
		uniform float _DissolveMaskADD;
		uniform float _DissolveIntensityCustom1z1;
		uniform float _DissolveWidth;
		uniform float4 _DissolveWidthColor;
		uniform float _MainTexRGB;
		uniform sampler2D _Mask1;
		uniform float4 _Mask1_ST;
		uniform float _MaskRotator1;
		uniform float _MaskSpeedU1;
		uniform float _MaskSpeedV1;
		uniform float _UseMaskParticleCustom;
		uniform float _Mask1RGB;
		uniform float _Mask1Power;
		uniform sampler2D _Mask2;
		uniform float _Mask2SpeedU;
		uniform float _Mask2SpeedV;
		uniform float4 _Mask2_ST;
		uniform float _MaskRotator2;
		uniform float _Mask2RGB;
		uniform float _UseMask1And2;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _DepthFade1;
		uniform float _AlphaScale;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 temp_cast_0 = (0.0).xxx;
			float2 appendResult400 = (float2(_VertexOffsetTillingU , _VertexOffsetTillingV));
			float2 appendResult386 = (float2(_VertexOffsetSpeedU , _VertexOffsetSpeedV));
			float2 uvs_TexCoord389 = v.texcoord;
			uvs_TexCoord389.xy = v.texcoord.xy * appendResult400 + ( _Time.y * appendResult386 );
			float simplePerlin2D391 = snoise( uvs_TexCoord389.xy );
			simplePerlin2D391 = simplePerlin2D391*0.5 + 0.5;
			float3 ase_vertexNormal = v.normal.xyz;
			float3 temp_output_399_0 = ( ( (-1.0 + (simplePerlin2D391 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) * _VertexOffsetScale ) * ( ase_vertexNormal * _VertexOffsetAxial ) );
			float4 uvs_VertexOffsetMask = v.texcoord;
			uvs_VertexOffsetMask.xy = v.texcoord.xy * _VertexOffsetMask_ST.xy + _VertexOffsetMask_ST.zw;
			float cos418 = cos( ( ( ( _VertexOffsetRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin418 = sin( ( ( ( _VertexOffsetRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator418 = mul( uvs_VertexOffsetMask.xy - float2( 0.5,0.5 ) , float2x2( cos418 , -sin418 , sin418 , cos418 )) + float2( 0.5,0.5 );
			float4 tex2DNode421 = tex2Dlod( _VertexOffsetMask, float4( rotator418, 0, 0.0) );
			float lerpResult411 = lerp( tex2DNode421.r , tex2DNode421.a , _VertexOffsetRGB);
			float lerpResult504 = lerp( 1.0 , lerpResult411 , _VertexOffsetMaskScale);
			float3 lerpResult426 = lerp( temp_output_399_0 , ( temp_output_399_0 * lerpResult504 ) , _UseVertexOffsetMask);
			#ifdef _USEVERTEXOFFSET_ON
				float3 staticSwitch407 = lerpResult426;
			#else
				float3 staticSwitch407 = temp_cast_0;
			#endif
			float3 VerTexOffset404 = staticSwitch407;
			v.vertex.xyz += VerTexOffset404;
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 uvs_MainTex = i.uv_texcoord;
			uvs_MainTex.xy = i.uv_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 CenteredUV15_g47 = ( i.uv_texcoord.xy - float2( 0.5,0.5 ) );
			float2 break17_g47 = CenteredUV15_g47;
			float2 appendResult23_g47 = (float2(( length( CenteredUV15_g47 ) * 1.0 * 2.0 ) , ( atan2( break17_g47.x , break17_g47.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 appendResult284 = (float2(_MainTex_ST.x , _MainTex_ST.y));
			float2 appendResult285 = (float2(_MainTex_ST.z , _MainTex_ST.w));
			#ifdef _USEPOLARMAINTEX_ON
				float2 staticSwitch168 = (appendResult23_g47*appendResult284 + appendResult285);
			#else
				float2 staticSwitch168 = uvs_MainTex.xy;
			#endif
			float cos12 = cos( ( ( ( _MainTexRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin12 = sin( ( ( ( _MainTexRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator12 = mul( staticSwitch168 - float2( 0.5,0.5 ) , float2x2( cos12 , -sin12 , sin12 , cos12 )) + float2( 0.5,0.5 );
			float2 appendResult280 = (float2(_DisturbanceScaleU , _DisturbanceScaleV));
			float2 appendResult62 = (float2(_DisturbanceTex1U , _DisturbanceTex1V));
			float4 uvs_DisturbanceTex1 = i.uv_texcoord;
			uvs_DisturbanceTex1.xy = i.uv_texcoord.xy * _DisturbanceTex1_ST.xy + _DisturbanceTex1_ST.zw;
			float2 panner58 = ( 1.0 * _Time.y * appendResult62 + uvs_DisturbanceTex1.xy);
			float cos373 = cos( ( ( ( _DisturbanceTex1Rotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin373 = sin( ( ( ( _DisturbanceTex1Rotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator373 = mul( panner58 - float2( 0.5,0.5 ) , float2x2( cos373 , -sin373 , sin373 , cos373 )) + float2( 0.5,0.5 );
			float4 tex2DNode55 = tex2D( _DisturbanceTex1, rotator373 );
			float lerpResult318 = lerp( tex2DNode55.r , tex2DNode55.a , _DisturbanceTex1RGB);
			float2 appendResult74 = (float2(_DisturbanceTex2U , _DisturbanceTex2V));
			float4 uvs_DisturbanceTex2 = i.uv_texcoord;
			uvs_DisturbanceTex2.xy = i.uv_texcoord.xy * _DisturbanceTex2_ST.xy + _DisturbanceTex2_ST.zw;
			float2 panner75 = ( 1.0 * _Time.y * appendResult74 + uvs_DisturbanceTex2.xy);
			float cos374 = cos( ( ( ( _DisturbanceTex2Rotator1 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin374 = sin( ( ( ( _DisturbanceTex2Rotator1 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator374 = mul( panner75 - float2( 0.5,0.5 ) , float2x2( cos374 , -sin374 , sin374 , cos374 )) + float2( 0.5,0.5 );
			float4 tex2DNode77 = tex2D( _DisturbanceTex2, rotator374 );
			float lerpResult320 = lerp( tex2DNode77.r , tex2DNode77.a , _DisturbanceTex2RGB);
			float lerpResult496 = lerp( ( lerpResult318 * lerpResult320 ) , ( lerpResult318 + lerpResult320 ) , _UseDisturbanceADD);
			float lerpResult311 = lerp( lerpResult318 , lerpResult496 , _UseDisturbance1And2);
			float2 temp_output_278_0 = ( appendResult280 * lerpResult311 );
			float2 appendResult483 = (float2(_DisturbanceMaskU , _DisturbanceMaskV));
			float4 uvs_DisturbanceMask = i.uv_texcoord;
			uvs_DisturbanceMask.xy = i.uv_texcoord.xy * _DisturbanceMask_ST.xy + _DisturbanceMask_ST.zw;
			float2 panner487 = ( 1.0 * _Time.y * appendResult483 + uvs_DisturbanceMask.xy);
			float cos488 = cos( ( ( ( _DisturbanceMaskRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin488 = sin( ( ( ( _DisturbanceMaskRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator488 = mul( panner487 - float2( 0.5,0.5 ) , float2x2( cos488 , -sin488 , sin488 , cos488 )) + float2( 0.5,0.5 );
			float4 tex2DNode491 = tex2D( _DisturbanceMask, rotator488 );
			float lerpResult490 = lerp( tex2DNode491.r , tex2DNode491.a , _DisturbanceMaskRGB);
			float2 lerpResult492 = lerp( temp_output_278_0 , ( temp_output_278_0 * lerpResult490 ) , _UseDisturbanceMask);
			float2 raodong67 = lerpResult492;
			#ifdef _USEDISTURBANCE_ON
				float2 staticSwitch140 = ( rotator12 + raodong67 );
			#else
				float2 staticSwitch140 = rotator12;
			#endif
			float2 appendResult7 = (float2(_MainTexU1 , _MainTexV1));
			float2 appendResult265 = (float2(i.uv_texcoord.z , i.uv_texcoord.w));
			#ifdef _USEPARTICLECUSTOM_ON
				float2 staticSwitch263 = appendResult265;
			#else
				float2 staticSwitch263 = ( _Time.y * appendResult7 );
			#endif
			float4 tex2DNode1 = tex2D( _MainTex, ( staticSwitch140 + staticSwitch263 ) );
			float4 temp_cast_0 = (_MaintexPower).xxxx;
			float4 temp_output_86_0 = ( pow( tex2DNode1 , temp_cast_0 ) * _MainColor * float4( (i.vertexColor).rgb , 0.0 ) * _MainColor.a );
			float3 temp_cast_2 = (1.0).xxx;
			float2 appendResult80 = (float2(_MainTex2SpeedU , _MainTex2SpeedV));
			float4 uvs_MainTex2 = i.uv_texcoord;
			uvs_MainTex2.xy = i.uv_texcoord.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
			float2 panner82 = ( 1.0 * _Time.y * appendResult80 + uvs_MainTex2.xy);
			float2 CenteredUV15_g41 = ( i.uv_texcoord.xy - float2( 0.5,0.5 ) );
			float2 break17_g41 = CenteredUV15_g41;
			float2 appendResult23_g41 = (float2(( length( CenteredUV15_g41 ) * 1.0 * 2.0 ) , ( atan2( break17_g41.x , break17_g41.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 appendResult346 = (float2(_MainTex2_ST.x , _MainTex2_ST.y));
			float2 appendResult344 = (float2(_MainTex2_ST.z , _MainTex2_ST.w));
			float2 lerpResult350 = lerp( panner82 , (appendResult23_g41*appendResult346 + appendResult344) , _sePolarDissolveMask1);
			float cos355 = cos( ( ( ( _MainTex2Rotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin355 = sin( ( ( ( _MainTex2Rotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator355 = mul( lerpResult350 - float2( 0.5,0.5 ) , float2x2( cos355 , -sin355 , sin355 , cos355 )) + float2( 0.5,0.5 );
			#ifdef _USEDISTURBANCE_ON
				float2 staticSwitch478 = ( rotator355 + raodong67 );
			#else
				float2 staticSwitch478 = rotator355;
			#endif
			float4 tex2DNode83 = tex2D( _MainTex2, staticSwitch478 );
			float lerpResult356 = lerp( tex2DNode83.r , tex2DNode83.a , _MainTex2RGB);
			float3 temp_cast_3 = (_MainTex2Power).xxx;
			#ifdef _USEMAINTEX2_ON
				float3 staticSwitch142 = pow( ( lerpResult356 * (_Main2Color).rgb * _Main2Color.a ) , temp_cast_3 );
			#else
				float3 staticSwitch142 = temp_cast_2;
			#endif
			float3 RampTex85 = staticSwitch142;
			float4 lerpResult455 = lerp( ( float4( RampTex85 , 0.0 ) * temp_output_86_0 ) , ( float4( RampTex85 , 0.0 ) + temp_output_86_0 ) , saturate( _UseTexBlend ));
			float4 lerpResult449 = lerp( temp_output_86_0 , float4( RampTex85 , 0.0 ) , _TexBlendValue);
			float4 lerpResult457 = lerp( lerpResult455 , lerpResult449 , saturate( ( _UseTexBlend - 1.0 ) ));
			#ifdef _USEMAINTEX2_ON
				float4 staticSwitch470 = lerpResult457;
			#else
				float4 staticSwitch470 = temp_output_86_0;
			#endif
			float temp_output_93_0 = ( 1.0 - _SoftaDissolve1 );
			float2 appendResult119 = (float2(_DissolveTex_U , _DissolveTex_V));
			float4 uvs_DissolveTex1 = i.uv_texcoord;
			uvs_DissolveTex1.xy = i.uv_texcoord.xy * _DissolveTex1_ST.xy + _DissolveTex1_ST.zw;
			float2 CenteredUV15_g46 = ( i.uv_texcoord.xy - float2( 0.5,0.5 ) );
			float2 break17_g46 = CenteredUV15_g46;
			float2 appendResult23_g46 = (float2(( length( CenteredUV15_g46 ) * 1.0 * 2.0 ) , ( atan2( break17_g46.x , break17_g46.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 appendResult296 = (float2(_DissolveTex1_ST.x , _DissolveTex1_ST.y));
			float2 appendResult298 = (float2(_DissolveTex1_ST.z , _DissolveTex1_ST.w));
			float2 lerpResult451 = lerp( uvs_DissolveTex1.xy , (appendResult23_g46*appendResult296 + appendResult298) , _UsePolarDissolve1);
			float cos115 = cos( ( ( ( _DissolveRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin115 = sin( ( ( ( _DissolveRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator115 = mul( lerpResult451 - float2( 0.5,0.5 ) , float2x2( cos115 , -sin115 , sin115 , cos115 )) + float2( 0.5,0.5 );
			float2 panner90 = ( 1.0 * _Time.y * appendResult119 + rotator115);
			float4 tex2DNode91 = tex2D( _DissolveTex1, panner90 );
			float lerpResult322 = lerp( tex2DNode91.r , tex2DNode91.a , _DissolveTex1RGB);
			float2 appendResult128 = (float2(_DissolveMaskTexU , _DissolveMaskTexV));
			float4 uvs_DissolveMask = i.uv_texcoord;
			uvs_DissolveMask.xy = i.uv_texcoord.xy * _DissolveMask_ST.xy + _DissolveMask_ST.zw;
			float2 CenteredUV15_g45 = ( i.uv_texcoord.xy - float2( 0.5,0.5 ) );
			float2 break17_g45 = CenteredUV15_g45;
			float2 appendResult23_g45 = (float2(( length( CenteredUV15_g45 ) * 1.0 * 2.0 ) , ( atan2( break17_g45.x , break17_g45.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 appendResult333 = (float2(_DissolveMask_ST.x , _DissolveMask_ST.y));
			float2 appendResult334 = (float2(_DissolveMask_ST.z , _DissolveMask_ST.w));
			float2 lerpResult338 = lerp( uvs_DissolveMask.xy , (appendResult23_g45*appendResult333 + appendResult334) , _UsePolarDissolveMask);
			float cos129 = cos( ( ( ( _DissolveMaskRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin129 = sin( ( ( ( _DissolveMaskRotator * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator129 = mul( lerpResult338 - float2( 0.5,0.5 ) , float2x2( cos129 , -sin129 , sin129 , cos129 )) + float2( 0.5,0.5 );
			float2 panner133 = ( 1.0 * _Time.y * appendResult128 + rotator129);
			float4 tex2DNode125 = tex2D( _DissolveMask, panner133 );
			float lerpResult324 = lerp( tex2DNode125.r , tex2DNode125.a , _DissolveMaskRGB);
			float lerpResult508 = lerp( ( lerpResult322 * lerpResult324 ) , ( lerpResult322 + lerpResult324 ) , _DissolveMaskADD);
			#ifdef _USEDISSOLVEMASK_ON
				float staticSwitch135 = lerpResult508;
			#else
				float staticSwitch135 = lerpResult322;
			#endif
			#ifdef _USEPARTICLEDISSOLVE_ON
				float staticSwitch259 = i.uv2_texcoord2.z;
			#else
				float staticSwitch259 = _DissolveIntensityCustom1z1;
			#endif
			float temp_output_97_0 = ( ( staticSwitch135 + 1.0 ) - ( staticSwitch259 * 2.0 ) );
			float smoothstepResult99 = smoothstep( 0.0 , temp_output_93_0 , temp_output_97_0);
			float smoothstepResult98 = smoothstep( 0.0 , ( temp_output_93_0 + _DissolveWidth ) , temp_output_97_0);
			float4 DissolveWidth104 = ( ( smoothstepResult99 - smoothstepResult98 ) * _DissolveWidthColor );
			#ifdef _USEDISSOLVE2_ON
				float4 staticSwitch146 = ( DissolveWidth104 + staticSwitch470 );
			#else
				float4 staticSwitch146 = staticSwitch470;
			#endif
			o.Emission = staticSwitch146.rgb;
			float lerpResult301 = lerp( tex2DNode1.r , tex2DNode1.a , _MainTexRGB);
			float4 uvs_Mask1 = i.uv_texcoord;
			uvs_Mask1.xy = i.uv_texcoord.xy * _Mask1_ST.xy + _Mask1_ST.zw;
			float2 CenteredUV15_g48 = ( i.uv_texcoord.xy - float2( 0.5,0.5 ) );
			float2 break17_g48 = CenteredUV15_g48;
			float2 appendResult23_g48 = (float2(( length( CenteredUV15_g48 ) * 1.0 * 2.0 ) , ( atan2( break17_g48.x , break17_g48.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 appendResult286 = (float2(_Mask1_ST.x , _Mask1_ST.y));
			float2 appendResult287 = (float2(_Mask1_ST.z , _Mask1_ST.w));
			#ifdef _USEPOLARMASK1_ON
				float2 staticSwitch198 = (appendResult23_g48*appendResult286 + appendResult287);
			#else
				float2 staticSwitch198 = uvs_Mask1.xy;
			#endif
			float cos20 = cos( ( ( ( _MaskRotator1 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin20 = sin( ( ( ( _MaskRotator1 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator20 = mul( staticSwitch198 - float2( 0.5,0.5 ) , float2x2( cos20 , -sin20 , sin20 , cos20 )) + float2( 0.5,0.5 );
			float2 appendResult24 = (float2(_MaskSpeedU1 , _MaskSpeedV1));
			float2 appendResult326 = (float2(i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float2 lerpResult331 = lerp( ( appendResult24 * _Time.y ) , appendResult326 , _UseMaskParticleCustom);
			float4 tex2DNode17 = tex2D( _Mask1, ( rotator20 + lerpResult331 ) );
			float lerpResult315 = lerp( tex2DNode17.r , tex2DNode17.a , _Mask1RGB);
			float temp_output_186_0 = pow( lerpResult315 , _Mask1Power );
			float2 appendResult39 = (float2(_Mask2SpeedU , _Mask2SpeedV));
			float4 uvs_Mask2 = i.uv_texcoord;
			uvs_Mask2.xy = i.uv_texcoord.xy * _Mask2_ST.xy + _Mask2_ST.zw;
			float cos40 = cos( ( ( ( _MaskRotator2 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float sin40 = sin( ( ( ( _MaskRotator2 * UNITY_PI ) * 2.0 ) / -360.0 ) );
			float2 rotator40 = mul( uvs_Mask2.xy - float2( 0.5,0.5 ) , float2x2( cos40 , -sin40 , sin40 , cos40 )) + float2( 0.5,0.5 );
			float2 panner41 = ( 1.0 * _Time.y * appendResult39 + rotator40);
			float4 tex2DNode42 = tex2D( _Mask2, panner41 );
			float lerpResult317 = lerp( tex2DNode42.r , tex2DNode42.a , _Mask2RGB);
			float lerpResult309 = lerp( temp_output_186_0 , ( temp_output_186_0 * lerpResult317 ) , _UseMask1And2);
			#ifdef _USEMASK01_ON
				float staticSwitch44 = lerpResult309;
			#else
				float staticSwitch44 = 1.0;
			#endif
			float Mask0129 = staticSwitch44;
			float DissolveMask103 = smoothstepResult99;
			#ifdef _USEDISSOLVE2_ON
				float staticSwitch147 = DissolveMask103;
			#else
				float staticSwitch147 = 1.0;
			#endif
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth246 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth246 = abs( ( screenDepth246 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _DepthFade1 ) );
			#ifdef _USEDEPTH_ON
				float staticSwitch249 = saturate( distanceDepth246 );
			#else
				float staticSwitch249 = 1.0;
			#endif
			float UseDepth251 = staticSwitch249;
			o.Alpha = ( pow( lerpResult301 , _MaintexPower ) * Mask0129 * staticSwitch147 * i.vertexColor.a * UseDepth251 * _AlphaScale );
		}

		ENDCG
	}
	CustomEditor "Effect1_4_GUI"
}
/*ASEBEGIN
Version=18935
2553;48;1920;1011;8043.178;2809.685;1.67664;True;False
Node;AmplifyShaderEditor.CommentaryNode;63;-6384.735,-450.5239;Inherit;False;3402.615;1838.261;;53;479;491;489;492;493;67;312;311;497;321;278;494;279;57;280;496;498;56;318;319;55;320;77;482;485;490;488;487;486;484;483;481;480;374;75;375;76;377;74;73;376;72;378;373;372;58;371;62;59;60;370;61;369;扰动效果;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;378;-5720.668,697.9745;Inherit;False;Property;_DisturbanceTex2Rotator1;遮罩旋转;24;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-5717.269,303.9739;Inherit;False;Property;_DisturbanceTex1Rotator;遮罩旋转;26;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-6261.423,217.1419;Inherit;False;Property;_DisturbanceTex1V;扰动流动1_V;50;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;370;-5638.65,205.6459;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-6260.795,122.2281;Inherit;False;Property;_DisturbanceTex1U;扰动流动1_U;49;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;376;-5679.049,624.6464;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-6268.284,633.3372;Inherit;False;Property;_DisturbanceTex2V;扰动流动2_V;60;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-6265.245,541.538;Inherit;False;Property;_DisturbanceTex2U;扰动流动2_U;58;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;59;-6258.491,-39.30061;Inherit;False;0;55;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;62;-6060.214,163.1689;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;371;-5600.954,105.756;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;74;-6069.305,584.7986;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;76;-6267.581,382.3291;Inherit;False;0;77;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;377;-5641.353,524.7562;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;375;-5515.499,529.7062;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;75;-5940.313,386.7592;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;372;-5475.1,110.706;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;58;-5931.222,-34.87062;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-5703.394,1252.894;Inherit;False;Property;_DisturbanceMaskRotator;遮罩旋转;25;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;373;-5441.954,-31.24364;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;374;-5482.353,387.7567;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-4941.411,566.1857;Inherit;False;Property;_DisturbanceTex2RGB;使用透明图;57;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;77;-5171.794,355.8661;Inherit;True;Property;_DisturbanceTex2;扰动贴图第二层;55;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;319;-4835.926,117.8479;Inherit;False;Property;_DisturbanceTex1RGB;使用透明图;46;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;55;-5150.55,-43.21561;Inherit;True;Property;_DisturbanceTex1;扰动贴图第一层;45;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;480;-6243.01,1189.257;Inherit;False;Property;_DisturbanceMaskV;扰动流动_V;61;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-6246.971,1094.458;Inherit;False;Property;_DisturbanceMaskU;扰动流动_U;59;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;481;-5661.775,1177.566;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;485;-6250.307,935.249;Inherit;False;0;491;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;483;-6052.031,1137.718;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;318;-4809.587,-11.40105;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;320;-4856.411,409.1858;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-5624.079,1077.676;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;497;-4530.124,467.4426;Inherit;False;Property;_UseDisturbanceADD;使用ADD模式;52;1;[Toggle];Create;False;0;2;1;0;1or2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;486;-5498.225,1082.626;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;498;-4672.124,384.4427;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-4669.296,277.4896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;487;-5923.039,939.6791;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;488;-5465.079,940.6766;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-4271.458,155.2743;Inherit;False;Property;_UseDisturbance1And2;开启第二层扰动;51;1;[Toggle];Create;False;0;2;1;0;1or2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-4518.606,-386.3381;Inherit;False;Property;_DisturbanceScaleU;扰动强度U;47;0;Create;False;0;0;0;False;0;False;0.9118451;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;496;-4518.124,321.4427;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-4513.019,-296.0425;Inherit;False;Property;_DisturbanceScaleV;扰动强度V;48;0;Create;False;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;88;-8596.267,-2807.778;Inherit;False;5509.562;1998.947;Comment;64;260;104;103;102;101;100;99;98;97;96;95;94;105;93;106;259;135;92;124;125;91;133;90;128;129;115;126;116;134;127;131;130;117;118;132;89;232;119;120;121;275;277;296;298;299;300;303;304;322;323;324;325;333;334;335;336;337;338;339;451;452;506;507;508;溶解部分;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;491;-5136.52,915.786;Inherit;True;Property;_DisturbanceMask;扰动贴图遮罩;54;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;84;-1651.038,-2230.963;Inherit;False;3746.91;995.2042;;29;355;354;353;352;351;85;142;363;143;364;462;463;356;83;357;461;350;347;82;345;80;344;348;346;81;78;79;349;475;渐变贴图;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;489;-4724.137,1098.106;Inherit;False;Property;_DisturbanceMaskRGB;使用透明图;56;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;311;-4275.712,-9.539169;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;280;-4188.121,-364.7426;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-7172.275,-1502.242;Inherit;False;Property;_DissolveMaskRotator;溶解遮罩旋转;77;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;337;-7922.702,-1524.246;Inherit;False;Property;_DissolveMask_ST;DissolveMask_ST;91;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;232;-7777.199,-2334.812;Inherit;False;Property;_DissolveTex1_ST;DissolveTex1;86;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;349;-1541.503,-1521.446;Inherit;False;Property;_MainTex2_ST;MainTex2_ST;90;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;118;-7200.196,-2369.915;Inherit;False;Property;_DissolveRotator;溶解遮罩旋转;65;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-1571.491,-1881.478;Inherit;False;Property;_MainTex2SpeedU;第二层贴图流动U;19;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-892.0094,-1560.828;Inherit;False;Property;_MainTex2Rotator;第二层贴图旋转;18;0;Create;False;0;0;0;False;0;False;0;120;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;490;-4719.137,951.1058;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;-4033.121,-9.742508;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-1568.89,-1787.679;Inherit;False;Property;_MainTex2SpeedV;第二层贴图流动V;20;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;296;-7599.345,-2336.69;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;130;-7081.409,-1577.109;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;117;-7113.591,-2444.852;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;300;-7737.072,-2493.099;Inherit;False;Polar Coordinates;-1;;46;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;335;-7882.574,-1682.533;Inherit;False;Polar Coordinates;-1;;45;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;334;-7740.97,-1429.011;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;298;-7595.468,-2239.577;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;346;-1363.649,-1523.324;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;348;-1501.375,-1679.733;Inherit;False;Polar Coordinates;-1;;41;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;352;-833.2943,-1682.578;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;80;-1370.909,-1840.538;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;81;-1569.187,-2043.007;Inherit;False;0;83;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;493;-3656.136,185.6902;Inherit;False;Property;_UseDisturbanceMask;开启扰动遮罩;53;1;[Toggle];Create;False;0;2;1;0;1or2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;494;-3864.42,302.4511;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;344;-1359.771,-1426.211;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;333;-7744.848,-1526.124;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;131;-7044.852,-1682.209;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;336;-7557.276,-1681.095;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;339;-7439.22,-1532.475;Inherit;False;Property;_UsePolarDissolveMask;开启溶解遮罩极坐标;96;1;[Toggle];Create;False;0;2;Option1;0;Option2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;452;-7401.084,-2303.747;Inherit;False;Property;_UsePolarDissolve1;开启溶解极贴图坐标;97;1;[Toggle];Create;False;0;2;Option1;0;Option2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;89;-7674.197,-2695.44;Inherit;False;0;91;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;134;-7912.224,-1866.936;Inherit;False;0;125;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;347;-1058.021,-1529.675;Inherit;False;Property;_sePolarDissolveMask1;Float 6;98;1;[Toggle];Create;False;0;2;Option1;0;Option2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;116;-7078.611,-2531.03;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;82;-1241.917,-2038.576;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;492;-3661.429,-11.99638;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;353;-808.1974,-1790.853;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;345;-1177.11,-1678.295;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;299;-7492.806,-2533.661;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;126;-6686.304,-1571.332;Inherit;False;Property;_DissolveMaskTexV;溶解遮罩贴图流动_V;79;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-6696.305,-1664.414;Inherit;False;Property;_DissolveMaskTexU;溶解遮罩贴图流动_U;78;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;275;-6929.324,-2538.739;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-6690.097,-2369.832;Inherit;False;Property;_DissolveTex_V;溶解贴图流动_V;67;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;338;-7244.246,-1862.428;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;277;-6876.291,-1653.504;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;451;-7230.084,-2692.089;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;350;-1049.047,-2039.628;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;354;-666.5764,-1792.533;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-6689.686,-2461.21;Inherit;False;Property;_DissolveTex_U;溶解贴图流动_U;66;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;475;-557.0094,-2082.506;Inherit;False;499.0767;317.992;Comment;3;478;477;476;扰动开关;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-2185.011,238.0098;Inherit;False;Property;_MainTexRotator;第一层贴图旋转;10;0;Create;False;0;0;0;False;0;False;0;120;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;164;-2779.029,171.8367;Inherit;False;Property;_MainTex_ST;MainTex_ST;87;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-3430.307,-18.1373;Inherit;False;raodong;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;128;-6488.341,-1625.08;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;129;-6688.57,-1855.3;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;119;-6520.872,-2429.21;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-528.0094,-1891.627;Inherit;False;67;raodong;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;115;-6816.12,-2688.366;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;284;-2593.881,187.6002;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;285;-2605.881,272.6002;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;27;-6659.625,1672.87;Inherit;False;4368.813;2246.338;;53;194;221;42;288;17;19;43;290;292;295;293;223;29;44;309;308;310;45;317;186;316;315;187;41;314;328;40;39;20;331;35;37;38;274;273;326;36;332;330;198;24;329;34;327;289;21;286;25;22;26;287;33;23;Mask01;1,1,1,1;0;0
Node;AmplifyShaderEditor.RotatorNode;355;-764.7034,-2041.875;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;281;-2740.885,3.606014;Inherit;False;Polar Coordinates;-1;;47;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;14;-2126.296,115.2591;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;476;-346.1643,-1907.173;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;90;-6484.966,-2686.587;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-2633.984,-162.684;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;194;-6026.282,2272.219;Inherit;False;Property;_Mask1_ST;Mask1_ST;88;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-5156.527,2064.162;Inherit;False;Property;_MaskRotator1;遮罩旋转;27;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;283;-2446.881,4.600094;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;133;-6408.342,-1854.386;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-2101.199,6.984512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-5962.18,-1685.988;Inherit;False;Property;_DissolveMaskRGB;贴图通道选择;75;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;125;-6205.141,-1881.524;Inherit;True;Property;_DissolveMask;溶解贴图遮罩(开启上方按钮才起作用);74;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;323;-6058.784,-2515.311;Inherit;False;Property;_DissolveTex1RGB;贴图通道选择;64;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;91;-6279.348,-2713.607;Inherit;True;Property;_DissolveTex1;溶解贴图;63;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;288;-6010.846,2051.006;Inherit;False;Polar Coordinates;-1;;48;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;478;-311.7043,-2034.276;Inherit;False;Property;_UseDisturbance1;开启扰动效果;44;0;Create;False;0;0;0;False;1;;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;140;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;401;-1333.056,1753.836;Inherit;False;3236.315;1911.049;顶点动画;34;404;407;399;406;397;396;394;392;395;393;391;389;388;400;398;387;386;390;384;385;410;411;412;413;414;417;418;421;422;423;424;426;504;505;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1419.261,212.537;Inherit;False;Property;_MainTexU1;第一层贴图流动U;11;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;286;-5852.333,2258.971;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;168;-2313.765,-161.384;Inherit;False;Property;_UsePolarMainTex;开启极坐标;13;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-4649.467,1996.522;Inherit;False;Property;_MaskSpeedU1;遮罩流动速度U;29;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-4815.915,2866.838;Inherit;False;Property;_MaskRotator2;遮罩旋转;39;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1417.66,304.7362;Inherit;False;Property;_MainTexV1;第一层贴图流动V;12;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-5180.576,2191.452;Inherit;False;Property;_MaskSpeedV1;遮罩流动速度V;30;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;160;-1803.354,-199.038;Inherit;False;349.2452;471.1461;Comment;1;12;旋转;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;287;-5848.457,2356.084;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;22;-5010.527,2066.162;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;141;-1414.066,-189.323;Inherit;False;499.0767;317.992;Comment;3;140;68;69;扰动开关;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;272;-1959.578,5.304153;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;322;-5950.784,-2688.311;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;324;-5854.18,-1859.988;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;12;-1715.705,-149.038;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-4962.527,1954.162;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;329;-4394.919,2154.842;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;327;-4602.054,2272.802;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;384;-1184.492,2343.833;Inherit;False;Property;_VertexOffsetSpeedV;噪波图流动V;85;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;83;183.4916,-2078.487;Inherit;True;Property;_MainTex2;第二层贴图;16;0;Create;False;0;0;0;False;0;False;-1;e8ae136df40cd8a4eaedf9805edf8d22;e8ae136df40cd8a4eaedf9805edf8d22;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;385;-1186.093,2249.633;Inherit;False;Property;_VertexOffsetSpeedU;噪波图流动U;84;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;7;-1216.077,249.578;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;412;-517.6705,3036.229;Inherit;False;Property;_VertexOffsetRotator;顶点动画遮罩旋转;40;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-4441.459,2028.522;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;289;-5616.793,2052;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;69;-1385.066,1.55576;Inherit;False;67;raodong;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;34;-4743.938,2790.265;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;264;-1333.449,403.2542;Inherit;False;0;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;357;377.9964,-1810.478;Inherit;False;Property;_MainTex2RGB;贴图通道选择;7;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-6070.822,1785.72;Inherit;False;0;17;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;461;563.8306,-1767.938;Inherit;False;Property;_Main2Color;第二层贴图颜色;4;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;268;-1260.589,167.044;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;507;-5613.002,-2363.355;Inherit;False;Property;_DissolveMaskADD;使用Add模式;76;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-5768.137,-2571.648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;506;-5751.198,-2428.5;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;326;-4342.227,2294.146;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;-1087.043,212.0992;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;413;-445.6943,2959.656;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;398;-1197.32,2054.939;Inherit;False;Property;_VertexOffsetTillingV;噪波图TillingV;83;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;265;-1074.622,472.5977;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;198;-5424.389,1781.526;Inherit;False;Property;_UsePolarMask1;开启极坐标;31;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;330;-4295.92,2046.842;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;68;-1203.221,-13.98982;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;387;-1026.421,2203.14;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;463;578.3945,-1844.918;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;273;-4932.527,1856.162;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-4735.811,2692.353;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;332;-4138.92,2314.842;Inherit;False;Property;_UseMaskParticleCustom;使用粒子自定义属性ZW;32;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-1209.32,1962.839;Inherit;False;Property;_VertexOffsetTillingU;噪波图TillingU;82;0;Create;False;0;0;0;False;0;False;1;3.29;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;356;524.2717,-2053.679;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;386;-981.9092,2285.674;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;20;-4787.486,1788.292;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;508;-5506.426,-2536.355;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;331;-4128.92,2039.842;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;-437.5664,2861.744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-5593.974,-2198.677;Inherit;False;Property;_DissolveIntensityCustom1z1;溶解强度;68;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;388;-852.8754,2248.195;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;260;-5521.118,-2077.546;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;400;-1005.959,2006.687;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;38;-5321.979,2544.643;Inherit;False;0;42;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;263;-946.2413,205.7327;Inherit;False;Property;_UseParticleCustom;使用粒子自定义属性XY;14;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-4412.868,2873.225;Inherit;False;Property;_Mask2SpeedV;遮罩流动速度V;42;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;462;783.3254,-2054.011;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;364;823.9819,-1788.754;Inherit;False;Property;_MainTex2Power;第二层贴图对比度;17;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;140;-1168.761,-141.0924;Inherit;False;Property;_UseDisturbance;开启扰动效果;44;0;Create;False;0;0;0;False;1;Header(RaoDong);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;274;-4559.825,2693.21;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-4396.941,2770.698;Inherit;False;Property;_Mask2SpeedU;遮罩流动速度U;41;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;389;-817.3203,1969.94;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;417;-261.5806,2862.601;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-360;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-4888.616,-2385.852;Inherit;False;Property;_SoftaDissolve1;软硬边强度;69;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;363;918.8582,-2053.428;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;266;-844.5297,-135.3977;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;135;-5478.418,-2686.973;Inherit;False;Property;_UseDissolveMask;开启溶解贴图遮罩;73;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;40;-4478.592,2547.682;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;328;-4253.92,1783.842;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;422;-539.1479,2711.16;Inherit;False;0;421;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;304;-5322.891,-2554.995;Inherit;False;Constant;_Float4;Float 4;60;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-5145.128,-2065.32;Inherit;False;Constant;_Float3;Float 3;60;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;259;-5304.412,-2199.127;Inherit;False;Property;_UseParticleDissolve;开启使用粒子自定义2(X);72;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;39;-4198.592,2814.979;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;143;1010.746,-2207.633;Inherit;False;Constant;_Float0;Float 0;44;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-5037.389,-2206.445;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;93;-4628.474,-2389.304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-4876.082,-2243.987;Inherit;False;Property;_DissolveWidth;溶解沟边宽度;70;0;Create;False;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;188;-59.63239,-104.8683;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;41;-4215.434,2550.293;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-694.7127,-161.8037;Inherit;True;Property;_MainTex;第一层贴图;6;0;Create;False;0;0;0;False;0;False;-1;d95ed71ae632fb042b82c115f7422285;d95ed71ae632fb042b82c115f7422285;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;391;-582.323,1966.628;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;17;-4009.774,1753.451;Inherit;True;Property;_Mask1;遮罩第一层;22;0;Create;False;1;Mask;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;307;-367.0277,-84.9511;Inherit;False;Property;_MaintexPower;第一层贴图对比度;9;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;418;-180.3477,2717.073;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-5197.533,-2694.32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;142;1177.705,-2085.633;Inherit;True;Property;_UseMainTex2;开启第二层贴图;15;0;Create;False;0;0;0;False;1;Header(Ramp);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;314;-3864.892,2020.263;Inherit;False;Property;_Mask1RGB;贴图通道选择;23;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;96;-4484.816,-2322.895;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;392;-326.3185,2190.402;Inherit;False;Property;_VertexOffsetScale;顶点动画强度;81;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;410;257.2545,2911.236;Inherit;False;Property;_VertexOffsetRGB;贴图通道选择;38;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;395;-155.2589,2246.227;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;393;-329.4196,1971.841;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;193;-89.97721,-180.9017;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;255;-1161.31,668.5264;Inherit;False;1383.673;482.7711;Comment;6;251;249;253;250;246;247;边缘羽化;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;421;136.6996,2688.837;Inherit;True;Property;_VertexOffsetMask;顶点动画遮罩;36;0;Create;False;1;Mask;0;0;False;0;False;-1;7860ada79a0315a4092e350db2c4a4c7;7860ada79a0315a4092e350db2c4a4c7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;47;-263.7215,-539.1992;Inherit;False;Property;_MainColor;第一层贴图颜色;5;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;316;-3852.29,2733.645;Inherit;False;Property;_Mask2RGB;贴图通道选择;37;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;97;-4926.5,-2697.168;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;315;-3690.892,1785.263;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;305;-259.664,-316.3702;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;394;-154.891,2417.29;Inherit;False;Property;_VertexOffsetAxial;顶点动画轴向XYZ;80;1;[Header];Create;False;1;Vertex Offser;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;187;-3638.651,2007.288;Inherit;False;Property;_Mask1Power;遮罩第一层对比度;28;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;85;1517.425,-2095.506;Inherit;True;RampTex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;42;-3984.545,2521.446;Inherit;True;Property;_Mask2;遮罩第二层;35;0;Create;False;1;Mask;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;99;-4473.955,-2686.941;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-1147.31,945.7698;Inherit;False;Property;_DepthFade1;软粒子强度;94;0;Create;False;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;411;463.9545,2713.036;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;397;-133.3185,1976.402;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;396;40.74104,2267.227;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;505;515.9985,2898.341;Inherit;False;Property;_VertexOffsetMaskScale;遮罩强度;101;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;163.3472,-328.1843;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;98;-4360.628,-2403.127;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;454;492.452,2.297852;Inherit;False;Property;_UseTexBlend;贴图混合模式;100;1;[Enum];Create;False;0;3;Multiply;0;Add;1;Blend;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;186;-3439.424,1783.619;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;87;85.55518,-561.8681;Inherit;False;85;RampTex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;317;-3657.29,2545.645;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;246;-996.4514,836.9633;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;466;676.2415,-82.29858;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;450;85.91577,-93.08484;Inherit;False;Property;_TexBlendValue;混合值;99;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-3319.017,2093.079;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;100;-4125.688,-2508.899;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;428;435.5851,-428.2875;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;101;-4038.167,-2211.997;Inherit;False;Property;_DissolveWidthColor;溶解沟边颜色;71;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;399;171.741,1972.227;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;504;665.9985,2684.341;Inherit;True;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;427;455.5851,-549.2875;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;458;724.452,-1.702148;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-3337.812,2267.226;Inherit;False;Property;_UseMask1And2;开启第二层遮罩;33;1;[Toggle];Create;False;0;2;1;0;1or2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;455;604.452,-368.7021;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;465;862.2415,-6.298523;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;423;517.0146,2089.42;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;250;-628.9841,716.5264;Inherit;False;Constant;_Float2;Float 2;56;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;308;-3138.197,1712.124;Inherit;False;Constant;_Float5;Float 5;61;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;253;-690.6507,899.8287;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;309;-3155.515,1794.198;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;473;244.8281,-446.9032;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;424;616.4761,2285.009;Inherit;False;Property;_UseVertexOffsetMask;开启顶点动画遮罩;34;1;[Toggle];Create;False;0;2;1;0;1or2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;449;402.9158,-296.0848;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;-3867.058,-2507.342;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;104;-3648.817,-2512.46;Inherit;True;DissolveWidth;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;474;1015.828,-390.9032;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;44;-2987.31,1767.171;Inherit;False;Property;_UseMask01;开启第一层遮罩;21;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;302;-554.7145,163.4044;Inherit;False;Property;_MainTexRGB;贴图通道选择;8;1;[Toggle];Create;False;0;2;A;0;R;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;426;746.7733,1967.982;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;103;-3943.864,-2686.477;Inherit;False;DissolveMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;249;-466.9841,806.5264;Inherit;True;Property;_UseDepth;开启软粒子;92;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;469;1290.442,-625.5411;Inherit;False;316.5331;468.0333;溶解亮边;3;146;108;109;;0,0,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;457;854.9298,-298.7205;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;406;910.3661,1848.963;Inherit;False;Constant;_Float8;Float 8;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;407;1032.84,1934.691;Inherit;True;Property;_UseVertexOffset;开启顶点动画;93;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-2734.6,1785.957;Inherit;False;Mask01;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;470;1040.811,-306.2391;Inherit;False;Property;_UseMainTex3;开启第二层贴图;15;0;Create;False;0;0;0;False;1;Header(Ramp);False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;142;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;251;-3.750729,808.3472;Inherit;False;UseDepth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;109;1340.442,-575.5411;Inherit;False;104;DissolveWidth;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;784.9352,431.4757;Inherit;False;103;DissolveMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;301;-364.9872,27.94963;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;148;816.9352,335.4757;Inherit;False;Constant;_Float1;Float 1;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;1174.935,485.4757;Inherit;False;251;UseDepth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;404;1313.12,1939.031;Inherit;False;VerTexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;147;992.9352,335.4757;Inherit;False;Property;_UseDissolve;开启溶解;62;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;146;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;262;1462.935,405.4757;Inherit;False;Property;_AlphaScale;Alpha;95;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;1371.438,-463.1798;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;306;-149.2269,78.18169;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;1110.935,213.4758;Inherit;False;29;Mask01;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;293;-5126.969,2788.278;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;292;-5358.977,2986.542;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;223;-5026.078,2604.525;Inherit;False;Property;_UseRadialMask2;开启极坐标;43;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;221;-5555.672,2986.723;Inherit;False;Property;_Mask2_ST;Mask2;89;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;313;1829.309,-573.038;Inherit;False;Property;_ZWrite;深度模式;2;1;[Enum];Create;False;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;405;1526.935,261.4758;Inherit;False;404;VerTexOffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;49;1825.826,-473.1554;Inherit;False;Property;_CullMode;开启双面;1;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;295;-5484.259,2785.806;Inherit;False;Polar Coordinates;-1;;49;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;290;-5357.099,3083.654;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;-3181.114,2549.872;Inherit;False;Mask01;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;146;1351.975,-297.5077;Inherit;False;Property;_UseDissolve2;开启贴图溶解;62;0;Create;False;0;0;0;False;1;Header(Dissolve);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;51;1827.752,-361.6981;Inherit;False;Property;_Dst1;叠加模式;3;1;[Enum];Create;False;0;2;AddItive;1;AlphaBlend;10;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;1367.935,104.4758;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1734.934,-170.5242;Float;False;True;-1;2;Effect1_4_GUI;0;0;Unlit;Effect1/动效功能材质1.4;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;True;313;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;50;10;True;51;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;True;49;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;370;0;369;0
WireConnection;376;0;378;0
WireConnection;62;0;60;0
WireConnection;62;1;61;0
WireConnection;371;0;370;0
WireConnection;74;0;73;0
WireConnection;74;1;72;0
WireConnection;377;0;376;0
WireConnection;375;0;377;0
WireConnection;75;0;76;0
WireConnection;75;2;74;0
WireConnection;372;0;371;0
WireConnection;58;0;59;0
WireConnection;58;2;62;0
WireConnection;373;0;58;0
WireConnection;373;2;372;0
WireConnection;374;0;75;0
WireConnection;374;2;375;0
WireConnection;77;1;374;0
WireConnection;55;1;373;0
WireConnection;481;0;479;0
WireConnection;483;0;482;0
WireConnection;483;1;480;0
WireConnection;318;0;55;1
WireConnection;318;1;55;4
WireConnection;318;2;319;0
WireConnection;320;0;77;1
WireConnection;320;1;77;4
WireConnection;320;2;321;0
WireConnection;484;0;481;0
WireConnection;486;0;484;0
WireConnection;498;0;318;0
WireConnection;498;1;320;0
WireConnection;56;0;318;0
WireConnection;56;1;320;0
WireConnection;487;0;485;0
WireConnection;487;2;483;0
WireConnection;488;0;487;0
WireConnection;488;2;486;0
WireConnection;496;0;56;0
WireConnection;496;1;498;0
WireConnection;496;2;497;0
WireConnection;491;1;488;0
WireConnection;311;0;318;0
WireConnection;311;1;496;0
WireConnection;311;2;312;0
WireConnection;280;0;57;0
WireConnection;280;1;279;0
WireConnection;490;0;491;1
WireConnection;490;1;491;4
WireConnection;490;2;489;0
WireConnection;278;0;280;0
WireConnection;278;1;311;0
WireConnection;296;0;232;1
WireConnection;296;1;232;2
WireConnection;130;0;132;0
WireConnection;117;0;118;0
WireConnection;334;0;337;3
WireConnection;334;1;337;4
WireConnection;298;0;232;3
WireConnection;298;1;232;4
WireConnection;346;0;349;1
WireConnection;346;1;349;2
WireConnection;352;0;351;0
WireConnection;80;0;78;0
WireConnection;80;1;79;0
WireConnection;494;0;278;0
WireConnection;494;1;490;0
WireConnection;344;0;349;3
WireConnection;344;1;349;4
WireConnection;333;0;337;1
WireConnection;333;1;337;2
WireConnection;131;0;130;0
WireConnection;336;0;335;0
WireConnection;336;1;333;0
WireConnection;336;2;334;0
WireConnection;116;0;117;0
WireConnection;82;0;81;0
WireConnection;82;2;80;0
WireConnection;492;0;278;0
WireConnection;492;1;494;0
WireConnection;492;2;493;0
WireConnection;353;0;352;0
WireConnection;345;0;348;0
WireConnection;345;1;346;0
WireConnection;345;2;344;0
WireConnection;299;0;300;0
WireConnection;299;1;296;0
WireConnection;299;2;298;0
WireConnection;275;0;116;0
WireConnection;338;0;134;0
WireConnection;338;1;336;0
WireConnection;338;2;339;0
WireConnection;277;0;131;0
WireConnection;451;0;89;0
WireConnection;451;1;299;0
WireConnection;451;2;452;0
WireConnection;350;0;82;0
WireConnection;350;1;345;0
WireConnection;350;2;347;0
WireConnection;354;0;353;0
WireConnection;67;0;492;0
WireConnection;128;0;127;0
WireConnection;128;1;126;0
WireConnection;129;0;338;0
WireConnection;129;2;277;0
WireConnection;119;0;120;0
WireConnection;119;1;121;0
WireConnection;115;0;451;0
WireConnection;115;2;275;0
WireConnection;284;0;164;1
WireConnection;284;1;164;2
WireConnection;285;0;164;3
WireConnection;285;1;164;4
WireConnection;355;0;350;0
WireConnection;355;2;354;0
WireConnection;14;0;13;0
WireConnection;476;0;355;0
WireConnection;476;1;477;0
WireConnection;90;0;115;0
WireConnection;90;2;119;0
WireConnection;283;0;281;0
WireConnection;283;1;284;0
WireConnection;283;2;285;0
WireConnection;133;0;129;0
WireConnection;133;2;128;0
WireConnection;15;0;14;0
WireConnection;125;1;133;0
WireConnection;91;1;90;0
WireConnection;478;1;355;0
WireConnection;478;0;476;0
WireConnection;286;0;194;1
WireConnection;286;1;194;2
WireConnection;168;1;3;0
WireConnection;168;0;283;0
WireConnection;287;0;194;3
WireConnection;287;1;194;4
WireConnection;22;0;23;0
WireConnection;272;0;15;0
WireConnection;322;0;91;1
WireConnection;322;1;91;4
WireConnection;322;2;323;0
WireConnection;324;0;125;1
WireConnection;324;1;125;4
WireConnection;324;2;325;0
WireConnection;12;0;168;0
WireConnection;12;2;272;0
WireConnection;21;0;22;0
WireConnection;83;1;478;0
WireConnection;7;0;5;0
WireConnection;7;1;11;0
WireConnection;24;0;26;0
WireConnection;24;1;25;0
WireConnection;289;0;288;0
WireConnection;289;1;286;0
WireConnection;289;2;287;0
WireConnection;34;0;33;0
WireConnection;124;0;322;0
WireConnection;124;1;324;0
WireConnection;506;0;322;0
WireConnection;506;1;324;0
WireConnection;326;0;327;1
WireConnection;326;1;327;2
WireConnection;269;0;268;0
WireConnection;269;1;7;0
WireConnection;413;0;412;0
WireConnection;265;0;264;3
WireConnection;265;1;264;4
WireConnection;198;1;19;0
WireConnection;198;0;289;0
WireConnection;330;0;24;0
WireConnection;330;1;329;0
WireConnection;68;0;12;0
WireConnection;68;1;69;0
WireConnection;463;0;461;0
WireConnection;273;0;21;0
WireConnection;36;0;34;0
WireConnection;356;0;83;1
WireConnection;356;1;83;4
WireConnection;356;2;357;0
WireConnection;386;0;385;0
WireConnection;386;1;384;0
WireConnection;20;0;198;0
WireConnection;20;2;273;0
WireConnection;508;0;124;0
WireConnection;508;1;506;0
WireConnection;508;2;507;0
WireConnection;331;0;330;0
WireConnection;331;1;326;0
WireConnection;331;2;332;0
WireConnection;414;0;413;0
WireConnection;388;0;387;0
WireConnection;388;1;386;0
WireConnection;400;0;390;0
WireConnection;400;1;398;0
WireConnection;263;1;269;0
WireConnection;263;0;265;0
WireConnection;462;0;356;0
WireConnection;462;1;463;0
WireConnection;462;2;461;4
WireConnection;140;1;12;0
WireConnection;140;0;68;0
WireConnection;274;0;36;0
WireConnection;389;0;400;0
WireConnection;389;1;388;0
WireConnection;417;0;414;0
WireConnection;363;0;462;0
WireConnection;363;1;364;0
WireConnection;266;0;140;0
WireConnection;266;1;263;0
WireConnection;135;1;322;0
WireConnection;135;0;508;0
WireConnection;40;0;38;0
WireConnection;40;2;274;0
WireConnection;328;0;20;0
WireConnection;328;1;331;0
WireConnection;259;1;92;0
WireConnection;259;0;260;3
WireConnection;39;0;35;0
WireConnection;39;1;37;0
WireConnection;94;0;259;0
WireConnection;94;1;303;0
WireConnection;93;0;106;0
WireConnection;41;0;40;0
WireConnection;41;2;39;0
WireConnection;1;1;266;0
WireConnection;391;0;389;0
WireConnection;17;1;328;0
WireConnection;418;0;422;0
WireConnection;418;2;417;0
WireConnection;95;0;135;0
WireConnection;95;1;304;0
WireConnection;142;1;143;0
WireConnection;142;0;363;0
WireConnection;96;0;93;0
WireConnection;96;1;105;0
WireConnection;393;0;391;0
WireConnection;193;0;188;0
WireConnection;421;1;418;0
WireConnection;97;0;95;0
WireConnection;97;1;94;0
WireConnection;315;0;17;1
WireConnection;315;1;17;4
WireConnection;315;2;314;0
WireConnection;305;0;1;0
WireConnection;305;1;307;0
WireConnection;85;0;142;0
WireConnection;42;1;41;0
WireConnection;99;0;97;0
WireConnection;99;2;93;0
WireConnection;411;0;421;1
WireConnection;411;1;421;4
WireConnection;411;2;410;0
WireConnection;397;0;393;0
WireConnection;397;1;392;0
WireConnection;396;0;395;0
WireConnection;396;1;394;0
WireConnection;86;0;305;0
WireConnection;86;1;47;0
WireConnection;86;2;193;0
WireConnection;86;3;47;4
WireConnection;98;0;97;0
WireConnection;98;2;96;0
WireConnection;186;0;315;0
WireConnection;186;1;187;0
WireConnection;317;0;42;1
WireConnection;317;1;42;4
WireConnection;317;2;316;0
WireConnection;246;0;247;0
WireConnection;466;0;454;0
WireConnection;45;0;186;0
WireConnection;45;1;317;0
WireConnection;100;0;99;0
WireConnection;100;1;98;0
WireConnection;428;0;87;0
WireConnection;428;1;86;0
WireConnection;399;0;397;0
WireConnection;399;1;396;0
WireConnection;504;1;411;0
WireConnection;504;2;505;0
WireConnection;427;0;87;0
WireConnection;427;1;86;0
WireConnection;458;0;454;0
WireConnection;455;0;427;0
WireConnection;455;1;428;0
WireConnection;455;2;466;0
WireConnection;465;0;458;0
WireConnection;423;0;399;0
WireConnection;423;1;504;0
WireConnection;253;0;246;0
WireConnection;309;0;186;0
WireConnection;309;1;45;0
WireConnection;309;2;310;0
WireConnection;473;0;86;0
WireConnection;449;0;86;0
WireConnection;449;1;87;0
WireConnection;449;2;450;0
WireConnection;102;0;100;0
WireConnection;102;1;101;0
WireConnection;104;0;102;0
WireConnection;474;0;473;0
WireConnection;44;1;308;0
WireConnection;44;0;309;0
WireConnection;426;0;399;0
WireConnection;426;1;423;0
WireConnection;426;2;424;0
WireConnection;103;0;99;0
WireConnection;249;1;250;0
WireConnection;249;0;253;0
WireConnection;457;0;455;0
WireConnection;457;1;449;0
WireConnection;457;2;465;0
WireConnection;407;1;406;0
WireConnection;407;0;426;0
WireConnection;29;0;44;0
WireConnection;470;1;474;0
WireConnection;470;0;457;0
WireConnection;251;0;249;0
WireConnection;301;0;1;1
WireConnection;301;1;1;4
WireConnection;301;2;302;0
WireConnection;404;0;407;0
WireConnection;147;1;148;0
WireConnection;147;0;107;0
WireConnection;108;0;109;0
WireConnection;108;1;470;0
WireConnection;306;0;301;0
WireConnection;306;1;307;0
WireConnection;293;0;295;0
WireConnection;293;1;292;0
WireConnection;293;2;290;0
WireConnection;292;0;221;1
WireConnection;292;1;221;2
WireConnection;223;1;38;0
WireConnection;223;0;293;0
WireConnection;290;0;221;3
WireConnection;290;1;221;4
WireConnection;43;0;317;0
WireConnection;146;1;470;0
WireConnection;146;0;108;0
WireConnection;32;0;306;0
WireConnection;32;1;28;0
WireConnection;32;2;147;0
WireConnection;32;3;188;4
WireConnection;32;4;252;0
WireConnection;32;5;262;0
WireConnection;0;2;146;0
WireConnection;0;9;32;0
WireConnection;0;11;405;0
ASEEND*/
//CHKSM=0233390A8BC2F4C7895881009625CE96D3D442B7