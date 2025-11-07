obj Calculator {
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
                print("Error: division by zero");
                return;
            }
            self.result = self.a / self.b;
        } else {
            print("Error: unknown operation '" + self.op + "'");
            return;
        }
        print(f"Computed: {self.a} {self.op} {self.b} = {self.result}");
    }
}

with entry {
    c1 = Calculator(a=12, b=5, op="+");
    c1.compute();

    c2 = Calculator(a=20, b=4, op="/");
    c2.compute();

    c3 = Calculator(a=7, b=8, op="*");
    c3.compute();

    c4 = Calculator(a=9, b=9, op="-");
    c4.compute();

    c5 = Calculator(a=5, b=0, op="/");
    c5.compute();
}
