using Godot;
using System;
using System.Diagnostics;

public partial class flowController : Node
{
	public bool can_move_camera = false;
    public bool is_looking_at_computer = true;


    public static flowController Instance { get; private set; }

    public override void _Ready()
    {
        Instance = this;
    }
}
