using Godot;
using System;

// This script is meant to move the camera from point A to point B, but it does not work and I'm eepy
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
        position = Position;
        var tween = CreateTween();
        tween.TweenProperty(this, "position", target_pos, 2.0f);
    }

}
