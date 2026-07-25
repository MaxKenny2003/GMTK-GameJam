using Godot;
using System;
using System.Collections;
using System.Collections.Generic;
using static System.Formats.Asn1.AsnWriter;

public partial class GameManager : Node
{
    [Export]
    public Godot.Collections.Array<PackedScene> microGames = new Godot.Collections.Array<PackedScene>();
    [Export]
    public float end_game_delay = 2.0f;

    [Export]
    public int minimum_before_replay = 4;

    private Queue<PackedScene> waitingQueue = new Queue<PackedScene>();

    private Node instance;

    [Export]
    public Label scoreLabel;
    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
	{
        if (Input.IsActionJustPressed("start_microgame") && flowController.Instance.can_start_game)
        {
            if (microGames.Count > 0)
            {
                GD.Print("Trying to start microgame");
                flowController.Instance.set_can_start_game(false);
                int index = select_game();
                instance = microGames[index].Instantiate<Node>();
                AddChild(instance);
                instance.Connect("game_end", Callable.From<string>(OnGameEnd));
                add_game_to_waiting_queue(index);
            }
        }
	}

    private void add_game_to_waiting_queue(int index)
    {
        waitingQueue.Enqueue(microGames[index]);
        microGames.RemoveAt(index);
        if(microGames.Count == 0)
        {
            foreach (var game in waitingQueue)
            {
                microGames.Add(game);
            }
            waitingQueue.Clear();
        }
        if(waitingQueue.Count >= minimum_before_replay)
        {
            microGames.Add(waitingQueue.Dequeue());
        }
    }

    private int select_game()
    {
        Random random = new Random();
        int index = random.Next(0, microGames.Count);
        return index;
    }

    private void OnGameEnd(string result)
    {
        GD.Print("Game ended with result: ", result);
        if (result == "win")
        {
            GD.Print("Yippie");
            flowController.Instance.set_score(flowController.Instance.score + 1);

            if (scoreLabel != null)
            {
                GD.Print("Adding to score");
                scoreLabel.Text = "Score: " + flowController.Instance.score.ToString();
            }
        }
        if(result == "lose")
        {
            flowController.Instance.lives -= 1;
        }
        EndMicrogame();
    }

    private async void EndMicrogame()
    {
        await ToSignal(GetTree().CreateTimer(end_game_delay), "timeout");
        instance.QueueFree();
        flowController.Instance.set_can_start_game(true);
    }
}
