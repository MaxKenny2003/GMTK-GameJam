using Godot;
using System;

public partial class MainMenu : Node
{

    [Export] 
    public PackedScene NextScene;

    public void _on_play_button_pressed()
    {
        // GD.Print("Play button pressed!");
        GetTree().ChangeSceneToPacked(NextScene);
    }
}
