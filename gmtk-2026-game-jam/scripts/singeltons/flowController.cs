using Godot;
using System;
using System.Diagnostics;

public partial class flowController : Node
{
	public bool can_move_camera = false;
    public bool is_looking_at_computer = true;
    public bool can_start_game = false;


    public static flowController Instance { get; private set; }

    public override void _Ready()
    {
        Instance = this;
    }

    public override void _Process(double delta)
    {
        if (can_move_camera && is_looking_at_computer)
        {
            can_start_game = true;
        }
        else
        {
            can_start_game = false;
        }
    }
}
