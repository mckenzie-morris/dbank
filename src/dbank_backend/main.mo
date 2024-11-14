import Debug "mo:base/Debug"; // import 'Debug' library from Motoko base library
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
stable var startTime : Int = Time.now();
Debug.print(debug_show(startTime));


  /*Adding the keyword 'stable' will persist data across deployments. Without
    the 'stable' keyword, the var defaults to 'flexible' (non-persisted): */
    stable var currentValue: Float = 300;

  /* instantiate and assign a variable (data type is inferred to be 
    'Nat' since it is a positive number) 
    var currentValue = 300;
  
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
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
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
  public query func checkBalance(): async Float  {
    return currentValue;
  };

  /* Compound interest formula:
  
    A=P(1 + r/n)^nt 
    
    A	=	final amount
    P	=	initial principal balance
    r	=	interest rate
    n	=	number of times interest applied per time period
    t	=	number of time periods elapsed
  
  */
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    // convert time elapsed in nanoseconds to seconds
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
} 