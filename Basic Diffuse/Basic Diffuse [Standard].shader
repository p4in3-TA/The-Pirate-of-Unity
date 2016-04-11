Shader "p4!n3-TECH/BasicDiffuse"
{
	Properties
	{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_MainTint("Tint Color", Color) = (1, 1, 1, 1)
	}

	SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert
	
		sampler2D _MainTex;
		fixed4 _MainTint;
		
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb * _MainTint;
			o.Alpha = c.a;
		}

		ENDCG
	}

	FallBack "Diffuse"
}
