using Godot;
using System;

public partial class GameManager : Node
{
    [Export]
    public PackedScene[] microGames = new PackedScene[0];
    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
        if (Input.IsActionJustPressed("start_microgame"))
        {
            if (microGames.Length > 0)
            {
                GD.Print("Trying to start microgame");
                var instance = microGames[0].Instantiate<Node>();
                AddChild(instance);
            }
        }
	}
}
