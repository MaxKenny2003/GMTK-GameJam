using Godot;
using System;
using System.Transactions;

// Changed the tween to alter global position instead of just position and it worked - Zach
public partial class Camera3d : Camera3D
{
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
		flowController.Instance.can_move_camera = true;
	}

	public override void _Process(double delta)
	{
		if(flowController.Instance.can_move_camera)
		{
			if (Input.IsActionJustPressed("look_out_window"))
			{
				RotateCamera();
				//GD.Print("Trying to look out window");
			}
		}
	}

	private async void RotateCamera()
	{ 
		var tween = CreateTween();
		if (flowController.Instance.is_looking_at_computer)
		{
			flowController.Instance.can_move_camera = false;
			flowController.Instance.is_looking_at_computer = false;
			tween.TweenProperty(this, "rotation", new Vector3(0, Mathf.DegToRad(0), 0), 2.0f)
				.SetTrans(Tween.TransitionType.Sine)
				.SetEase(Tween.EaseType.InOut);

			await ToSignal(tween, "finished");
			flowController.Instance.can_move_camera = true;
		}
		else
		{
			flowController.Instance.can_move_camera = false;
			flowController.Instance.is_looking_at_computer = true;
			tween.TweenProperty(this, "rotation", new Vector3(0, Mathf.DegToRad(90), 0), 2.0f)
				.SetTrans(Tween.TransitionType.Sine)
				.SetEase(Tween.EaseType.InOut);

			await ToSignal(tween, "finished");
			flowController.Instance.can_move_camera = true;
		}
	}
}
