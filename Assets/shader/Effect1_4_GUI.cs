using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Effect1_4_GUI : ShaderGUI
{
    private static class Styles
    {
        
public static GUIContent ZWriteText = new GUIContent("深度模式");
        public static GUIContent CullModeText = new GUIContent("开启双面");
        public static GUIContent Dst1Text = new GUIContent("混合模式");

        #region MainTexText
        public static GUIContent MainColorText = new GUIContent("第一层贴图颜色");
        public static GUIContent MainTexText = new GUIContent("第一层贴图");
        public static GUIContent UsePolarMainTexText = new GUIContent("开启极坐标");
        public static GUIContent MainTexRGBText = new GUIContent("使用透明贴图");
        public static GUIContent MainTexRotatorText = new GUIContent("第一层贴图旋转");
        public static GUIContent MaintexPowerText = new GUIContent("第一层贴图对比度");
        public static GUIContent MainTexU1Text = new GUIContent("第一层贴图流动速度_U");
        public static GUIContent MainTexV1Text = new GUIContent("第一层贴图流动速度_V");
        public static GUIContent UseParticleCustomText = new GUIContent("使用粒子自定义属性XY");
        #endregion

        #region MainTexSecondText
        public static GUIContent UseMainTex2Text = new GUIContent("开启第二层贴图");
        public static GUIContent Main2ColorText = new GUIContent("第二层贴图颜色");
        public static GUIContent MainTex2Text = new GUIContent("第二层贴图");
        public static GUIContent MainTex2RGBText = new GUIContent("使用透明贴图");
        public static GUIContent MainTex2RotatorText = new GUIContent("第二层贴图旋转");
        public static GUIContent MainTex2PowerText = new GUIContent("第二层贴图对比度");
        public static GUIContent MainTex2SpeedU1Text = new GUIContent("第二层贴图速度U");
        public static GUIContent MainTex2SpeedV1Text = new GUIContent("第二层流动速度V");
        public static GUIContent UseTexBlendText = new GUIContent("贴图混合模式");
        public static GUIContent TexBlendValueText = new GUIContent("混合值");
        #endregion

        #region MaskText
        public static GUIContent UseMask01Text = new GUIContent("开启第一层遮罩");
        public static GUIContent Mask1Text = new GUIContent("遮罩第一层");
        public static GUIContent Mask1RGBText = new GUIContent("使用透明贴图");
        public static GUIContent Mask1PowerText = new GUIContent("遮罩第一层对比度");
        public static GUIContent UsePolarMask1Text = new GUIContent("开启极坐标");
        public static GUIContent MaskRotator1Text = new GUIContent("遮罩旋转");
        public static GUIContent MaskSpeedU1Text = new GUIContent("遮罩流动速度U");
        public static GUIContent MaskSpeedV1Text = new GUIContent("遮罩流动速度V");
        public static GUIContent UseMaskParticleCustomText = new GUIContent("使用粒子自定义属性ZW控制速度");

        public static GUIContent UseMask1And2Text = new GUIContent("开启第二层遮罩");
        public static GUIContent Mask2Text = new GUIContent("遮罩第二层");
        public static GUIContent Mask2RGBText = new GUIContent("贴使用透明贴图");
        //public static GUIContent UsePolarMask2Text = new GUIContent("开启极坐标");
        public static GUIContent MaskRotator2Text = new GUIContent("遮罩旋转");
        public static GUIContent Mask2SpeedUText = new GUIContent("遮罩流动速度U");
        public static GUIContent Mask2SpeedVText = new GUIContent("遮罩流动速度V");
        #endregion

        #region NoiseText
        public static GUIContent UseDisturbanceText = new GUIContent("开启扰动属性");
        public static GUIContent DisturbanceTex1Text = new GUIContent("扰动贴图第一层");
        public static GUIContent DisturbanceTex1RGBText = new GUIContent("使用透明贴图");
        public static GUIContent DisturbanceScaleUText = new GUIContent("扰动强度U");
        public static GUIContent DisturbanceScaleVText = new GUIContent("扰动强度V");
        public static GUIContent DisturbanceTex1UText = new GUIContent("扰动流动速度_U");
        public static GUIContent DisturbanceTex1VText = new GUIContent("扰动流动速度_V");

        public static GUIContent UseDisturbance1And2Text = new GUIContent("开启扰动第二层");
        public static GUIContent DisturbanceTex2Text = new GUIContent("扰动贴图第二层");
        public static GUIContent DisturbanceTex2RGBText = new GUIContent("使用透明贴图");
        public static GUIContent UseDisturbanceADDText = new GUIContent("使用ADD模式");
        public static GUIContent DisturbanceTex2UText = new GUIContent("扰动流动速度_U");
        public static GUIContent DisturbanceTex2VText = new GUIContent("扰动流动速度_V");

        public static GUIContent UseDisturbanceMaskText = new GUIContent("开启扰动遮罩");
        public static GUIContent DisturbanceMaskText = new GUIContent("扰动遮罩");
        public static GUIContent DisturbanceMaskRGBText = new GUIContent("使用透明贴图");
        public static GUIContent DisturbanceMaskUText = new GUIContent("扰动流动速度_U");
        public static GUIContent DisturbanceMaskVText = new GUIContent("扰动流动速度_V");

        #endregion

        #region DissolveText
        public static GUIContent UseDissolve2Text = new GUIContent("开启贴图溶解");
        public static GUIContent DissolveTex1Text = new GUIContent("溶解贴图");
        public static GUIContent DissolveTex1RGBText = new GUIContent("使用透明贴图");
        public static GUIContent UsePolarDissolve1Text = new GUIContent("开启极坐标");
        public static GUIContent DissolveRotatorText = new GUIContent("溶解贴图旋转");
        public static GUIContent DissolveTexU2Text = new GUIContent("溶解贴图流动速度_U");
        public static GUIContent DissolveTexV2Text = new GUIContent("溶解贴图流动速度_V");
        public static GUIContent DissolveIntensityCustom1z1Text = new GUIContent("溶解强度");
        public static GUIContent SoftaDissolve1Text = new GUIContent("软硬边强度");
        public static GUIContent DissolveWidthText = new GUIContent("溶解沟边宽度");
        public static GUIContent DissolveWidthColorText = new GUIContent("溶解沟边颜色");
        public static GUIContent UseParticleDissolveText = new GUIContent("开启粒子自定义属性2溶解X");
        //public static GUIContent DissolveDisturbanceText = new GUIContent("溶解贴图受扰动的强度(需要开始扰动属性)");

        public static GUIContent UseDissolveMaskText = new GUIContent("开启溶解贴图遮罩");
        public static GUIContent DissolveMaskText = new GUIContent("溶解贴图遮罩");
        public static GUIContent DissolveMaskRGBText = new GUIContent("使用透明贴图");
        public static GUIContent DissolveMaskADDText = new GUIContent("使用ADD模式");
        public static GUIContent DissolveMaskRotatorText = new GUIContent("溶解遮罩旋转");
        public static GUIContent DissolveMaskTexUText = new GUIContent("溶解遮罩流动速度_U");
        public static GUIContent DissolveMaskTexVText = new GUIContent("溶解遮罩流动速度_V");

        #endregion

        #region VertexOffset
        public static GUIContent UseVertexOffsetText = new GUIContent("开启顶点动画");
        public static GUIContent VertexOffsetAxialText = new GUIContent("顶点动画轴向XYZ");
        public static GUIContent VertexOffsetScaleText = new GUIContent("顶点动画强度");
        public static GUIContent VertexOffsetTillingUText = new GUIContent("噪波图TillingU");
        public static GUIContent VertexOffsetTillingVText = new GUIContent("噪波图TillingV");
        public static GUIContent VertexOffsetSpeedUText = new GUIContent("噪波图流动_U");
        public static GUIContent VertexOffsetSpeedVText = new GUIContent("噪波图流动_V");

        public static GUIContent UseVertexOffsetMaskText = new GUIContent("开启顶点动画遮罩");
        public static GUIContent VertexOffsetMaskText = new GUIContent("顶点动画遮罩");
        public static GUIContent VertexOffsetRGBText = new GUIContent("使用透明贴图");
        public static GUIContent VertexOffsetRotatorText = new GUIContent("顶点动画遮罩旋转");
        public static GUIContent VertexOffsetMaskScaleText = new GUIContent("顶点动画遮罩强度");
        #endregion

        #region DepthText
        public static GUIContent UseDepthText = new GUIContent("开启软粒子");
        public static GUIContent DepthFade1Text = new GUIContent("软粒子强度");
        #endregion

        public static GUIContent AlphaScaleText = new GUIContent("Alpha强度");
    }

    static readonly string ZWriteName = "_ZWrite";
    static readonly string CullModeName = "_CullMode";
    static readonly string Dst1Name = "_Dst1";

    #region MainTexName
    static readonly string MainColorName = "_MainColor";
    static readonly string MainTexName = "_MainTex";
    static readonly string UsePolarMainTexName = "_UsePolarMainTex";
    static readonly string MainTexRGBName = "_MainTexRGB";
    static readonly string MainTexRotatorName = "_MainTexRotator";
    static readonly string MaintexPowerName = "_MaintexPower";
    static readonly string MainTexU1Name = "_MainTexU1";
    static readonly string MainTexV1Name = "_MainTexV1";
    static readonly string UseParticleCustomName = "_UseParticleCustom";
    #endregion

    #region MainTexSecondName
    static readonly string UseMainTex2Name = "_UseMainTex2";
    static readonly string MainTex2Name = "_MainTex2";
    static readonly string Main2ColorName = "_Main2Color";
    static readonly string MainTex2RGBName = "_MainTex2RGB";
    static readonly string MainTex2RotatorName = "_MainTex2Rotator";
    static readonly string MainTex2PowerName = "_MainTex2Power";
    static readonly string MainTex2SpeedU1Name = "_MainTex2SpeedU";
    static readonly string MainTex2SpeedV1Name = "_MainTex2SpeedV";
    static readonly string UseTexBlendName = "_UseTexBlend";
    static readonly string TexBlendValueName = "_TexBlendValue";
    #endregion

    #region MaskName
    static readonly string UseMask01Name = "_UseMask01";
    static readonly string Mask1Name = "_Mask1";
    static readonly string Mask1RGBName = "_Mask1RGB";
    static readonly string Mask1PowerName = "_Mask1Power";
    static readonly string UsePolarMask1Name = "_UsePolarMask1";
    static readonly string MaskRotator1Name = "_MaskRotator1";
    static readonly string MaskSpeedU1Name = "_MaskSpeedU1";
    static readonly string MaskSpeedV1Name = "_MaskSpeedV1";
    static readonly string UseMaskParticleCustomName = "_UseMaskParticleCustom";

    static readonly string UseMask1And2Name = "_UseMask1And2";
    static readonly string Mask2Name = "_Mask2";
    static readonly string Mask2RGBName = "_Mask2RGB";
    //static readonly string UsePolarMask2Name = "_UsePolarMask2";
    static readonly string MaskRotator2Name = "_MaskRotator2";
    static readonly string Mask2SpeedUName = "_Mask2SpeedU";
    static readonly string Mask2SpeedVName = "_Mask2SpeedV";
    #endregion

    #region NoiseName
    static readonly string UseDisturbanceName = "_UseDisturbance";
    static readonly string DisturbanceTex1Name = "_DisturbanceTex1";
    static readonly string DisturbanceTex1RGBName = "_DisturbanceTex1RGB";
    static readonly string DisturbanceScaleUName = "_DisturbanceScaleU";
    static readonly string DisturbanceScaleVName = "_DisturbanceScaleV";
    static readonly string DisturbanceTex1UName = "_DisturbanceTex1U";
    static readonly string DisturbanceTex1VName = "_DisturbanceTex1V";

    static readonly string UseDisturbance1And2Name = "_UseDisturbance1And2";
    static readonly string DisturbanceTex2Name = "_DisturbanceTex2";
    static readonly string DisturbanceTex2RGBName = "_DisturbanceTex2RGB";
    static readonly string UseDisturbanceADDName = "_UseDisturbanceADD";
    static readonly string DisturbanceTex2UName = "_DisturbanceTex2U";
    static readonly string DisturbanceTex2VName = "_DisturbanceTex2V";

    static readonly string UseDisturbanceMaskName = "_UseDisturbanceMask";
    static readonly string DisturbanceMaskName = "_DisturbanceMask";
    static readonly string DisturbanceMaskRGBName = "_DisturbanceMaskRGB";
    static readonly string DisturbanceMaskUName = "_DisturbanceMaskU";
    static readonly string DisturbanceMaskVName = "_DisturbanceMaskV";

    #endregion

    #region DissolveName
    static readonly string UseDissolve2Name = "_UseDissolve2";
    static readonly string DissolveTex1Name = "_DissolveTex1";
    static readonly string DissolveTex1RGBName = "_DissolveTex1RGB";
    static readonly string UsePolarDissolve1Name = "_UsePolarDissolve1";
    static readonly string DissolveRotatorName = "_DissolveRotator";
    static readonly string DissolveTexU2Name = "_DissolveTex_U";
    static readonly string DissolveTexV2Name = "_DissolveTex_V";
    static readonly string DissolveIntensityCustom1z1Name = "_DissolveIntensityCustom1z1";
    static readonly string SoftaDissolve1Name = "_SoftaDissolve1";
    static readonly string DissolveWidthName = "_DissolveWidth";
    static readonly string DissolveWidthColorName = "_DissolveWidthColor";
    static readonly string UseParticleDissolveName = "_UseParticleDissolve";
    //static readonly string DissolveDisturbanceName = "_DissolveDisturbance";

    static readonly string UseDissolveMaskName = "_UseDissolveMask";
    static readonly string DissolveMaskName = "_DissolveMask";
    static readonly string DissolveMaskRGBName = "_DissolveMaskRGB";
    static readonly string DissolveMaskADDName = "_DissolveMaskADD";
    static readonly string DissolveMaskRotatorName = "_DissolveMaskRotator";
    static readonly string DissolveMaskTexUName = "_DissolveMaskTexU";
    static readonly string DissolveMaskTexVName = "_DissolveMaskTexV";
    #endregion

    #region VertexOffsetName
    static readonly string UseVertexOffsetName = "_UseVertexOffset";
    static readonly string VertexOffsetAxialName = "_VertexOffsetAxial";
    static readonly string VertexOffsetScaleName = "_VertexOffsetScale";
    static readonly string VertexOffsetTillingUName = "_VertexOffsetTillingU";
    static readonly string VertexOffsetTillingVName = "_VertexOffsetTillingV";
    static readonly string VertexOffsetSpeedUName = "_VertexOffsetSpeedU";
    static readonly string VertexOffsetSpeedVName = "_VertexOffsetSpeedV";

    static readonly string UseVertexOffsetMaskName = "_UseVertexOffsetMask";
    static readonly string VertexOffsetMaskName = "_VertexOffsetMask";
    static readonly string VertexOffsetRGBName = "_VertexOffsetRGB";
    static readonly string VertexOffsetRotatorName = "_VertexOffsetRotator";
    static readonly string VertexOffsetMaskScaleName = "_VertexOffsetMaskScale";
    #endregion

    #region DepthName
    static readonly string UseDepthName = "_UseDepth";
    static readonly string DepthFade1Name = "_DepthFade1";
    #endregion

    static readonly string AlphaScaleName = "_AlphaScale";


    MaterialProperty _ZWrite = null;
    MaterialProperty _CullMode = null;
    MaterialProperty _Dst1 = null;

    #region MainTexProperty
    MaterialProperty _MainColor = null;
    MaterialProperty _MainTex = null;
    MaterialProperty _UsePolarMainTex = null;
    MaterialProperty _MainTexRGB = null;
    MaterialProperty _MainTexRotator = null;
    MaterialProperty _MaintexPowerTex = null;
    MaterialProperty _MainTexU1 = null;
    MaterialProperty _MainTexV1 = null;
    MaterialProperty _UseParticleCustom = null;
    #endregion

    #region MainTexSecondProperty
    MaterialProperty _UseMainTex2 = null;
    MaterialProperty _MainTex2 = null;
    MaterialProperty _Main2Color = null;
    MaterialProperty _MainTex2RGB = null;
    MaterialProperty _MainTex2Rotator = null;
    MaterialProperty _MainTex2Power = null;
    MaterialProperty _MainTex2SpeedU1 = null;
    MaterialProperty _MainTex2SpeedV1 = null;
    MaterialProperty _UseTexBlend = null;
    MaterialProperty _TexBlendValue = null;
    #endregion

    #region MaskProperty
    MaterialProperty _UseMask01 = null;
    MaterialProperty _Mask1 = null;
    MaterialProperty _Mask1RGB = null;
    MaterialProperty _UsePolarMask1 = null;
    MaterialProperty _Mask1Power = null;
    MaterialProperty _MaskRotator1 = null;
    MaterialProperty _MaskSpeedU1 = null;
    MaterialProperty _MaskSpeedV1 = null;
    MaterialProperty _UseMaskParticleCustom = null;

    MaterialProperty _UseMask1And2 = null;
    MaterialProperty _Mask2 = null;
    MaterialProperty _Mask2RGB = null;
    //MaterialProperty _UsePolarMask2 = null;
    MaterialProperty _MaskRotator2 = null;
    MaterialProperty _Mask2SpeedU = null;
    MaterialProperty _Mask2SpeedV = null;
    #endregion

    #region NosieProperty
    MaterialProperty _UseDisturbance = null;
    MaterialProperty _DisturbanceTex1 = null;
    MaterialProperty _DisturbanceTex1RGB = null;
    MaterialProperty _DisturbanceScaleU = null;
    MaterialProperty _DisturbanceScaleV = null;
    MaterialProperty _DisturbanceTex1U = null;
    MaterialProperty _DisturbanceTex1V = null;

    //MaterialProperty _DisturbanceTexMask = null;

    MaterialProperty _UseDisturbance1And2 = null;
    MaterialProperty _DisturbanceTex2 = null;
    MaterialProperty _DisturbanceTex2RGB = null;
    MaterialProperty _UseDisturbanceADD = null;
    MaterialProperty _DisturbanceTex2U = null;
    MaterialProperty _DisturbanceTex2V = null;

    MaterialProperty _UseDisturbanceMask = null;
    MaterialProperty _DisturbanceMask = null;
    MaterialProperty _DisturbanceMaskRGB = null;
    MaterialProperty _DisturbanceMaskU = null;
    MaterialProperty _DisturbanceMaskV = null;
    #endregion

    #region DissolveProperty
    MaterialProperty _UseDissolve2 = null;
    MaterialProperty _DissolveTex1 = null;
    MaterialProperty _DissolveTex1RGB = null;
    MaterialProperty _UsePolarDissolve1 = null;
    MaterialProperty _DissolveRotator = null;
    MaterialProperty _DissolveTex_U = null;
    MaterialProperty _DissolveTex_V = null;
    MaterialProperty _DissolveIntensityCustom1z1 = null;
    MaterialProperty _SoftaDissolve1 = null;
    MaterialProperty _DissolveWidth = null;
    MaterialProperty _DissolveWidthColor = null;
    MaterialProperty _UseParticleDissolve = null;
    //MaterialProperty _DissolveDisturbance = null;

    MaterialProperty _UseDissolveMask = null;
    MaterialProperty _DissolveMask = null;
    MaterialProperty _DissolveMaskRGB = null;
    MaterialProperty _DissolveMaskADD = null;
    MaterialProperty _DissolveMaskRotator = null;
    MaterialProperty _DissolveMaskTexU = null;
    MaterialProperty _DissolveMaskTexV = null;
    #endregion

    #region VertexOffsetProperty
    MaterialProperty _UseVertexOffset = null;
    MaterialProperty _VertexOffsetAxial = null;
    MaterialProperty _VertexOffsetScale = null;
    MaterialProperty _VertexOffsetTillingU = null;
    MaterialProperty _VertexOffsetTillingV = null;
    MaterialProperty _VertexOffsetSpeedU = null;
    MaterialProperty _VertexOffsetSpeedV = null;

    MaterialProperty _UseVertexOffsetMask = null;
    MaterialProperty _VertexOffsetMask = null;
    MaterialProperty _VertexOffsetRGB = null;
    MaterialProperty _VertexOffsetRotator = null;
    MaterialProperty _VertexOffsetMaskScale = null;
    #endregion

    #region Depth
    MaterialProperty _UseDepth = null;
    MaterialProperty _DepthFade1 = null;
    #endregion

    MaterialProperty _AlphaScale = null;

    MaterialEditor matEditor;

    bool firstTimeApply = true;

    //折叠
    public static bool DepthFoldout;
    //public static bool AlphaFoldout;

    public void FindProperties(MaterialProperty[] props)
    {
        _ZWrite = FindProperty(ZWriteName, props);
        _CullMode = FindProperty(CullModeName, props);
        _Dst1 = FindProperty(Dst1Name, props);

        #region MainTexFindProperty
        _MainColor = FindProperty(MainColorName, props);
        _MainTex = FindProperty(MainTexName, props);
        _UsePolarMainTex = FindProperty(UsePolarMainTexName, props);
        _MainTexRGB = FindProperty(MainTexRGBName, props);
        _MainTexRotator = FindProperty(MainTexRotatorName, props);
        _MaintexPowerTex = FindProperty(MaintexPowerName, props);
        _MainTexU1 = FindProperty(MainTexU1Name, props);
        _MainTexV1 = FindProperty(MainTexV1Name, props);
        _UseParticleCustom = FindProperty(UseParticleCustomName, props);
        #endregion

        #region MainTexSecondFindProperty
        _UseMainTex2 = FindProperty(UseMainTex2Name, props);
        _Main2Color = FindProperty(Main2ColorName, props);
        _MainTex2 = FindProperty(MainTex2Name, props);
        _MainTex2RGB = FindProperty(MainTex2RGBName, props);
        _MainTex2Rotator = FindProperty(MainTex2RotatorName, props);
        _MainTex2Power = FindProperty(MainTex2PowerName, props);
        _MainTex2SpeedU1 = FindProperty(MainTex2SpeedU1Name, props);
        _MainTex2SpeedV1 = FindProperty(MainTex2SpeedV1Name, props);
        _MainTex2SpeedU1 = FindProperty(MainTex2SpeedU1Name, props);
        _MainTex2SpeedV1 = FindProperty(MainTex2SpeedV1Name, props);
        _UseTexBlend = FindProperty(UseTexBlendName, props);
        _TexBlendValue = FindProperty(TexBlendValueName, props);
        #endregion

        #region MaskFindProperty
        _UseMask01 = FindProperty(UseMask01Name, props);
        _Mask1 = FindProperty(Mask1Name, props);
        _UsePolarMask1 = FindProperty(UsePolarMask1Name, props);
        _Mask1RGB = FindProperty(Mask1RGBName, props);
        _Mask1Power = FindProperty(Mask1PowerName, props);
        _MaskRotator1 = FindProperty(MaskRotator1Name, props);
        _MaskSpeedU1 = FindProperty(MaskSpeedU1Name, props);
        _MaskSpeedV1 = FindProperty(MaskSpeedV1Name, props);
        _UseMaskParticleCustom = FindProperty(UseMaskParticleCustomName, props);

        _UseMask1And2 = FindProperty(UseMask1And2Name, props);
        _Mask2 = FindProperty(Mask2Name, props);
        _Mask2RGB = FindProperty(Mask2RGBName, props);
        //_UsePolarMask2 = FindProperty(UsePolarMask2Name, props);
        _MaskRotator2 = FindProperty(MaskRotator2Name, props);
        _Mask2SpeedU = FindProperty(Mask2SpeedUName, props);
        _Mask2SpeedV = FindProperty(Mask2SpeedVName, props);
        #endregion

        #region NoiseFindProperty
        _UseDisturbance = FindProperty(UseDisturbanceName, props);
        _DisturbanceTex1 = FindProperty(DisturbanceTex1Name, props);
        _DisturbanceTex1RGB = FindProperty(DisturbanceTex1RGBName, props);
        _DisturbanceScaleU = FindProperty(DisturbanceScaleUName, props);
        _DisturbanceScaleV = FindProperty(DisturbanceScaleVName, props);
        _DisturbanceTex1U = FindProperty(DisturbanceTex1UName, props);
        _DisturbanceTex1V = FindProperty(DisturbanceTex1VName, props);

        _UseDisturbance1And2 = FindProperty(UseDisturbance1And2Name, props);
        _DisturbanceTex2 = FindProperty(DisturbanceTex2Name, props);
        _DisturbanceTex2RGB = FindProperty(DisturbanceTex2RGBName, props);
        _UseDisturbanceADD = FindProperty(UseDisturbanceADDName, props);
        _DisturbanceTex2U = FindProperty(DisturbanceTex2UName, props);
        _DisturbanceTex2V = FindProperty(DisturbanceTex2VName, props);

        _UseDisturbanceMask = FindProperty(UseDisturbanceMaskName, props);
        _DisturbanceMask = FindProperty(DisturbanceMaskName, props);
        _DisturbanceMaskRGB = FindProperty(DisturbanceMaskRGBName, props);
        _DisturbanceMaskU = FindProperty(DisturbanceMaskUName, props);
        _DisturbanceMaskV = FindProperty(DisturbanceMaskVName, props);
        #endregion

        #region DissolveFindProperty
        _UseDissolve2 = FindProperty(UseDissolve2Name, props);
        _DissolveTex1 = FindProperty(DissolveTex1Name, props);
        _DissolveTex1RGB = FindProperty(DissolveTex1RGBName, props);
        _UsePolarDissolve1 = FindProperty(UsePolarDissolve1Name, props);
        _DissolveRotator = FindProperty(DissolveRotatorName, props);
        _DissolveTex_U = FindProperty(DissolveTexU2Name, props);
        _DissolveTex_V = FindProperty(DissolveTexV2Name, props);
        _DissolveIntensityCustom1z1 = FindProperty(DissolveIntensityCustom1z1Name, props);
        _SoftaDissolve1 = FindProperty(SoftaDissolve1Name, props);
        _DissolveWidth = FindProperty(DissolveWidthName, props);
        _DissolveWidthColor = FindProperty(DissolveWidthColorName, props);
        _UseParticleDissolve = FindProperty(UseParticleDissolveName, props);
        //_DissolveDisturbance = FindProperty(DissolveDisturbanceName, props);

        _UseDissolveMask = FindProperty(UseDissolveMaskName, props);
        _DissolveMask = FindProperty(DissolveMaskName, props);
        _DissolveMaskRGB = FindProperty(DissolveMaskRGBName, props);
        _DissolveMaskADD = FindProperty(DissolveMaskADDName, props);
        _DissolveMaskRotator = FindProperty(DissolveMaskRotatorName, props);
        _DissolveMaskTexU = FindProperty(DissolveMaskTexUName, props);
        _DissolveMaskTexV = FindProperty(DissolveMaskTexVName, props);

        #endregion

        #region VertexOffsetFindProperty
        _UseVertexOffset = FindProperty(UseVertexOffsetName, props);
        _VertexOffsetAxial = FindProperty(VertexOffsetAxialName, props);
        _VertexOffsetScale = FindProperty(VertexOffsetScaleName, props);
        _VertexOffsetTillingU = FindProperty(VertexOffsetTillingUName, props);
        _VertexOffsetTillingV = FindProperty(VertexOffsetTillingVName, props);
        _VertexOffsetSpeedU = FindProperty(VertexOffsetSpeedUName, props);
        _VertexOffsetSpeedV = FindProperty(VertexOffsetSpeedVName, props);

        _UseVertexOffsetMask = FindProperty(UseVertexOffsetMaskName, props);
        _VertexOffsetMask = FindProperty(VertexOffsetMaskName, props);
        _VertexOffsetRGB = FindProperty(VertexOffsetRGBName, props);
        _VertexOffsetRotator = FindProperty(VertexOffsetRotatorName, props);
        _VertexOffsetMaskScale = FindProperty(VertexOffsetMaskScaleName, props);
        #endregion

        #region Depth
        _UseDepth = FindProperty(UseDepthName, props);
        _DepthFade1 = FindProperty(DepthFade1Name, props);
        #endregion

        _AlphaScale = FindProperty(AlphaScaleName, props);

    }

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        FindProperties(properties);
        matEditor = materialEditor;

        Material mat = materialEditor.target as Material;
        if (firstTimeApply)
        {
            int renderQueue = mat.renderQueue;

            /*blendMode = CheckBlendMode(mat);
            SetupMaterialWithBlendMode(mat, blendMode);*/
            mat.renderQueue = renderQueue;
            firstTimeApply = false;
        }

        ShaderPropertiesGUI(mat, properties);
        materialEditor.RenderQueueField();

        EditorGUILayout.Space();
    }

    public void ShaderPropertiesGUI(Material material, MaterialProperty[] props)
    {
        EditorGUI.BeginChangeCheck();
        {
            matEditor.ShaderProperty(_ZWrite, Styles.ZWriteText.text);  //深度模式
            matEditor.ShaderProperty(_CullMode, Styles.CullModeText.text);  //开启双面
            matEditor.ShaderProperty(_Dst1, Styles.Dst1Text.text);  //混合模式

            #region MainTexGUI
            matEditor.ShaderProperty(_MainColor, Styles.MainColorText.text);  //第一层贴图颜色
            matEditor.ShaderProperty(_MainTex, Styles.MainTexText.text);  //第一层贴图
            matEditor.ShaderProperty(_UsePolarMainTex, Styles.UsePolarMainTexText.text);  //开启极坐标
            matEditor.ShaderProperty(_MainTexRGB, Styles.MainTexRGBText.text);  //贴图通道选择
            matEditor.ShaderProperty(_MaintexPowerTex, Styles.MaintexPowerText.text);  //第一层贴图对比度
            matEditor.ShaderProperty(_MainTexRotator, Styles.MainTexRotatorText.text);  //第一层贴图旋转
            matEditor.ShaderProperty(_MainTexU1, Styles.MainTexU1Text.text);  //第一层贴图流动_U
            matEditor.ShaderProperty(_MainTexV1, Styles.MainTexV1Text.text);  //第一层贴图流动_V
            matEditor.ShaderProperty(_UseParticleCustom, Styles.UseParticleCustomText.text);  //使用粒子自定义属性XY
            #endregion

            #region MainTexSecondGUI
            EditorGUILayout.BeginVertical("Button");
            {
                float nval;
                EditorGUI.BeginChangeCheck();

                nval = EditorGUILayout.ToggleLeft(Styles.UseMainTex2Text, _UseMainTex2.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                if (EditorGUI.EndChangeCheck())
                    _UseMainTex2.floatValue = nval;
            }
            if (_UseMainTex2.floatValue == 1)
            {
                material.EnableKeyword("_USEMAINTEX2_ON");
                matEditor.ShaderProperty(_Main2Color, Styles.Main2ColorText.text);  //第二层贴图颜色
                matEditor.ShaderProperty(_MainTex2, Styles.MainTex2Text.text);  //第二层贴图
                matEditor.ShaderProperty(_MainTex2RGB, Styles.MainTex2RGBText.text);  //第二层贴图通道
                matEditor.ShaderProperty(_MainTex2Rotator, Styles.MainTex2RotatorText.text);  //第二层贴图旋转
                matEditor.ShaderProperty(_MainTex2Power, Styles.MainTex2PowerText.text);  //第二层贴图对比度
                matEditor.ShaderProperty(_MainTex2SpeedU1, Styles.MainTex2SpeedU1Text.text);  //第二层贴图流动U
                matEditor.ShaderProperty(_MainTex2SpeedV1, Styles.MainTex2SpeedV1Text.text);  //第二层贴图流动V
                matEditor.ShaderProperty(_UseTexBlend, Styles.UseTexBlendText.text);  //第二层贴图流动U
                matEditor.ShaderProperty(_TexBlendValue, Styles.TexBlendValueText.text);  //第二层贴图流动V
            }
            else
            {
                material.DisableKeyword("_USEMAINTEX2_ON");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region MaskGUI
            EditorGUILayout.BeginVertical("Button");
            {
                float nval;
                EditorGUI.BeginChangeCheck();

                nval = EditorGUILayout.ToggleLeft(Styles.UseMask01Text, _UseMask01.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                if (EditorGUI.EndChangeCheck())
                    _UseMask01.floatValue = nval;
            }
            if (_UseMask01.floatValue == 1)
            {
                material.EnableKeyword("_USEMASK01_ON");

                matEditor.ShaderProperty(_Mask1, Styles.Mask1Text.text);    //遮罩第一层
                matEditor.ShaderProperty(_UsePolarMask1, Styles.UsePolarMask1Text.text);  //开启极坐标
                matEditor.ShaderProperty(_Mask1RGB, Styles.Mask1RGBText.text);    //遮罩第一层RGB
                matEditor.ShaderProperty(_Mask1Power, Styles.Mask1PowerText.text);  //遮罩第一层对比度
                matEditor.ShaderProperty(_MaskRotator1, Styles.MaskRotator1Text.text);    //贴图旋转
                matEditor.ShaderProperty(_MaskSpeedU1, Styles.MaskSpeedU1Text.text);    //遮罩流动速度U
                matEditor.ShaderProperty(_MaskSpeedV1, Styles.MaskSpeedV1Text.text);    //遮罩流动速度V
                matEditor.ShaderProperty(_UseMaskParticleCustom, Styles.UseMaskParticleCustomText.text);    //使用粒子自定义属性ZW控制速度

                //Mask2
                EditorGUILayout.BeginVertical("Button");
                {
                    float m_nval;
                    EditorGUI.BeginChangeCheck();

                    m_nval = EditorGUILayout.ToggleLeft(Styles.UseMask1And2Text, _UseMask1And2.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                    if (EditorGUI.EndChangeCheck())
                        _UseMask1And2.floatValue = m_nval;
                }
                if (_UseMask1And2.floatValue == 1)
                {
                    material.EnableKeyword("_USEMASK1AND2_OFF");

                    matEditor.ShaderProperty(_Mask2, Styles.Mask2Text.text);    //遮罩第二层
                    matEditor.ShaderProperty(_Mask2RGB, Styles.Mask2RGBText.text);    //遮罩第二层RGB
                    //matEditor.ShaderProperty(_UsePolarMask2, Styles.UsePolarMask2Text.text);    //开启极坐标
                    matEditor.ShaderProperty(_MaskRotator2, Styles.MaskRotator2Text.text);    //遮罩旋转旋转
                    matEditor.ShaderProperty(_Mask2SpeedU, Styles.Mask2SpeedUText.text);    //遮罩流动速度U
                    matEditor.ShaderProperty(_Mask2SpeedV, Styles.Mask2SpeedVText.text);    //遮罩流动速度V
                }
                else
                {
                    material.DisableKeyword("_USEMASK1AND2_OFF");
                }
                EditorGUILayout.EndVertical();
            }
            else
            {
                material.DisableKeyword("_USEMASK01_ON");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region NoiseGUI
            EditorGUILayout.BeginVertical("Button");
            {
                float m_nval;
                EditorGUI.BeginChangeCheck();

                m_nval = EditorGUILayout.ToggleLeft(Styles.UseDisturbanceText, _UseDisturbance.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                if (EditorGUI.EndChangeCheck())
                    _UseDisturbance.floatValue = m_nval;
            }
            if (_UseDisturbance.floatValue == 1)
            {
                material.EnableKeyword("_USEDISTURBANCE_ON");

                matEditor.ShaderProperty(_DisturbanceTex1, Styles.DisturbanceTex1Text.text);    //扰动贴图第一层
                matEditor.ShaderProperty(_DisturbanceTex1RGB, Styles.DisturbanceTex1RGBText.text);    //扰动贴图第一层RGB
                matEditor.ShaderProperty(_DisturbanceScaleU, Styles.DisturbanceScaleUText.text);    //扰动强度
                matEditor.ShaderProperty(_DisturbanceScaleV, Styles.DisturbanceScaleVText.text);    //扰动强度
                matEditor.ShaderProperty(_DisturbanceTex1U, Styles.DisturbanceTex1UText.text);    //扰动速度1_U
                matEditor.ShaderProperty(_DisturbanceTex1V, Styles.DisturbanceTex1VText.text);    //扰动速度1_V   

                EditorGUILayout.BeginVertical("Button");
                {
                    float m_nval;
                    EditorGUI.BeginChangeCheck();

                    m_nval = EditorGUILayout.ToggleLeft(Styles.UseDisturbance1And2Text, _UseDisturbance1And2.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                    if (EditorGUI.EndChangeCheck())
                        _UseDisturbance1And2.floatValue = m_nval;
                }
                if (_UseDisturbance1And2.floatValue == 1)
                {
                    material.EnableKeyword("_UseDisturbance1And2_OFF");

                    matEditor.ShaderProperty(_DisturbanceTex2, Styles.DisturbanceTex2Text.text);    //开启扰动第二层
                    matEditor.ShaderProperty(_DisturbanceTex2RGB, Styles.DisturbanceTex2RGBText.text);    //开启扰动第二层RGB
                    matEditor.ShaderProperty(_UseDisturbanceADD, Styles.UseDisturbanceADDText.text);    //开启扰动叠加ADD
                    matEditor.ShaderProperty(_DisturbanceTex2U, Styles.DisturbanceTex2UText.text);    //扰动速度2_U
                    matEditor.ShaderProperty(_DisturbanceTex2V, Styles.DisturbanceTex2VText.text);    //扰动速度2_V 

                    EditorGUILayout.BeginVertical("Button");
                    {
                        float m_nval;
                        EditorGUI.BeginChangeCheck();

                        m_nval = EditorGUILayout.ToggleLeft(Styles.UseDisturbanceMaskText, _UseDisturbanceMask.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                        if (EditorGUI.EndChangeCheck())
                            _UseDisturbanceMask.floatValue = m_nval;
                    }
                    if (_UseDisturbanceMask.floatValue == 1)
                    {
                        material.EnableKeyword("_UseDisturbanceMask_OFF");

                        matEditor.ShaderProperty(_DisturbanceMask, Styles.DisturbanceMaskText.text);    //开启扰动遮罩
                        matEditor.ShaderProperty(_DisturbanceMaskRGB, Styles.DisturbanceMaskRGBText.text);    //开启扰动遮罩RGB
                        matEditor.ShaderProperty(_DisturbanceMaskU, Styles.DisturbanceMaskUText.text);    //扰动速度2_U
                        matEditor.ShaderProperty(_DisturbanceMaskV, Styles.DisturbanceMaskVText.text);    //扰动速度2_V 
                    }
                    else
                    {
                        material.DisableKeyword("_UseDisturbancMask_OFF");
                    }
                    EditorGUILayout.EndVertical();
                }
                else
                {
                    material.DisableKeyword("_UseDisturbance1And2_OFF");
                }
                EditorGUILayout.EndVertical();
            }
            else
            {
                material.DisableKeyword("_USEDISTURBANCE_ON");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region DissolveGUI
            EditorGUILayout.BeginVertical("Button");
            {
                float m_nval;
                EditorGUI.BeginChangeCheck();

                m_nval = EditorGUILayout.ToggleLeft(Styles.UseDissolve2Text, _UseDissolve2.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                if (EditorGUI.EndChangeCheck())
                    _UseDissolve2.floatValue = m_nval;
            }
            if (_UseDissolve2.floatValue == 1)
            {
                material.EnableKeyword("_USEDISSOLVE2_ON");

                matEditor.ShaderProperty(_DissolveTex1, Styles.DissolveTex1Text.text);  //溶解贴图
                matEditor.ShaderProperty(_DissolveTex1RGB, Styles.DissolveTex1RGBText.text);  //溶解贴图RGB
                matEditor.ShaderProperty(_UsePolarDissolve1, Styles.UsePolarDissolve1Text.text);  //开启极坐标
                matEditor.ShaderProperty(_DissolveRotator, Styles.DissolveRotatorText.text);  //溶解图对比度
                matEditor.ShaderProperty(_DissolveTex_U, Styles.DissolveTexU2Text.text);  //溶解贴图流动_U
                matEditor.ShaderProperty(_DissolveTex_V, Styles.DissolveTexV2Text.text);  //溶解贴图流动_V
                matEditor.ShaderProperty(_DissolveIntensityCustom1z1, Styles.DissolveIntensityCustom1z1Text.text);  //溶解强度
                matEditor.ShaderProperty(_SoftaDissolve1, Styles.SoftaDissolve1Text.text);  //软硬边强度
                matEditor.ShaderProperty(_DissolveWidth, Styles.DissolveWidthText.text);  //溶解沟边宽度
                matEditor.ShaderProperty(_DissolveWidthColor, Styles.DissolveWidthColorText.text);  //溶解沟边颜色
                matEditor.ShaderProperty(_UseParticleDissolve, Styles.UseParticleDissolveText.text);  //开启粒子自定义属性2溶解X
                //matEditor.ShaderProperty(_DissolveDisturbance, Styles.DissolveDisturbanceText.text);  //溶解贴图受扰动的强度(需要开始扰动属性)

                //DissolveMask
                EditorGUILayout.BeginVertical("Button");
                {
                    float m_nval;
                    EditorGUI.BeginChangeCheck();

                    m_nval = EditorGUILayout.ToggleLeft(Styles.UseDissolveMaskText, _UseDissolveMask.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                    if (EditorGUI.EndChangeCheck())
                        _UseDissolveMask.floatValue = m_nval;
                }
                if (_UseDissolveMask.floatValue == 1)
                {
                    material.EnableKeyword("_USEDISSOLVEMASK_ON");

                    matEditor.ShaderProperty(_DissolveMask, Styles.DissolveMaskText.text);  //溶解遮罩
                    matEditor.ShaderProperty(_DissolveMaskRGB, Styles.DissolveMaskRGBText.text);  //溶解遮罩RGB
                    matEditor.ShaderProperty(_DissolveMaskADD, Styles.DissolveMaskADDText.text);  //溶解遮罩RGB
                    matEditor.ShaderProperty(_DissolveMaskRotator, Styles.DissolveMaskRotatorText.text);  //开启极坐标
                    matEditor.ShaderProperty(_DissolveMaskTexU, Styles.DissolveMaskTexUText.text);  //溶解遮罩贴图流动_U
                    matEditor.ShaderProperty(_DissolveMaskTexV, Styles.DissolveMaskTexVText.text);  //溶解遮罩贴图流动_V
                }
                else
                {
                    material.DisableKeyword("_USEDISSOLVEMASK_ON");
                }
                EditorGUILayout.EndVertical();

            }
            else
            {
                material.DisableKeyword("_USEDISSOLVE2_ON");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region VextexOffsetGUI
            EditorGUILayout.BeginVertical("Button");
                {
                    float nval;
                    EditorGUI.BeginChangeCheck();

                    nval = EditorGUILayout.ToggleLeft(Styles.UseVertexOffsetText, _UseVertexOffset.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                    if (EditorGUI.EndChangeCheck())
                        _UseVertexOffset.floatValue = nval;
                }
                if (_UseVertexOffset.floatValue == 1)
                {
                    material.EnableKeyword("_USEVERTEXOFFSET_ON");

                    matEditor.ShaderProperty(_VertexOffsetAxial, Styles.VertexOffsetAxialText.text);  //顶点动画轴向XYZ
                    matEditor.ShaderProperty(_VertexOffsetScale, Styles.VertexOffsetScaleText.text);  //顶点动画强度
                    matEditor.ShaderProperty(_VertexOffsetTillingU, Styles.VertexOffsetTillingUText.text);  //噪波图TillingU
                    matEditor.ShaderProperty(_VertexOffsetTillingV, Styles.VertexOffsetTillingVText.text);  //噪波图TillingV
                    matEditor.ShaderProperty(_VertexOffsetSpeedU, Styles.VertexOffsetSpeedUText.text);  //噪波图流动U
                    matEditor.ShaderProperty(_VertexOffsetSpeedV, Styles.VertexOffsetSpeedVText.text);  //噪波图流动v

                    EditorGUILayout.BeginVertical("Button");
                    {
                         float m_nval;
                         EditorGUI.BeginChangeCheck();

                         m_nval = EditorGUILayout.ToggleLeft(Styles.UseVertexOffsetMaskText, _UseVertexOffsetMask.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                         if (EditorGUI.EndChangeCheck())
                            _UseVertexOffsetMask.floatValue = m_nval;
                    }
                if (_UseVertexOffsetMask.floatValue == 1)
                {
                    material.EnableKeyword("_USEVERTEXOFFSETMASK_ON");
                    matEditor.ShaderProperty(_VertexOffsetMask, Styles.VertexOffsetMaskText.text);  //顶点动画遮罩
                    matEditor.ShaderProperty(_VertexOffsetRGB, Styles.VertexOffsetRGBText.text);  //顶点动画遮罩通道选择
                    matEditor.ShaderProperty(_VertexOffsetRotator, Styles.VertexOffsetRotatorText.text);  //顶点动画遮罩旋转
                    matEditor.ShaderProperty(_VertexOffsetMaskScale, Styles.VertexOffsetMaskScaleText.text);  //顶点动画遮罩强度
                }
                else
                {
                    material.DisableKeyword("_USEVERTEXOFFSETMASK_ON");
                }
                EditorGUILayout.EndVertical();
                }
                else
                {
                    material.DisableKeyword("_USEVERTEXOFFSET_ON");
                }
                EditorGUILayout.EndVertical();
                #endregion

            #region DepthGUI
            EditorGUILayout.BeginVertical("Button");
            {
                {
                    float nval;
                    EditorGUI.BeginChangeCheck();

                    nval = EditorGUILayout.ToggleLeft(Styles.UseDepthText, _UseDepth.floatValue == 1, EditorStyles.boldLabel, GUILayout.Width(EditorGUIUtility.currentViewWidth - 60)) ? 1 : 0;
                    if (EditorGUI.EndChangeCheck())
                        _UseDepth.floatValue = nval;
                }
                if (_UseDepth.floatValue == 1)
                {
                    material.EnableKeyword("_USEDEPTH_ON");

                    matEditor.ShaderProperty(_DepthFade1, Styles.DepthFade1Text.text);  //软粒子强度
                }
                else
                {
                    material.DisableKeyword("_USEDEPTH_ON");
                }
                EditorGUILayout.EndVertical();
                #endregion

                matEditor.ShaderProperty(_AlphaScale, Styles.AlphaScaleText.text);
            }
            EditorGUI.EndChangeCheck();
            EditorGUILayout.Space();
        }
    }
}
