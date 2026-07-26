using Godot;
using System;
using System.Diagnostics;

public partial class flowController : Node
{
    public bool is_looking_at_computer = true;  // used to tell if we can start game
    public bool move_Camera = false;            // Ready to move camera (command) 
    public bool can_move = false;               // Free to move next
    public bool is_camera_shaking = false;      // Used to control camera shake
    public bool can_start_game = false;         // Used to decide if we can start a microgame
    public bool is_in_game = false;             // Used to tell if we are in a game

    public bool send_toast = false;
    public float toast_seconds_left;

    public int score = 0;
    public int lives = 3;
    public static flowController Instance { get; private set; }

    private Label scoreLabel;

    public int asteroid_state = 0;


    public override void _Ready()
    {
        Instance = this;
        move_Camera = false;
        is_looking_at_computer = true;
        can_start_game = false;
        is_camera_shaking = false;
        score = 0;
        can_move = false;
        is_in_game = false;
    }
    public void set_can_move_camera(bool value)
    {
        can_move = value;
    }
    public void set_score(int value)
    {
        score = value;
    }

    public void set_move_camera(bool value)
    {
        move_Camera = value;
    }
    public void set_looking_at_computer(bool value)
    {
        is_looking_at_computer = value;
    }
    public void set_can_start_game(bool value)
    {
        can_start_game = value;
    }

    public void set_is_in_game(bool value)
    {
        is_in_game = value;
    }
    public void set_send_toast(bool value)
    {
        send_toast = value;
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
        move_Camera = false;
        is_looking_at_computer = true;
        can_start_game = false;
        is_camera_shaking = false;
        score = 0;
        lives = 3;
        asteroid_state = 0;
        can_move = false;
        is_in_game = false;
    }
}