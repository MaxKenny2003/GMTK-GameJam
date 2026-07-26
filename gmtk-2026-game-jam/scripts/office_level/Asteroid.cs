using Godot;
using System;
using System.Collections.Generic;

public partial class Asteroid : Node3D
{
    private int asteroid_state = 0;
    private bool is_moving = false;
    [Export]
    public Godot.Collections.Array<Vector3> asteroid_state_positions = new Godot.Collections.Array<Vector3>();

    [Export]
    public ColorRect colorRect;
    private WorldEnvironment worldEnvironment;
    private Godot.Environment reset;

    [Export]
    public float total_game_time = 10.0f;

    public override void _Ready()
    {
        worldEnvironment = GetNode<WorldEnvironment>("../WorldEnvironment");

        // Deep-duplicate so we get a genuinely separate copy of the environment/sky/material
        var originalEnv = (Godot.Environment)worldEnvironment.Environment.Duplicate(true);
        var originalSky = (Sky)originalEnv.Sky.Duplicate(true);
        originalEnv.Sky = originalSky;

        reset = originalEnv; // store this as the true original snapshot (change type to Environment, not WorldEnvironment)

        MoveAsteroid();
    }

    private async void MoveAsteroid()
    {
        flowController.Instance.toast_seconds_left = total_game_time;
        is_moving = true;

        var env = (Godot.Environment)worldEnvironment.Environment.Duplicate(true);
        var sky = (Sky)env.Sky.Duplicate(true);
        var skyMaterial = (ProceduralSkyMaterial)sky.SkyMaterial.Duplicate(true);
        sky.SkyMaterial = skyMaterial;
        env.Sky = sky;
        worldEnvironment.Environment = env; // assign the fresh duplicated copy so we're not editing the shared original

        var tween = CreateTween();
        tween.TweenProperty(this, "global_position", asteroid_state_positions[asteroid_state], total_game_time)
            .SetTrans(Tween.TransitionType.Linear);
        var tween2 = CreateTween();
        tween2.TweenProperty(skyMaterial, "sky_horizon_color", new Color(119f / 255f, 7f / 255f, 21f / 255f), total_game_time);
        var tween3 = CreateTween();
        tween3.TweenProperty(env, "fog_light_color", new Color(119f / 255f, 7f / 255f, 21f / 255f), total_game_time);

        flowController.Instance.set_move_camera(true);
        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.toast_seconds_left -= total_game_time / 5;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        flowController.Instance.set_move_camera(true);
        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.toast_seconds_left -= total_game_time / 5;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        flowController.Instance.set_move_camera(true);
        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.toast_seconds_left -= total_game_time / 5;
        flowController.Instance.asteroid_state = asteroid_state;
        flowController.Instance.is_camera_shaking = true;
        GD.Print("Asteroid state: ", asteroid_state);

        flowController.Instance.set_move_camera(true);
        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.toast_seconds_left -= total_game_time / 5;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        flowController.Instance.gameOver = true; // set this FIRST, immediately
        flowController.Instance.set_can_start_game(false);
        await ToSignal(tween, "finished");
        flowController.Instance.endGame();
        worldEnvironment.Environment = reset; // now reset holds a truly untouched original copy
    }
}