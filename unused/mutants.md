# Mutants
** Rust Mistakes
The fault of java was oop when all you wanted was a function so why do we also
do this in rust with &mut self. Dont use impl blocks for structs.
+ ok when it takes ownership of self or constructs self
+ just done take ref self (or ref mut self)
+ only benifite is nice syntax and generic propogation
  + the syntax can hide details that are nessisary to understand the code
  + generics are the one place were i think there is a valid disagreement to be
    had but i think it makes your code better. see princibal of least power. if
    you dont need all the bounds on the struct then you dont need it. If you
    need addtional just add them.
+ It also makes it hard to know what is a method and what is a trait. In
  addtion, you should also use to more verbose Trait::method(self) syntax for
  the same reasons. it lets you know what you are calling.
