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

    [Export]
    public float total_game_time = 270.0f;

    public override void _Ready()
    {
        worldEnvironment = GetNode<WorldEnvironment>("../WorldEnvironment");
        MoveAsteroid();
    }

    private async void MoveAsteroid()
    {
        is_moving = true;

        var env = worldEnvironment.Environment;
        var sky = env.Sky;
        var skyMaterial = (ProceduralSkyMaterial)sky.SkyMaterial;



        var tween = CreateTween();
        tween.TweenProperty(this, "global_position", asteroid_state_positions[asteroid_state], total_game_time)
            .SetTrans(Tween.TransitionType.Linear);
        var tween2 = CreateTween();
        tween2.TweenProperty(skyMaterial, "sky_horizon_color", new Color(119f/255f, 7f/255f, 21f/255f), total_game_time);
        var tween3 = CreateTween();
        tween3.TweenProperty(env, "fog_light_color", new Color(119f / 255f, 7f / 255f, 21f / 255f), total_game_time);

        await ToSignal(GetTree().CreateTimer(total_game_time/5), "timeout");
        asteroid_state++;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.asteroid_state = asteroid_state;
        flowController.Instance.is_camera_shaking = true;
        GD.Print("Asteroid state: ", asteroid_state);

        await ToSignal(GetTree().CreateTimer(total_game_time / 5), "timeout");
        asteroid_state++;
        flowController.Instance.asteroid_state = asteroid_state;
        GD.Print("Asteroid state: ", asteroid_state);

        await ToSignal(tween, "finished");
        flowController.Instance.endGame();
    }
}
