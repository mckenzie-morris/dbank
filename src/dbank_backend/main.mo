import Debug "mo:base/Debug"; // import 'Debug' library from Motoko base library
import Int "mo:base/Int";

actor DBank {

  /* instantiate and assign a variable (data type is inferred to be 
  'Nat' since it is a positive number) */
  var currentValue = 300;
  

  /* Adding the keyword 'stable' will persist data across deployments. Without
    the 'stable' keyword, the var defaults to 'flexible' (non-persisted):
    stable var currentValue: Nat = 300;
  
    re-assign value to variable:
    currentValue := 100;
  
    'let' keyword is similar to JS 'const':
    let id = 2847590394; 

    analogous to JS console.log():
    'debug_show()' 
  
    function necessary if value to be printed is NOT text:
    Debug.print(debug_show(id)); 
  
    function below is an example of a 'private function'- only available within an 
    actor's ('DBank') context:
  
    func topUp() {
      currentValue += 1;
      Debug.print(debug_show(currentValue));
    };

    topUp();

    adding the keyword 'public' as prefix to the function will make it globally 
    available- like: 

    public func topUp() {
      currentValue += 1;
      Debug.print(debug_show(currentValue));
    };

  */

  /*   if an input parameter is specified, the parameter type must also be specified 
  i.e. 'amount: Nat' --> 'Nat' meaning natural number */
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }
    // quotes encapsulating a string must be "" NOT ''
    else {Debug.print("Amount too large currentValue less than zero")}
  };

  /* when a function has a specified output, the function must be asynchronous.
  query functions are intended to be read-only, and therefore are much faster than
  examples above */
  public query func checkBalance(): async Nat  {
    return currentValue;
  };

} 