/* originally from https://gist.github.com/fieldOfView/5106319
 made few changes martin@muimota.net */
 
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform vec2 resolution;
uniform sampler2D texture;

uniform float fov ;
uniform float yaw ;
uniform float pitch;

const float M_PI = 3.141592653589793238462643;
const float M_TWOPI = 6.283185307179586476925286;

mat3 rotationMatrix(vec2 euler)
{
  vec2 se = sin(euler);
  vec2 ce = cos(euler);

  return 	mat3(ce.x, 0, -se.x,	0, 1, 0,		se.x, 0, ce.x) *
      mat3(1, 0, 0,			0, ce.y, -se.y,	0, se.y, ce.y);
}

vec3 toCartesian( vec2 st )
{
  return normalize(vec3(st.x, -st.y, 0.5 / tan(0.5 * radians(fov))));
}

vec2 toSpherical(vec3 cartesianCoord)
{
  vec2 st = vec2(
    atan(cartesianCoord.x, cartesianCoord.z),
    acos(cartesianCoord.y)
  );
  if(st.x < 0.0)
    st.x += M_TWOPI;

  return st;
}

void main(void)
{
  vec2 sphericalCoord = gl_FragCoord.xy / resolution - vec2(0.5);
  sphericalCoord.y *= -resolution.y / resolution.x;

  vec3 cartesianCoord = rotationMatrix(radians(vec2(yaw + 180., -pitch))) * toCartesian(sphericalCoord);

  gl_FragColor = texture2D(texture, toSpherical( cartesianCoord )/vec2(M_TWOPI, M_PI));
}
