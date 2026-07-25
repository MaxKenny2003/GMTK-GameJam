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

    
    public void set_camera_movement(bool value)
    {
        can_move_camera = value;
    }
    public void set_looking_at_computer(bool value)
    {
        is_looking_at_computer = value;
    }
    public void set_can_start_game(bool value)
    {
        can_start_game = value;
    }
}
