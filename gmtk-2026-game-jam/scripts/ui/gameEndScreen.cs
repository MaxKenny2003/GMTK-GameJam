using Godot;
using System;

public partial class gameEndScreen : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		showWhite();
        moveToast();
    }

	private async void showWhite()
	{
        var whiteScreen = GetNode<ColorRect>("ColorRect");
        GD.Print("Base Color: ", whiteScreen.Color); // confirm this shows (1,1,1,1) or similar
        GD.Print("Modulate before: ", whiteScreen.Modulate);

        whiteScreen.Color = new Color(1, 1, 1, 1); // force opaque white base color
        whiteScreen.Modulate = new Color(1, 1, 1, 0); // start fully faded out via modulate
        GD.Print("Modulate after reset: ", whiteScreen.Modulate);

        Tween tween = CreateTween();
        tween.TweenProperty(whiteScreen, "modulate:a", 1.0f, 5);
        await ToSignal(tween, "finished");
        GD.Print("Tween done, changing scene");



        GetTree().ChangeSceneToFile("res://scenes/main_menu/main_menu.tscn");
    }
    private async void moveToast()
    {
        await ToSignal(GetTree().CreateTimer(1.0f), "timeout");
        Label toastLabel = GetNode<Label>("Label");
        toastLabel.Text = "Maybe you should have shown up earlier\n Score: " + flowController.Instance.score.ToString();
        var tween1 = CreateTween();
        tween1.TweenProperty(toastLabel, "position", new Vector2(18.0f, 250.0f), 2.0f);
        await ToSignal(tween1, "finished");

        await ToSignal(GetTree().CreateTimer(2.0f), "timeout");

        GetTree().ChangeSceneToFile("res://scenes/main_menu/main_menu.tscn");
    }
}
