Shader "p4!n3-TECH/BasicDiffuse [Lighting]"
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
		#pragma surface surf BasicLambert
	
		sampler2D _MainTex;
		fixed4 _MainTint;
		
		struct Input
		{
			float2 uv_MainTex;
		};

		inline float4 LightingBasicLambert(SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
			float difLight = max(0, dot(s.Normal, lightDir));

			float4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (difLight * atten * 2);
			c.a = s.Alpha;
			return c;
		}

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
