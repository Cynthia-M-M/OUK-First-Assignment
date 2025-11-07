import from byllm.lib { Model }

glob llm = Model(model_name="gpt-4o-mini");

obj AICalculator {
    has a: float = 0.0;
    has b: float = 0.0;
    has op: str = "+";
    has result: float = 0.0;

    def compute {
        if self.op == "+" {
            self.result = self.a + self.b;
        } elif self.op == "-" {
            self.result = self.a - self.b;
        } elif self.op == "*" {
            self.result = self.a * self.b;
        } elif self.op == "/" {
            if self.b == 0 {
                print("Error: division by zero!");
                return;
            }
            self.result = self.a / self.b;
        } else {
            print(f"Error: unknown operator '{self.op}'");
            return;
        }

        print(f"Computed: {self.a} {self.op} {self.b} = {self.result}");

        # Ask AI for an explanation
        explanation = self.explain_with_ai();
        print("AI says: " + explanation);
    }

    """Explain the math behind the calculation as a friendly math tutor."""
    def explain_with_ai() -> str by llm();
}

with entry {
    print("🤖 Welcome to Step 6 – AI Calculator!\n");

    a1 = AICalculator(a=10, b=5, op="+");
    a2 = AICalculator(a=9, b=3, op="-");
    a3 = AICalculator(a=4, b=6, op="*");
    a4 = AICalculator(a=12, b=4, op="/");

    a1.compute();
    a2.compute();
    a3.compute();
    a4.compute();
}
