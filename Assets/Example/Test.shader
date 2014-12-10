﻿Shader "Custom/Test" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;

			struct Input {
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			Input vert(Input IN) {
				Input OUT;
				OUT.vertex = mul(UNITY_MATRIX_MVP, IN.vertex);
				OUT.uv = TRANSFORM_TEX(IN.uv, _MainTex);
				return OUT;
			}
			float4 frag(Input IN) : COLOR {
				return tex2D(_MainTex, IN.uv);
			}
			ENDCG
		}
	} 
}
