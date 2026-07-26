using Godot;
using System;

public partial class ToastRemaining : Control
{

	private Label toastLabel;
    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
	{
		toastLabel = GetNode<Label>("Label");
    }

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(flowController.Instance.send_toast)
		{
            GD.Print("Toast seconds left: ", flowController.Instance.toast_seconds_left);
            flowController.Instance.set_send_toast(false);
            toastLabel.Text = flowController.Instance.toast_seconds_left.ToString("F2") + " seconds till impact";
            moveToast();
        }
	}

	private async void moveToast()
    {
        var tween1 = CreateTween();
        tween1.TweenProperty(this, "position", new Vector2(576.0f, 350.0f), 0.5f);
        await ToSignal(tween1, "finished");

        await ToSignal(GetTree().CreateTimer(1.5f), "timeout");

        var tween2 = CreateTween();
        tween2.TweenProperty(this, "position", new Vector2(576.0f, 500), 0.5f);
        await ToSignal(tween2, "finished");
        
    }
}
