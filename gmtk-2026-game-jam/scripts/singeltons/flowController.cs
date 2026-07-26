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
        can_move_camera = false;
        is_looking_at_computer = true;
        can_start_game = false;
        is_camera_shaking = false;
        score = 0;
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

    public void endGame()
    {
        GD.Print("Game Over");
        // GetTree().ChangeSceneToFile("res://scenes/gameOver.tscn");
        ResetState();
        GetTree().ChangeSceneToFile("res://scenes/main_menu/main_menu.tscn");
    }

    public void ResetState()
    {
        can_move_camera = false;
        is_looking_at_computer = true;
        can_start_game = false;
        is_camera_shaking = false;
        score = 0;
        lives = 3;
        asteroid_state = 0;
    }
}
