using Godot;
using System;
using System.Transactions;

// Changed the tween to alter global position instead of just position and it worked - Zach
public partial class Camera3d : Camera3D
{
    [Export]
    private float camera_move_speed = 1.0f;
    [Export]
    private float time_to_stare = 1.0f;
    private Vector3 position;

	[Export]
	public Vector3 target_pos = new Vector3(0, 0, 0);
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		// GD.Print("Is current? ", Current);
		GD.Print("Started move from ", Position, " to ", target_pos);
        MoveCamera();
    }

	private async void MoveCamera()
	{
        var tween = CreateTween();
        tween.TweenProperty(this, "global_position", target_pos, 2.0f);
        await ToSignal(tween, "finished");
        flowController.Instance.set_camera_movement(true);
        flowController.Instance.set_looking_at_computer(true);
        flowController.Instance.set_can_start_game(true);
    }

    public override void _Process(double delta)
    {
		if(flowController.Instance.can_move_camera)
		{
            if (Input.IsActionJustPressed("look_out_window"))
            {
                RotateCamera();
            }
        }
    }

    private async void RotateCamera()
    { 
        var tween = CreateTween();
        flowController.Instance.set_camera_movement(false);
        flowController.Instance.set_looking_at_computer(false);
        flowController.Instance.set_can_start_game(false);
        tween.TweenProperty(this, "rotation", new Vector3(0, Mathf.DegToRad(0), 0), camera_move_speed)
            .SetTrans(Tween.TransitionType.Sine)
            .SetEase(Tween.EaseType.InOut);

        await ToSignal(tween, "finished");

        await ToSignal(GetTree().CreateTimer(time_to_stare), "timeout");

        var tween2 = CreateTween();
        tween2.TweenProperty(this, "rotation", new Vector3(0, Mathf.DegToRad(90), 0), camera_move_speed)
                .SetTrans(Tween.TransitionType.Sine)
                .SetEase(Tween.EaseType.InOut);

        await ToSignal(tween2, "finished");
        flowController.Instance.set_camera_movement(true);
        flowController.Instance.set_looking_at_computer(true);
        flowController.Instance.set_can_start_game(true);
    }
}
