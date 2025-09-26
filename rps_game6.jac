import random;
# Optional byLLM integration (uncomment if you have byllm installed and configured)
# import from byllm.llm { Model }
# glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False)
# def give_commentary(player: str, computer: str, result: str) -> str by llm();

# Safe local fallback commentary (works without byLLM)
def give_commentary(player: str, computer: str, result: str) -> str {
    if (result == "It's a tie!") {
        return "It's a tight one — well played by both!";
    }
    elif (result == "You win!") {
        return "Nice move! That's a clever play.";
    }
    else {
        return "Tough round — the computer got the better of you!";
    }
}

walker RPSGame {
    has player_choice: str;
    has computer_choice: str;
    has result: str;
    has commentary: str;

    can start with `root entry;
    can play with turn entry;
}

node turn {
    has computer_move: str = random.choice(["rock","paper","scissors"]);
}

impl RPSGame {
    def start {
        n = spawn node::turn;
        self.computer_choice = n.computer_move;

        self.result = self.determine_winner(self.player_choice, self.computer_choice);

        # use local commentary (or byLLM if you uncomment above)
        self.commentary = give_commentary(self.player_choice, self.computer_choice, self.result);

        print("You chose " + self.player_choice + ", computer chose " + self.computer_choice + ".");
        print("Result: " + self.result);
        print("AI says: " + self.commentary);

        visit n;
    }

    def play {
        disengage;
    }

    def determine_winner(player: str, computer: str) -> str {
        if player == computer {
            return "It's a tie!";
        }
        elif (player == "rock" and computer == "scissors") {
            return "You win!";
        }
        elif (player == "paper" and computer == "rock") {
            return "You win!";
        }
        elif (player == "scissors" and computer == "paper") {
            return "You win!";
        }
        else {
            return "Computer wins!";
        }
    }
}

with entry:__main__ {
    root spawn RPSGame("rock");
    root spawn RPSGame("scissors");
}