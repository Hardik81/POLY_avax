pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Hcircuit () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal x;
   signal y;  
   signal output q;  
   component orgate=OR();
   component andgate=AND();
   component notgate=NOT();
   andgate.a <== a;
   andgate.b <== b;
   x <== andgate.out;
   notgate.in <== b;
   y <== notgate.out;
   orgate.a <== x;
   orgate.b <== y;
   q <== orgate.out; 
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
component main = Hcircuit();
