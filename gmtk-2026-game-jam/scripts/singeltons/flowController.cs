using Godot;
using System;
using System.Diagnostics;

public partial class flowController : Node
{
	public bool can_move_camera = false;
    public bool is_looking_at_computer = true;
    public bool can_start_game = false;

    public int score = 0;
    public int lives = 3;
    public static flowController Instance { get; private set; }

    private Label scoreLabel;

    public int asteroid_state = 0;

    public bool is_camera_shaking = false; 

    public override void _Ready()
    {
        Instance = this;
    }

    public void set_score(int value)
    {
        score = value;
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
