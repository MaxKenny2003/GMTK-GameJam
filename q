[33mcommit 3666d0d639233b58b750c034b0aa99f12ccae2c2[m
Merge: 5fe0d61 a073c82
Author: realbraxeus <tedin2002@gmail.com>
Date:   Sun Jul 26 00:33:23 2026 -0400

    On main: !!GitHub_Desktop<main>

[1mdiff --cc gmtk-2026-game-jam/assets/3D/Environment/Building1/textures/Building.002.png.import[m
[1mindex 8cd1fb7,8cd1fb7..29f16ed[m
[1m--- a/gmtk-2026-game-jam/assets/3D/Environment/Building1/textures/Building.002.png.import[m
[1m+++ b/gmtk-2026-game-jam/assets/3D/Environment/Building1/textures/Building.002.png.import[m
[36m@@@ -3,19 -3,19 +3,20 @@@[m
  importer="texture"[m
  type="CompressedTexture2D"[m
  uid="uid://cfi5a2gqtv5mu"[m
[31m--path="res://.godot/imported/Building.002.png-dd7e3e749ac0228a1360552f9cba9d25.ctex"[m
[32m++path.s3tc="res://.godot/imported/Building.002.png-dd7e3e749ac0228a1360552f9cba9d25.s3tc.ctex"[m
  metadata={[m
[31m--"vram_texture": false[m
[32m++"imported_formats": ["s3tc_bptc"],[m
[32m++"vram_texture": true[m
  }[m
  [m
  [deps][m
  [m
  source_file="res://assets/3D/Environment/Building1/textures/Building.002.png"[m
[31m--dest_files=["res://.godot/imported/Building.002.png-dd7e3e749ac0228a1360552f9cba9d25.ctex"][m
[32m++dest_files=["res://.godot/imported/Building.002.png-dd7e3e749ac0228a1360552f9cba9d25.s3tc.ctex"][m
  [m
  [params][m
  [m
[31m--compress/mode=0[m
[32m++compress/mode=2[m
  compress/high_quality=false[m
  compress/lossy_quality=0.7[m
  compress/uastc_level=0[m
[36m@@@ -23,7 -23,7 +24,7 @@@[m [mcompress/rdo_quality_loss=0.[m
  compress/hdr_compression=1[m
  compress/normal_map=0[m
  compress/channel_pack=0[m
[31m--mipmaps/generate=false[m
[32m++mipmaps/generate=true[m
  mipmaps/limit=-1[m
  roughness/mode=0[m
  roughness/src_normal=""[m
[36m@@@ -37,4 -37,4 +38,4 @@@[m [mprocess/normal_map_invert_y=fals[m
  process/hdr_as_srgb=false[m
  process/hdr_clamp_exposure=false[m
  process/size_limit=0[m
[31m--detect_3d/compress_to=1[m
[32m++detect_3d/compress_to=0[m
[1mdiff --cc gmtk-2026-game-jam/default_bus_layout.tres[m
[1mindex 2634332,2634332..2f2a040[m
[1m--- a/gmtk-2026-game-jam/default_bus_layout.tres[m
[1m+++ b/gmtk-2026-game-jam/default_bus_layout.tres[m
[36m@@@ -7,3 -7,3 +7,9 @@@[m [mbus/1/mute = fals[m
  bus/1/bypass_fx = false[m
  bus/1/volume_db = -6.91795[m
  bus/1/send = &"Master"[m
[32m++bus/2/name = &"Effects"[m
[32m++bus/2/solo = false[m
[32m++bus/2/mute = false[m
[32m++bus/2/bypass_fx = false[m
[32m++bus/2/volume_db = 0.0[m
[32m++bus/2/send = &"Master"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/contract_drag/contract_drag.tscn[m
[1mindex d6e11b3,d6e11b3..94ddc25[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/contract_drag/contract_drag.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/contract_drag/contract_drag.tscn[m
[36m@@@ -4,6 -4,6 +4,7 @@@[m
  [ext_resource type="Texture2D" uid="uid://dmdo6gq3sxgoj" path="res://assets/2D/biggersheet.png" id="2_ryut0"][m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_t2x1v"][m
  [ext_resource type="FontFile" uid="uid://bm3qiosuy6an7" path="res://fonts/PixelatedEleganceRegular-ovawB.ttf" id="3_e0wpp"][m
[32m++[ext_resource type="AudioStream" uid="uid://86hexnadsj00" path="res://assets/Audio/paper_slide.mp3" id="5_t2x1v"][m
  [m
  [sub_resource type="RectangleShape2D" id="RectangleShape2D_oiw2g"][m
  size = Vector2(194, 648)[m
[36m@@@ -157,4 -157,4 +158,8 @@@[m [mvertical_alignment = [m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=717916039][m
  [m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=1476891795][m
[32m++stream = ExtResource("5_t2x1v")[m
[32m++bus = &"Effects"[m
[32m++[m
  [connection signal="area_exited" from="paper/paper_area" to="." method="_on_paper_area_area_exited"][m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/flyswatter/fly.tscn[m
[1mindex 7731df4,7731df4..97d024c[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/flyswatter/fly.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/flyswatter/fly.tscn[m
[36m@@@ -3,7 -3,7 +3,7 @@@[m
  [ext_resource type="Script" uid="uid://d0uiwsdtacie5" path="res://scripts/microgames/flyswatter/fly.gd" id="1_1saah"][m
  [ext_resource type="Texture2D" uid="uid://dolaw2iw2d5pj" path="res://assets/2D/Fly.png" id="2_p2dqj"][m
  [ext_resource type="Texture2D" uid="uid://710xggpolnmr" path="res://assets/2D/Fly-moving.png" id="3_cuh3i"][m
[31m--[ext_resource type="AudioStream" uid="uid://btdp17rp8kpa1" path="res://assets/Audio/fly_buzzing.wav" id="4_3sca0"][m
[32m++[ext_resource type="AudioStream" uid="uid://dpl2kvjospgqg" path="res://assets/Audio/fly_buzz.mp3" id="4_1saah"][m
  [m
  [sub_resource type="SpriteFrames" id="SpriteFrames_w3rpa"][m
  animations = [{[m
[36m@@@ -43,8 -43,8 +43,10 @@@[m [mwait_time = 0.[m
  autostart = true[m
  [m
  [node name="AudioStreamPlayer" type="AudioStreamPlayer" parent="." unique_id=1768922856][m
[31m--stream = ExtResource("4_3sca0")[m
[32m++stream = ExtResource("4_1saah")[m
[32m++volume_db = -21.273[m
  max_polyphony = 8[m
[32m++bus = &"Effects"[m
  [m
  [connection signal="timeout" from="Timer" to="." method="_on_timer_timeout"][m
  [connection signal="finished" from="AudioStreamPlayer" to="." method="_on_audio_stream_player_finished"][m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/flyswatter/flyswatter.tscn[m
[1mindex 4ec721b,4ec721b..765ed1e[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/flyswatter/flyswatter.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/flyswatter/flyswatter.tscn[m
[36m@@@ -5,6 -5,6 +5,7 @@@[m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_nbfi0"][m
  [ext_resource type="Texture2D" uid="uid://cd73tt7kjmlk0" path="res://assets/2D/Hands-smack.png" id="5_heu8p"][m
  [ext_resource type="Texture2D" uid="uid://7iji6orhekwq" path="res://assets/2D/Hands.png" id="6_5tkqi"][m
[32m++[ext_resource type="AudioStream" uid="uid://dprjbqw3om6ku" path="res://assets/Audio/squish.mp3" id="6_6yttg"][m
  [m
  [sub_resource type="RectangleShape2D" id="RectangleShape2D_lbxwk"][m
  size = Vector2(20, 657)[m
[36m@@@ -113,3 -113,3 +114,7 @@@[m [mtheme_override_font_sizes/font_size = 1[m
  text = "You're Winner!"[m
  horizontal_alignment = 1[m
  vertical_alignment = 1[m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=1764829269][m
[32m++stream = ExtResource("6_6yttg")[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/papertilt/paper_tilt.tscn[m
[1mindex 4b9a5b4,4b9a5b4..3ea7c25[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/papertilt/paper_tilt.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/papertilt/paper_tilt.tscn[m
[36m@@@ -6,6 -6,6 +6,7 @@@[m
  [ext_resource type="Texture2D" uid="uid://bbgdmvdysn7ls" path="res://assets/2D/paper_stack.png" id="3_vgvjy"][m
  [ext_resource type="Texture2D" uid="uid://bujoqcvw75cqw" path="res://assets/2D/paper_stack_hands.png" id="4_4qke1"][m
  [ext_resource type="Texture2D" uid="uid://gxy13nt5tkhe" path="res://assets/Particles/paper_particle.png" id="5_vgvjy"][m
[32m++[ext_resource type="AudioStream" uid="uid://ck0gbj0pkam6j" path="res://assets/Audio/paper_flutter.mp3" id="7_2soxf"][m
  [m
  [sub_resource type="AtlasTexture" id="AtlasTexture_2soxf"][m
  atlas = ExtResource("3_vgvjy")[m
[36m@@@ -109,3 -109,3 +110,8 @@@[m [mhorizontal_alignment = [m
  vertical_alignment = 1[m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=1589604636][m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=260664215][m
[32m++stream = ExtResource("7_2soxf")[m
[32m++volume_db = 6.656[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/plugpanic/plug_panic.tscn[m
[1mindex 41304ad,41304ad..59be10a[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/plugpanic/plug_panic.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/plugpanic/plug_panic.tscn[m
[36m@@@ -4,6 -4,6 +4,7 @@@[m
  [ext_resource type="Script" uid="uid://bu7khvy2d8psh" path="res://scripts/microgames/plugpanic/plug_panic.gd" id="1_weyo6"][m
  [ext_resource type="Texture2D" uid="uid://b8l30l2y6f82y" path="res://assets/2D/plug.png" id="2_weyo6"][m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_yanuy"][m
[32m++[ext_resource type="AudioStream" uid="uid://dpltljq8i5xny" path="res://assets/Audio/plug.mp3" id="5_s3xsh"][m
  [m
  [sub_resource type="CapsuleShape2D" id="CapsuleShape2D_q4mm8"][m
  radius = 2.25[m
[36m@@@ -100,3 -100,3 +101,8 @@@[m [mhorizontal_alignment = [m
  vertical_alignment = 1[m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=724570741][m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=607920709][m
[32m++stream = ExtResource("5_s3xsh")[m
[32m++volume_db = 7.488[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/popupparty/popup_party.tscn[m
[1mindex 8cd7197,8cd7197..61b0f15[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/popupparty/popup_party.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/popupparty/popup_party.tscn[m
[36m@@@ -5,6 -5,6 +5,7 @@@[m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_gy1mq"][m
  [ext_resource type="FontFile" uid="uid://bm3qiosuy6an7" path="res://fonts/PixelatedEleganceRegular-ovawB.ttf" id="3_gy1mq"][m
  [ext_resource type="PackedScene" uid="uid://lycfsg4n4b3w" path="res://scenes/microgames/popupparty/popup_window.tscn" id="4_bkp7j"][m
[32m++[ext_resource type="AudioStream" uid="uid://xuwdidgvm0og" path="res://assets/Audio/mouse_click.mp3" id="6_nfipc"][m
  [m
  [node name="popup_party" type="Node2D" unique_id=101498177][m
  script = ExtResource("1_tuikh")[m
[36m@@@ -60,3 -60,3 +61,7 @@@[m [mhorizontal_alignment = [m
  vertical_alignment = 1[m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=704174978][m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=1628562563][m
[32m++stream = ExtResource("6_nfipc")[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/reportmash/report_mash.tscn[m
[1mindex aa64c3d,aa64c3d..2699913[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/reportmash/report_mash.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/reportmash/report_mash.tscn[m
[36m@@@ -4,6 -4,6 +4,7 @@@[m
  [ext_resource type="Script" uid="uid://14fmajk5wleo" path="res://scripts/microgames/reportmash/report_mash.gd" id="1_um5or"][m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_dqrxg"][m
  [ext_resource type="FontFile" uid="uid://bm3qiosuy6an7" path="res://fonts/PixelatedEleganceRegular-ovawB.ttf" id="2_q2vhx"][m
[32m++[ext_resource type="AudioStream" uid="uid://bm3sym4uho513" path="res://assets/Audio/key_press.mp3" id="5_ovapn"][m
  [m
  [node name="report_mash" type="Node2D" unique_id=205002658][m
  script = ExtResource("1_um5or")[m
[36m@@@ -55,3 -55,3 +56,8 @@@[m [mhorizontal_alignment = [m
  vertical_alignment = 1[m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=920173285][m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=337903226][m
[32m++stream = ExtResource("5_ovapn")[m
[32m++max_polyphony = 15[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/shredderlanding/paper.tscn[m
[1mindex 76b42aa,76b42aa..11b8233[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/shredderlanding/paper.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/shredderlanding/paper.tscn[m
[36m@@@ -2,6 -2,6 +2,7 @@@[m
  [m
  [ext_resource type="Script" uid="uid://bxtpoge5kn44p" path="res://scripts/microgames/shredderlanding/shredder_paper.gd" id="1_ucj6d"][m
  [ext_resource type="Texture2D" uid="uid://d2y5uyg07gwva" path="res://assets/2D/paper.png" id="2_twcfp"][m
[32m++[ext_resource type="AudioStream" uid="uid://86hexnadsj00" path="res://assets/Audio/paper_slide.mp3" id="3_twcfp"][m
  [m
  [sub_resource type="RectangleShape2D" id="RectangleShape2D_q4mm8"][m
  size = Vector2(80, 108)[m
[36m@@@ -16,3 -16,3 +17,7 @@@[m [mtexture = ExtResource("2_twcfp"[m
  position = Vector2(0, 1)[m
  shape = SubResource("RectangleShape2D_q4mm8")[m
  metadata/_edit_lock_ = true[m
[32m++[m
[32m++[node name="paper_sound" type="AudioStreamPlayer2D" parent="." unique_id=40621968][m
[32m++stream = ExtResource("3_twcfp")[m
[32m++bus = &"Effects"[m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/shredderlanding/shredder_landing.tscn[m
[1mindex 2912a3a,2912a3a..b69dc3b[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/shredderlanding/shredder_landing.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/shredderlanding/shredder_landing.tscn[m
[36m@@@ -5,6 -5,6 +5,7 @@@[m
  [ext_resource type="Texture2D" uid="uid://djs6tpsdgs1pn" path="res://assets/2D/shredder_back.png" id="2_mxnui"][m
  [ext_resource type="PackedScene" uid="uid://bijuw5wls1kr8" path="res://scenes/ui/microgame_timer.tscn" id="2_yq6xh"][m
  [ext_resource type="Texture2D" uid="uid://co66s5ulieu7l" path="res://assets/2D/shredder_front.png" id="4_yq6xh"][m
[32m++[ext_resource type="AudioStream" uid="uid://b2ak7b71tu882" path="res://assets/Audio/shredder.mp3" id="6_kxhm6"][m
  [m
  [sub_resource type="RectangleShape2D" id="RectangleShape2D_q4mm8"][m
  size = Vector2(19, 31)[m
[36m@@@ -78,4 -78,4 +79,9 @@@[m [mvertical_alignment = [m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=323091706][m
  [m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=1340412254][m
[32m++stream = ExtResource("6_kxhm6")[m
[32m++volume_db = -0.48[m
[32m++bus = &"Effects"[m
[32m++[m
  [connection signal="body_entered" from="shredder_front/Area2D" to="." method="_on_area_2d_body_entered"][m
[1mdiff --cc gmtk-2026-game-jam/scenes/microgames/staplerslam/stapler_slam.tscn[m
[1mindex 433bbe5,433bbe5..c9fc5de[m
[1m--- a/gmtk-2026-game-jam/scenes/microgames/staplerslam/stapler_slam.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/microgames/staplerslam/stapler_slam.tscn[m
[36m@@@ -7,6 -7,6 +7,7 @@@[m
  [ext_resource type="Script" uid="uid://bvufbk64xibng" path="res://scripts/microgames/staplerslam/staplerslam_paper2.gd" id="4_c11vt"][m
  [ext_resource type="Script" uid="uid://f62jjoujx24t" path="res://scripts/microgames/staplerslam/staplerslam_paper3.gd" id="5_cq1nu"][m
  [ext_resource type="Texture2D" uid="uid://ctl37nnlffexa" path="res://assets/2D/stapler.png" id="6_etrem"][m
[32m++[ext_resource type="AudioStream" uid="uid://bunckbjhs5lte" path="res://assets/Audio/stapler.mp3" id="8_73tce"][m
  [m
  [sub_resource type="AtlasTexture" id="AtlasTexture_bg7lo"][m
  atlas = ExtResource("6_etrem")[m
[36m@@@ -33,6 -33,6 +34,9 @@@[m [manimations = [[m
  [sub_resource type="RectangleShape2D" id="RectangleShape2D_q4mm8"][m
  size = Vector2(10, 4.25)[m
  [m
[32m++[sub_resource type="RectangleShape2D" id="RectangleShape2D_0sqs7"][m
[32m++size = Vector2(220, 648)[m
[32m++[m
  [node name="stapler_slam" type="Node2D" unique_id=1806313159][m
  script = ExtResource("1_oh515")[m
  TimerScene = ExtResource("2_oh515")[m
[36m@@@ -44,16 -44,16 +48,16 @@@[m [moffset_right = 1152.[m
  offset_bottom = 648.0[m
  color = Color(0.92156863, 0.7254902, 0.4509804, 1)[m
  [m
[31m--[node name="paper" parent="." unique_id=72314455 instance=ExtResource("3_pwpxj")][m
[32m++[node name="paper" parent="." unique_id=72314455 groups=["papers"] instance=ExtResource("3_pwpxj")][m
  position = Vector2(3880, 653)[m
  scale = Vector2(4, 4)[m
  [m
[31m--[node name="paper2" parent="." unique_id=203868330 instance=ExtResource("3_pwpxj")][m
[32m++[node name="paper2" parent="." unique_id=203868330 groups=["papers"] instance=ExtResource("3_pwpxj")][m
  position = Vector2(3054, 206)[m
  scale = Vector2(4, 4)[m
  script = ExtResource("4_c11vt")[m
  [m
[31m--[node name="paper3" parent="." unique_id=2034006229 instance=ExtResource("3_pwpxj")][m
[32m++[node name="paper3" parent="." unique_id=2034006229 groups=["papers"] instance=ExtResource("3_pwpxj")][m
  position = Vector2(2076, 606)[m
  scale = Vector2(4, 4)[m
  script = ExtResource("5_cq1nu")[m
[36m@@@ -87,3 -87,3 +91,13 @@@[m [mhorizontal_alignment = [m
  vertical_alignment = 1[m
  [m
  [node name="CanvasLayer" type="CanvasLayer" parent="." unique_id=1336265443][m
[32m++[m
[32m++[node name="effects" type="AudioStreamPlayer2D" parent="." unique_id=738409971][m
[32m++stream = ExtResource("8_73tce")[m
[32m++bus = &"Effects"[m
[32m++[m
[32m++[node name="Area2D" type="Area2D" parent="." unique_id=1891726060][m
[32m++[m
[32m++[node name="CollisionShape2D" type="CollisionShape2D" parent="Area2D" unique_id=145039806][m
[32m++position = Vector2(1266, 324)[m
[32m++shape = SubResource("RectangleShape2D_0sqs7")[m
[1mdiff --cc gmtk-2026-game-jam/scenes/office_level/office_level.tscn[m
[1mindex f2736c4,f2736c4..3e64962[m
[1m--- a/gmtk-2026-game-jam/scenes/office_level/office_level.tscn[m
[1m+++ b/gmtk-2026-game-jam/scenes/office_level/office_level.tscn[m
[36m@@@ -135,6 -135,6 +135,7 @@@[m [mlayout_mode = [m
  anchors_preset = 0[m
  offset_right = 1151.0[m
  offset_bottom = 651.0[m
[32m++mouse_filter = 2[m
  [m
  [node name="Label" type="Label" parent="Control" unique_id=1875393504][m
  layout_mode = 1[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/contract_drag/contract_drag.gd[m
[1mindex 99da38f,99da38f..019957c[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/contract_drag/contract_drag.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/contract_drag/contract_drag.gd[m
[36m@@@ -7,7 -7,7 +7,9 @@@[m [mextends Node2[m
  @onready var results: Label = $Label[m
  @onready var signature: RichTextLabel = $paper/bottom_stuff/signature[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  [m
[32m++var scribble = preload("res://assets/Audio/scribble.mp3")[m
  var timer_bar_instance[m
  [m
  var game_over = false[m
[36m@@@ -42,6 -42,6 +44,7 @@@[m [mfunc _input(event: InputEvent)[m
  			if event.pressed:[m
  				dragging = true[m
  				drag_offset = paper.global_position - event.position[m
[32m++				effects.play()[m
  			elif not event.pressed:[m
  				dragging = false[m
  		elif event is InputEventMouseMotion and dragging:[m
[36m@@@ -55,6 -55,6 +58,8 @@@[m [mfunc _on_paper_area_area_exited(_area: [m
  	game_over = true[m
  	timer_bar_instance.stop_timers()[m
  	signature_visible = true[m
[32m++	effects.stream = scribble[m
[32m++	effects.play()[m
  [m
  func _on_timer_up():[m
  	game_over = true[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/flyswatter/fly.gd[m
[1mindex 389a5f9,389a5f9..a5c1b7b[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/flyswatter/fly.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/flyswatter/fly.gd[m
[36m@@@ -2,6 -2,6 +2,7 @@@[m [mextends CharacterBody2[m
  [m
  @onready var buzzing: AudioStreamPlayer = $AudioStreamPlayer[m
  [m
[32m++[m
  var speed = 180;[m
  var screen_size[m
  var dir = Vector2()[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/flyswatter/flyswatter.gd[m
[1mindex 08654ca,08654ca..7e91a31[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/flyswatter/flyswatter.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/flyswatter/flyswatter.gd[m
[36m@@@ -6,6 -6,6 +6,7 @@@[m [mextends Node2[m
  @onready var hand_sprite: Sprite2D = $Hand/HandSprite[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
  @onready var results: Label = $Label[m
[32m++@onready var squish: AudioStreamPlayer2D = $effects[m
  [m
  var score = 0[m
  var end = false[m
[36m@@@ -59,6 -59,6 +60,7 @@@[m [mfunc check_for_fly()[m
  		add_child(fly_hit)[m
  		score += 1[m
  		print("Smack!")[m
[32m++		squish.play()[m
  		fly.queue_free()[m
  [m
  func _on_timer_up():[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/papertilt/paper_tilt.gd[m
[1mindex 0ba2058,0ba2058..608e395[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/papertilt/paper_tilt.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/papertilt/paper_tilt.gd[m
[36m@@@ -8,6 -8,6 +8,7 @@@[m [mextends Node2[m
  @onready var noise = FastNoiseLite.new()[m
  @onready var paper_particle: CPUParticles2D = $paper_stack/paper_particle[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  [m
  var game_is_over = false[m
  var timer_bar_instance[m
[36m@@@ -66,6 -66,6 +67,7 @@@[m [mfunc game_over()[m
  	timer_bar_instance.stop_timers()[m
  	sprite.visible = false[m
  	paper_particle.restart()[m
[32m++	effects.play()[m
  	results.visible = true[m
  	game_has_ended("lose")[m
  [m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/plugpanic/plug_panic.gd[m
[1mindex 6ec2e14,6ec2e14..c64962c[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/plugpanic/plug_panic.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/plugpanic/plug_panic.gd[m
[36m@@@ -9,6 -9,6 +9,9 @@@[m [mvar timer_bar_instanc[m
  @onready var snap_point: Node2D = $outlet/snap_point[m
  @onready var plug_center: Node2D = $plug/plug_center[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
[32m++[m
[32m++var plug_bend = preload("res://assets/Audio/plug_bend.mp3")[m
  [m
  var start_pos = Vector2(60, 705)[m
  var end_pos = Vector2(1062, 705)[m
[36m@@@ -41,6 -41,6 +44,7 @@@[m [mfunc _process(_delta: float) -> void[m
  			v_tween = null[m
  			timer_bar_instance.stop_timers()[m
  			plug.frame = 1[m
[32m++			effects.play()[m
  			plug.position = Vector2(snap_point.global_position.x, snap_point.global_position.y + (cable_height / 2) - (plug_height / 2))[m
  			results.visible = true[m
  			game_has_ended("win")[m
[36m@@@ -90,6 -90,6 +94,8 @@@[m [mfunc _on_timer_up()[m
  [m
  func plug_missed():[m
  	plug.frame = 2[m
[32m++	effects.stream = plug_bend[m
[32m++	effects.play()[m
  	results.text = "You're Loser!"[m
  	results.visible = true[m
  	game_has_ended("lose")[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/popupparty/popup_party.gd[m
[1mindex b420b8b,b420b8b..7c4ec53[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/popupparty/popup_party.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/popupparty/popup_party.gd[m
[36m@@@ -5,6 -5,6 +5,7 @@@[m [mextends Node2[m
  @export var total_popups = 12[m
  @onready var results: Label = $Label[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  var close_count = 0[m
  var timer_bar_instance[m
  [m
[36m@@@ -42,7 -42,7 +43,11 @@@[m [mfunc _on_popup_closed() -> void[m
  		results.visible = true[m
  		timer_bar_instance.stop_timers()[m
  		game_has_ended("win")[m
[31m--		[m
[32m++[m
[32m++func _input(event: InputEvent):[m
[32m++	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:[m
[32m++		if event.is_pressed():[m
[32m++			effects.play()[m
  [m
  func _on_timer_up():[m
  	results.text = "You're Loser!"[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/reportmash/report_mash.gd[m
[1mindex a643ac4,a643ac4..28d58cb[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/reportmash/report_mash.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/reportmash/report_mash.gd[m
[36m@@@ -4,6 -4,6 +4,7 @@@[m [mextends Node2[m
  @onready var results: Label = $Label[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
  @export var TimerScene: PackedScene[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  [m
  var timer_bar_instance[m
  var end = false[m
[36m@@@ -32,7 -32,7 +33,10 @@@[m [mfunc _process(_delta: float) -> void[m
  func _input(event: InputEvent):[m
  	var chartotal = text.get_total_character_count()[m
  	if event is InputEventKey:[m
[31m--		if event.is_pressed():[m
[32m++		if event.is_pressed() and text.visible_ratio < 1.0:[m
[32m++			var pitch_rand = randf_range(0.85, 1.15)[m
[32m++			effects.pitch_scale = pitch_rand[m
[32m++			effects.play()[m
  			text.visible_ratio += (max_visibility / chartotal) * typing_boost[m
  [m
  func _on_timer_up():[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_landing.gd[m
[1mindex eb1ed5d,eb1ed5d..5be40e6[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_landing.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_landing.gd[m
[36m@@@ -5,8 -5,8 +5,10 @@@[m [mextends Node2[m
  @onready var win_area: Area2D = $shredder_front/Area2D[m
  @onready var paper: CharacterBody2D = $paper[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  var timer_bar_instance[m
  [m
[32m++var paper_crash = preload("res://assets/Audio/crumple.mp3")[m
  signal game_end(outcome: String)[m
  [m
  var running = true[m
[36m@@@ -17,10 -17,10 +19,12 @@@[m [mfunc _ready() -> void[m
  	timer_bar_instance = TimerScene.instantiate()[m
  	canvas_layer.add_child(timer_bar_instance)[m
  	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))[m
[32m++	paper.connect("paper_crashed", _on_paper_crash)[m
  [m
  [m
  func _on_area_2d_body_entered(_body: Node2D) -> void:[m
  	results.visible = true[m
[32m++	effects.play()[m
  	timer_bar_instance.stop_timers()[m
  	paper.paper_success = true[m
  	game_has_ended("win")[m
[36m@@@ -33,3 -33,3 +37,7 @@@[m [mfunc _on_timer_up()[m
  func game_has_ended(result: String):[m
  	await get_tree().create_timer(0.5).timeout[m
  	emit_signal("game_end", result)[m
[32m++[m
[32m++func _on_paper_crash():[m
[32m++	effects.stream = paper_crash[m
[32m++	effects.play()[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_paper.gd[m
[1mindex 8c9587a,8c9587a..bdba858[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_paper.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/shredderlanding/shredder_paper.gd[m
[36m@@@ -1,17 -1,17 +1,22 @@@[m
  extends CharacterBody2D[m
  [m
  @export var paper_success = false[m
[32m++@onready var paper_sound: AudioStreamPlayer2D = $paper_sound[m
  [m
[31m--const FALL_SPEED = 150.0[m
[32m++const FALL_SPEED = 120.0[m
  const SPEED = 400.0[m
[31m--const initial_speed = 400.0[m
[32m++const initial_speed = 200.0[m
  [m
  var speed_applied = false[m
[32m++var crashed = false[m
[32m++[m
[32m++signal paper_crashed[m
  [m
  func _physics_process(_delta: float) -> void:[m
  	if !speed_applied:[m
  		velocity.x = initial_speed[m
  		speed_applied = true[m
[32m++		paper_sound.play()[m
  [m
  	if not is_on_floor():[m
  		velocity.y = FALL_SPEED[m
[36m@@@ -21,8 -21,8 +26,14 @@@[m
  		if direction:[m
  			if velocity.y > 0:[m
  				velocity.x = direction * SPEED[m
[32m++				paper_sound.play()[m
  	[m
  	if velocity.y == 0:[m
  		velocity.x = 0[m
[32m++		[m
[32m++	if velocity.y == 0 and crashed == false:[m
[32m++		crashed = true[m
[32m++		emit_signal("paper_crashed")[m
[32m++	[m
  	[m
  	move_and_slide()[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam.gd[m
[1mindex a16f7ee,a16f7ee..88c685c[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam.gd[m
[36m@@@ -5,6 -5,6 +5,7 @@@[m [mextends Node2[m
  @onready var staplerarea: Area2D = $stapler/staplerarea[m
  @onready var results: Label = $Label[m
  @onready var canvas_layer: CanvasLayer = $CanvasLayer[m
[32m++@onready var effects: AudioStreamPlayer2D = $effects[m
  [m
  @export var stapler_offset: Vector2 = Vector2(0,90)[m
  @export var StapleScene: PackedScene[m
[36m@@@ -48,9 -48,9 +49,9 @@@[m [mfunc _physics_process(_delta: float) -[m
  	[m
  	if last_area.is_stapled == true:[m
  		return[m
[31m--	[m
[32m++[m
  	last_area.is_stapled = true[m
[31m--	[m
[32m++[m
  	_spawn_staple()[m
  [m
  func _input(event: InputEvent):[m
[36m@@@ -65,6 -65,6 +66,7 @@@[m [mfunc _spawn_staple()[m
  	[m
  	var mouse_pos = get_global_mouse_position()[m
  	var staple = StapleScene.instantiate()[m
[32m++	effects.play()[m
  	last_area.add_child(staple)[m
  	staple.global_position = mouse_pos[m
  	staple_counter += 1[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper.gd[m
[1mindex 82f13e7,82f13e7..dca77e0[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper.gd[m
[36m@@@ -8,7 -8,7 +8,7 @@@[m [mvar min_dist = 22[m
  var max_dist = 375[m
  [m
  var travel_time[m
[31m--var min_time = 4.5[m
[32m++var min_time = 4.0[m
  var max_time = 6.0[m
  [m
  # Called when the node enters the scene tree for the first time.[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper2.gd[m
[1mindex f766b27,f766b27..bcbcc1d[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper2.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper2.gd[m
[36m@@@ -8,7 -8,7 +8,7 @@@[m [mvar min_dist = 35[m
  var max_dist = 475[m
  [m
  var travel_time[m
[31m--var min_time = 4.5[m
[32m++var min_time = 3.5[m
  var max_time = 6.0[m
  [m
  # Called when the node enters the scene tree for the first time.[m
[1mdiff --cc gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper3.gd[m
[1mindex 5cca242,5cca242..5778088[m
[1m--- a/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper3.gd[m
[1m+++ b/gmtk-2026-game-jam/scripts/microgames/staplerslam/staplerslam_paper3.gd[m
[36m@@@ -8,7 -8,7 +8,7 @@@[m [mvar min_dist = 50[m
  var max_dist = 650[m
  [m
  var travel_time[m
[31m--var min_time = 4.0[m
[32m++var min_time = 3.0[m
  var max_time = 5.5[m
  [m
  # Called when the node enters the scene tree for the first time.[m
