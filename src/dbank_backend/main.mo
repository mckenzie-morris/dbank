import Debug "mo:base/Debug"; // import 'Debug' library from Motoko base library

actor DBank {
  var currentValue = 300; // instantiate and assing a variable
  currentValue := 100; // re-assign value to variable

  let id = 2847590394; // 'let' keyword is similar to JS 'const'

  // Debug.print(debug_show(id)); // 'debug_show()' function necessary if value to be printed is NOT text

  /* 
  
  function below is an example of a 'private function'- only available within an actor's ('DBank') context
  
    func topUp() {
    currentValue += 1;
    Debug.print(debug_show(currentValue));
  };

  topUp();

  adding the keyword 'public' as prefix to the function will make it globally available- like: 

    public func topUp() {
    currentValue += 1;
    Debug.print(debug_show(currentValue));
  };

  if an input parameter is specified, the parameter type must also be specified i.e. 'amount: Nat' --> Nat meaning natural number
  */
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  }
} 