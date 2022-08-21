# Raylib plugin

raylib is a simple and easy-to-use library to enjoy videogames programming.
You can find more information about raylib at the [raylib website](https://www.raylib.com/index.html)

## How to learn coding with raylib

raylib does not provide the typical API documentation or a big set of tutorials. 
The library is designed to be minimalistic and be learned just from a cheatsheet
with all required functionality and a big collection of examples to see how to
use that functionality. **Best way to learn to code is reading code.**

Many of the original raylib examples, which are written in C, were converted to SmallBASIC and are available
on [Github](https://github.com/smallbasic/smallbasic.plugins/tree/master/raylib/samples). To make it easier for you, 
you will find all the converted examples in the list below. If you are new to raylib it is best to start with the
first example.

The original cheatsheet for C can be found [here](https://www.raylib.com/cheatsheet/cheatsheet.html).
A simple SmallBASIC version is available at [Github](https://github.com/smallbasic/smallbasic.plugins/tree/master/raylib).

## How to setup SmallBASIC to use the raylib plugin

The raylib plugin is included in the release version of SmallBASIC. SmallBASIC should find the plugin automatically.
If you have problems loading the plugin, you can copy the library (libraylib.dll or libraylib.so) to the folder of your BASIC file.
Additionally you need the file [raylibc.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/raylibc.bas).
If it is not found automatically, please copy it the folder of your BASIC file, too.
You have also the option to give the full path to the plugin or to raylibc.bas with the `ìmport` command.

Since raylib uses its own window management, you cannot use it together with the SDL version of SmallBASIC (sbasicg.exe or sbasicg).
Please use instead the console version (sbasic.exe or sbasic).

In Linux call: `sbasic MyRaylibProgram.bas.`

or if you are using the AppImage: `SmallBASIC-Console_12.24-x86_64.AppImage MyRaylibProgram.bas`

If you are working in Windows, then start your program with: `sbasic.exe MyRaylibProgram.bas`

## Examples

### Core examples

- Basic Window: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_basic_window.bas)
  
  ![](/images/raylib/core_basic_window.png)

- Input Keys: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_keys.bas)
  
  ![](/images/raylib/core_input_keys.png)

- Input Mouse: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_mouse.bas)
  
  ![](/images/raylib/core_input_mouse.png)

- Input Mouse Wheel: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_mouse_wheel.bas)
  
  ![](/images/raylib/core_input_mouse_wheel.png)

- Input Gamepad: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_gamepad.bas)
  
  ![](/images/raylib/core_input_gamepad.png)
  
- Input Multitouch: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_multitouch.bas)
  
  ![](/images/raylib/core_input_multitouch.png)

- Input Gestures: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_input_input_gestures.bas)
  
  ![](/images/raylib/core_input_input_gestures.png)
  
- 2D Camera: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_2d_camera.bas)
  
  ![](/images/raylib/core_2d_camera.png)
  
- 2D Camera Mouse Zoom: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_2d_camera_mouse_zoom.bas)
  
  ![](/images/raylib/core_2d_camera_mouse_zoom.png)
  
- 2D Camera Platformer: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_2d_platformer.bas)
  
  ![](/images/raylib/core_2d_platformer.png)
  
- 3D Camera Mode: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_initialize_3d_camera_mode.bas)
  
  ![](/images/raylib/core_initialize_3d_camera_mode.png)
  
- 3D Camera Free: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_initialize_3d_camera_free.bas)
  
  ![](/images/raylib/core_initialize_3d_camera_free.png)
  
- 3D Camera First Person: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_3d_camera_first_person.bas)
  
  ![](/images/raylib/core_3d_camera_first_person.png)
  
- 3D Picking: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_picking_in_3d.bas)
  
  ![](/images/raylib/core_picking_in_3d.png)
  
- World Screen: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_world_to_screen.bas)
  
  ![](/images/raylib/core_world_to_screen.png)
  
- Window Flags: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_window_flags.bas)
  
  ![](/images/raylib/core_window_flags.png)
  
- Window Letterbox: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_window_scale_letterbox.bas)
  
  ![](/images/raylib/core_window_scale_letterbox.png)
  
