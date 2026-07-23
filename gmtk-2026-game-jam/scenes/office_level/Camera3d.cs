using Godot;
using System;

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
		var tween = CreateTween();
		tween.TweenProperty(this, "global_position", target_pos, 2.0f);
	}

}
