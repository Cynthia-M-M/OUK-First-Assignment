import random;

walker RPSGame {
    has move: str;

    can start with `root entry;
    can play with turn entry;
}

node turn {
    has computer_move: str = random.choice(["rock","paper","scissors"]);
}

impl RPSGame {
    def start {
        print("Player chose " + self.move);
        n = spawn node::turn;
        visit n;
    }

    def play {
        print("Computer chose " + here.computer_move);
        if (self.move == here.computer_move) {
            print("It's a tie!");
        }
        elif (self.move == "rock" and here.computer_move == "scissors") {
            print("You win!");
        }
        elif (self.move == "paper" and here.computer_move == "rock") {
            print("You win!");
        }
        elif (self.move == "scissors" and here.computer_move == "paper") {
            print("You win!");
        }
        else {
            print("Computer wins!");
        }
        disengage;
    }
}

with entry:__main__ {
    root spawn RPSGame("rock");
    root spawn RPSGame("paper");
    root spawn RPSGame("scissors");
}