- Window Should Close: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_window_should_close.bas)
  
  ![](/images/raylib/core_window_should_close.png)
  
- Random Values: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_generating_random_values.bas)
  
  ![](/images/raylib/core_generate_random_values.png)
  
- Scissor Test: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_scissor_test.bas)
  
  ![](/images/raylib/core_scissor_test.png)
  
- Basic Screen Manager: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_basic_screen_manager.bas)
  
  ![](/images/raylib/core_basic_screen_manager.png)
  
- Custom Frame Control: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_custom_frame_control.bas)
  
  ![](/images/raylib/core_custom_frame_control.png)
  
- Smooth Pixelperfect: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_smooth_pixel_perfect_camera.bas)
  
  ![](/images/raylib/core_smooth_pixel_perfect_camera.png)
  
- Split Screen: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/core_split_screen.bas)
  
  ![](/images/raylib/core_split_screen.png)
  
### Shapes

- Basic Shapes: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/shapes_basic_shapes.bas)
  
  ![](/images/raylib/shapes_basic_shapes.png)
  
- Collision Area: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/shapes_collision_area.bas)
  
  ![](/images/raylib/shapes_collision_area.png)
  
- Draw Ring: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/shapes_draw_ring.bas)
  
  ![](/images/raylib/shapes_draw_ring.png)


### Textures

- Background Scrolling: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_background_scrolling.bas)
  
  ![](/images/raylib/textures_background_scrolling.png)
  
- Bunnymark: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_bunnymark.bas)
  
  ![](/images/raylib/textures_bunnymark.png)
  
- Draw Tiled: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_draw_tiled.bas)
  
  ![](/images/raylib/textures_draw_tiled.png)
  
- Image Generation: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_image_generation.bas)
  
  ![](/images/raylib/textures_image_generation.png)
  
- Image Processing: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_image_processing.bas)
  
  ![](/images/raylib/textures_image_processing.png)
  
- Mouse Painting: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_mouse_painting.bas)
  
  ![](/images/raylib/textures_mouse_painting.png)
  
- nPatch Drawing: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_npatch_drawing.bas)
  
  ![](/images/raylib/textures_npatch_drawing.png)
  
- Particles Blending: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_particles_blending.bas)
  
  ![](/images/raylib/textures_particles_blending.png)
  
- Rectangles: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_rectangle.bas)
  
  ![](/images/raylib/textures_rectangle.png)
 
- Sprite Button: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/textures_sprite_button.bas)
  
  ![](/images/raylib/textures_sprite_button.png)


### Text

- Font Loading: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/text_font_loading.bas)
  
  ![](/images/raylib/text_font_loading.png)
  
- Writing Animation: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/text_writing_anim.bas)
  
  ![](/images/raylib/text_writing_anim.png)
  
### Audio

- Module Playing: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/audio_module_playing.bas)
  
  ![](/images/raylib/audio_module_playing.png)
  
- Music Stream: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/audio_music_stream.bas)
  
  ![](/images/raylib/audio_music_stream.png)
  
### Viscellaneous

- SmallBASIC raylib GUI: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/gui.bas)
  
  ![](/images/raylib/gui.png)
  
- Sand: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/sand.bas)
  
  ![](/images/raylib/sand.png)
  
### Models

- Animation: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/models_animation.bas)
  
  ![](/images/raylib/models_animation.png)
  
 ### Physics
 
- Demo: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/physics_demo.bas)
  
  ![](/images/raylib/physics_demo.png)
  
- Movement: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/physics_movement.bas)
  
  ![](/images/raylib/physics_movement.png)

- Friction: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/physics_friction.bas)
  
  ![](/images/raylib/physics_friction.png)
  
- Restitution: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/physics_restitution.bas)
  
  ![](/images/raylib/physics_restitution.png)
  
### Shaders
  
- Postprocessing: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/shaders_postprocessing.bas)
  
  ![](/images/raylib/shaders_postprocessing.png)
  
- Raymarching: [Source code](https://github.com/smallbasic/smallbasic.plugins/blob/master/raylib/samples/shaders_raymarching.bas)
  
  ![](/images/raylib/shaders_raymarching.png)

  
  
