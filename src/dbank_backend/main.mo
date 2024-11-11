import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300; // instantiate and assing a variable
  currentValue := 100; // re-assign value to variable

  let id = 2847590394; // 'let' keyword is similar to JS 'const'

  Debug.print(debug_show(id));
}