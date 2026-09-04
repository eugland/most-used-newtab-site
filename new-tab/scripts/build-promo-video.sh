#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
site_dir="$(cd "${script_dir}/.." && pwd)"
images_dir="${site_dir}/images"
output="${images_dir}/new-tab-promo-dynamic-12s.mp4"

regular_font="$(fc-match -f '%{file}' 'Noto Sans:style=Regular')"
bold_font="$(fc-match -f '%{file}' 'Noto Sans:style=Bold')"

ffmpeg -y -hide_banner \
  -loop 1 -framerate 30 -t 2.2 -i "${images_dir}/screenshot-1-overview.png" \
  -loop 1 -framerate 30 -t 2.4 -i "${images_dir}/screenshot-2-ranking.png" \
  -loop 1 -framerate 30 -t 2.2 -i "${images_dir}/screenshot-3-customize.png" \
  -loop 1 -framerate 30 -t 2.2 -i "${images_dir}/screenshot-4-settings.png" \
  -loop 1 -framerate 30 -t 2.0 -i "${images_dir}/screenshot-5-dark-private.png" \
  -loop 1 -framerate 30 -t 2.0 -i "${images_dir}/icon-128.png" \
  -ss 24.65 -t 12 -i "${site_dir}/audio/mixkit-close-up.mp3" \
  -filter_complex "
    [0:v]split=2[s0bg][s0fg];
    [s0bg]scale=1920:1200:force_original_aspect_ratio=increase,crop=1920:1080,gblur=sigma=55,eq=brightness=-0.10:saturation=0.75[s0base];
    [s0fg]scale=1536:960[s0card];
    [s0base]drawbox=x=178:y=58:w=1564:h=988:color=white@0.25:t=5[s0frame];
    [s0frame][s0card]overlay=192:72,
      drawbox=x=452:y=865:w=1016:h=108:color=0x101828@0.90:t=fill,
      drawtext=fontfile='${bold_font}':text='Open a new tab. Go where you actually go.':fontcolor=white:fontsize=43:x=(w-text_w)/2:y=889,
      zoompan=z='min(zoom+0.00065,1.045)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1920x1080:fps=30,
      trim=duration=2.2,setpts=PTS-STARTPTS[s0];

    [1:v]crop=900:610:0:0,scale=1920:1301,crop=1920:1080:0:0,
      drawbox=x=20:y=22:w=650:h=92:color=0x1a73e8@0.16:t=fill,
      drawbox=x=20:y=22:w=650:h=92:color=0x1a73e8:t=5,
      drawtext=fontfile='${bold_font}':text='20 sites  •  last 3 months':fontcolor=0x1558b0:fontsize=36:x=54:y=49,
      drawbox=x=735:y=885:w=1115:h=120:color=0x101828@0.92:t=fill,
      drawtext=fontfile='${bold_font}':text='Your most-used sites rise automatically':fontcolor=white:fontsize=43:x=785:y=912,
      zoompan=z='min(zoom+0.00055,1.04)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1920x1080:fps=30,
      trim=duration=2.4,setpts=PTS-STARTPTS[s1];

    [2:v]crop=720:520:55:100,scale=1495:1080,
      pad=1920:1080:0:0:color=0xf4f7fb,
      drawbox=x=84:y=288:w=494:h=400:color=0x1a73e8@0.10:t=fill,
      drawbox=x=84:y=288:w=494:h=400:color=0x1a73e8:t=6,
      drawtext=fontfile='${bold_font}':text='PIN':fontcolor=0x1a73e8:fontsize=34:x=135:y=220,
      drawtext=fontfile='${bold_font}':text='HIDE':fontcolor=0xe5484d:fontsize=34:x=365:y=220,
      drawtext=fontfile='${bold_font}':text='Pin what matters.':fontcolor=0x202124:fontsize=45:x=1518:y=355,
      drawtext=fontfile='${bold_font}':text='Hide the rest.':fontcolor=0x202124:fontsize=45:x=1518:y=420,
      drawtext=fontfile='${regular_font}':text='Your shortcuts stay':fontcolor=0x5f6368:fontsize=29:x=1518:y=535,
      drawtext=fontfile='${regular_font}':text='under your control.':fontcolor=0x5f6368:fontsize=29:x=1518:y=578,
      zoompan=z='min(zoom+0.00035,1.025)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1920x1080:fps=30,
      trim=duration=2.2,setpts=PTS-STARTPTS[s2];

    [3:v]scale=1920:1200,crop=1920:1080:0:60,
      drawbox=x=494:y=138:w=932:h=764:color=0x1a73e8@0.12:t=fill,
      drawbox=x=494:y=138:w=932:h=764:color=0x1a73e8:t=6,
      drawbox=x=585:y=925:w=750:h=92:color=0x101828@0.92:t=fill,
      drawtext=fontfile='${bold_font}':text='Simple controls. No dashboard clutter.':fontcolor=white:fontsize=39:x=(w-text_w)/2:y=949,
      zoompan=z='min(zoom+0.0012,1.085)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1920x1080:fps=30,
      trim=duration=2.2,setpts=PTS-STARTPTS[s3];

    [0:v]crop=640:800:0:0,scale=960:1200,crop=960:1080:0:60[left];
    [4:v]crop=640:800:640:0,scale=960:1200,crop=960:1080:0:60[right];
    [left][right]hstack=inputs=2,
      drawbox=x=952:y=0:w=16:h=1080:color=0x1a73e8:t=fill,
      drawtext=fontfile='${bold_font}':text='LIGHT':fontcolor=0x202124:fontsize=34:x=64:y=64,
      drawtext=fontfile='${bold_font}':text='DARK':fontcolor=white:fontsize=34:x=1760:y=64,
      drawbox=x=550:y=895:w=820:h=108:color=0x101828@0.92:t=fill,
      drawtext=fontfile='${bold_font}':text='Follows your system automatically':fontcolor=white:fontsize=42:x=(w-text_w)/2:y=921,
      trim=duration=2.0,setpts=PTS-STARTPTS[s4];

    color=c=0xf5f7fb:s=1920x1080:r=30:d=2.0[endbg];
    [5:v]scale=158:158[icon];
    [endbg][icon]overlay=x=(W-w)/2:y=180,
      drawtext=fontfile='${bold_font}':text='New Tab\: More Recent Visited':fontcolor=0x202124:fontsize=68:x=(w-text_w)/2:y=390,
      drawtext=fontfile='${regular_font}':text='Private. Local. Instantly useful.':fontcolor=0x5f6368:fontsize=39:x=(w-text_w)/2:y=502,
      drawbox=x=755:y=606:w=410:h=78:color=0x1a73e8:t=fill,
      drawtext=fontfile='${bold_font}':text='Make every new tab count':fontcolor=white:fontsize=31:x=(w-text_w)/2:y=625,
      fade=t=out:st=1.72:d=0.28,trim=duration=2.0,setpts=PTS-STARTPTS[s5];

    [s0][s1]xfade=transition=slideleft:duration=0.2:offset=2.0[x1];
    [x1][s2]xfade=transition=slideup:duration=0.2:offset=4.2[x2];
    [x2][s3]xfade=transition=zoomin:duration=0.2:offset=6.2[x3];
    [x3][s4]xfade=transition=wiperight:duration=0.2:offset=8.2[x4];
    [x4][s5]xfade=transition=fade:duration=0.2:offset=10.0,format=yuv420p[outv];

    [6:a]atrim=duration=12,asetpts=PTS-STARTPTS,
      afade=t=in:st=0:d=0.18,afade=t=out:st=11.4:d=0.6,volume=0.9[outa]
  " \
  -map "[outv]" -map "[outa]" -r 30 \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -c:a aac -b:a 160k -ar 48000 -movflags +faststart -t 12 "${output}"

echo "Created ${output}"
