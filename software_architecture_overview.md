
* what is [software design](https://en.wikipedia.org/wiki/Software_design)?
    * the process by which an agent creates a specification of a software artifact, intendedto accomplish goals, using a set of primitive components and subject to constraints
    * main components of software design
        * SRA (Software Requirements Analysis)
            * encompasses those tasks that go into determining the needs or conditions to meet for a new or altered product or project by
                * taking account of the possibly conflicting requirements of the various stakeholders
                * analyzing system requirements
                * documenting system requirements
                * validating system requirements
                * managing system requirements
        * UX (User eXperience) design
            * the process of enhancing user satisfaction with a product by improving
                * usability
                * accessability 
                * pleasure provided in the interaction with the product 
            * may yield storyboards to help determine those specifications 
    * software analysis versus software design
        * analysis output
            * smaller problems to solve
        * analysis process
            * similar teams, organizations, and problems
        * design output
            * focuses on capabilities and thus multiple designs for the same problem will exist
        * design process
            * varies dependent on the environment 
    * software design as a process and a model
        * process
            * a sequence of steps that enable the designer to describe all aspects of the software for building 
        * model
            * begins by representing the totality of the thing that to be built 
            * slowly the thing is refined to provide guidance for constructing each detail
            * artifacts created provide different views of the software
    * set of principles
        * the design process should not suffer from tunnel vision
            * good designers consider alternative approaches judging each based on the requirements of the problem and the resources to do the job
        * the design should be traceable to the analysis model 
            * must be able to determine which requirements are met by which part of the model
        * the design should not reinvent the wheel
            * systems are constructed using a set of design patterns, many of which have been solved. use them. 
        * the design should minimize the intellectual distance between the software and the problem as it exists in the real world
            * the structure of the design should whenever possible mimic the structure of the problem domain
        * the design should exhibit uniformity and integration
            * design is uniform if it appears fully coherent 
            * design is integrated if care is taken in defining interfaces between design components
        * the design should be structured to accommodate change
        * the design should be structured to degrade gently 
            * things should not blow up
        * design is not coding, coding is not design
            * even when the detailed procedural designs are created for program components the level of abstraction of the design model is higher than source code
        * the design should be assessed for quality as it is being created not after the fact
            * a variety of design concepts and design measures are available to assist the designer in assessing quality throughout the development process
        * the design should be reviewed to minimize conceptual errors
            * substance over form
    * software design tools
        * UML (Unified Modeling Language)
            * general purpose, developmental, modeling language in the field of software engineering, that is intended to provide a standard way to visualize the design of a system
        * FMC (Fundamental Modeling Concepts)
            * provide a framework to describe software intensive systems using a semi-formal graphical notation
    * fundamental design concepts
        * abstraction
            * the process or result of generalization by reducing the information content of a concept or an observable phenomenon
            * an act of representing essential features without including background details or explanations
        * refinement
            * the process of elaboration
            * a hierarchy is developed by decomposing a macroscopic statement of function in a step-wise fashion until programming language statements are reached
                * in each step one or several instructions of a given program are decomposed into more detailed instructions
            * abstraction and refinement are complementary concepts
        * modularity
            * software architecture is divided into components called modules
        * software architecture 
            * refers to the overall structure of the software and the ways in which that structure provides conceptual integrity for a system
            * good software architecture will yield return on investment with resepct to the desired outcome of the project
        * control hierarchy 
            * a program structure that represents the organization of a program component and implies a hierarchy of control
        * structural partitioning
            * the program structure can be divided both horizontally and vertically
                * horizontal partitions define separate branches of modular hierarchy for each major program function
                * vertical partitioning suggests that control and work should be distributed top down in the program structure
        * data structure
            * representation of the logical relationship among individual elements of data
        * software procedure
            * focuses on the processing of each module individually
        * information hiding
            * modules should be specified and designed so that information contained within a module is inaccessible to other modules that have no need for such information 
        * PHAME
            * by Grady Booch
            * stands for 
                * Principles of Hierarchy
                * Abstraction
                * Modularisation
                * Encapsulation
    * design considerations
        * aspects to consider when building software, the importance of each should reflect the goals and expectations that the software is being created to meet
        * compatibility
            * able to operate with other products that are designed for interoperability with another product
        * extensibility
            * new capabilities can be added to the software without major changes to the underlying architecture
        * modularity
            * resulting software comprises well defined, independent components which leads to better maintainability
            * components could be then implemented and tested in isolation before being integrated to form a desired software system
            * eases division of work in software development
        * fault-tolerance
            * the software is resistant to and able to recover from component failure
        * maintainability
            * a measure of how easily bug fixes or functional modifications can be accomplished
            * high maintainability can be the product of modularity and extensibility
        * reliability 
            * the software is able to perform a required function under stated conditions for a specified period of time
        * reusability
            * the ability to use some or all of the aspects of the preexisting software in other projects with little or no modification
        * robustness
            * the software is able to operate under stress or tolerate unpredictable or invalid input
        * security
            * the software is able to withstand and resist hostile acts and influences
        * usability
            * the software user interface must be usable for its target user/audience 
            * default values for the parameters must be chosen so that they are a good choice for the majority of the users
        * performance
            * the software performs its task within a time-frame that is acceptable for the user, and does not require too much memory
        * portability
            * the software should be usable across a number of different conditions and environments
        * scalability
            * the software adapts well to increasing data or number of users 
    * modeling language 
        * an artificial language that can be used to express information, knowledge or systems in a structure that is defined by a consistent set of rules
            * these rules are used for the interpretation of the components within the structure
            * can be graphical or textual 
        * ADL (Architecture Description Language)
            * a language used to describe and represent the software architecture of a software system
        * BPMN (Business Process Modeling Notation)
            * an example of a Process Modeling language
        * EXPRESS 
            * an international standard general-purpose data modeling language
        * EEML (Extended Enterprise Modeling Language)
            * commonly used for business process modeling across a number of layers
        * Flowchart
            * a schematic representation of an algorithm or step-wise process
        * FMC (Fundamental Modeling Concepts)
            * modeling language for software-intensive systems
        * IDEF
            * a family of modeling languages
            * IDEF0
                * functional modeling
            * IDEF1X
                * information modeling
            * IDEF5
                * modeling ontologies
        * JSP (Jackson Structured Programming)
            * a method for structured programming based on correspondences between data stream structure and program structure
        * LePUS3
            * an object-oriented visual Design Description Language and a format specification language that is suitable primarily for modeling large object-oriented programs and design patterns
        * UML (Unified Modeling Language)
            * a general modeling language to describe software both structurally and behaviorally 
            * has a graphical notation and allows for extension with a profile 
        * Alloy
            * a general purpose specification language for expressing complex structural constraints and behavior in a software system 
            * provides a concise language based on first-order relational logic
        * SysML (Systems Modeling Language)
            * a new general-purpose modeling language for systems engineering
        * SOMF (Service-Oriented Modeling Framework)
    * design patterns
        * a template or pattern describing a solution to a common problem
        * identify design problem which has been thoroughly explored, and solve it with the proper solution
        
* what is [solid(object oriented design)](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design))?
    * a mnemonic acronym for five design principles intended to make software design more understandable, flexible, and maintainable
    * single responsibility principle
        * a class should have only a single responsibility
    * open/closed principle
        * software entities should be open for expansion, but closed for modification
    * liskov substitution principle
        * objects in a program should be replacable with instances of their subtypes without altering the correctness of that program 
        * also known as design by contract
    * interface segregation principle
        * many client-specific interfaces are better than one general-purpose interface
    * dependency inversion principle 
        * one should depend upon abstractions not concretions 

* what is the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle)?
    * is a computer programming principle that states that every module or class should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class
    * all of its services should be narrowly aligned with that responsibility 
    * a class should have one reason to change

* what is the [open/closed principle](https://en.wikipedia.org/wiki/Open/closed_principle)?
    * software entities should allow its behaviour to be extended without modifying its source code 
    * meyer's open/closed principle
        * a module is open if it is still available for extension
            * add fields to the data structure it contains, new elements to the set of functions it performs
        * a module is closed if it is available for use by other modules 
            * assumes that the module has been given a well-defined stable description
        * solution is implementation inheritance 
            * parent class is still closed but the child class can extend the functionality
            * direct relationship between classes
    * polymorphic open/closed principle 
        * advocates inheritance from abstract base classes
        * interface is still closed but new implementations are open but implement at minimum the interface

* what is a [inference rule](https://en.wikipedia.org/wiki/Rule_of_inference)?
    * in logic a rule of inference, inference rule, transformation rule is a logical form consisting of a function which takes premises, analyzes their syntax, and returns a conclusion

* what is [entailment](https://en.wikipedia.org/wiki/Logical_consequence)?
    * means logical consequence
    * a fundamental concept in logic which describes the relationship between statements that holds true when one statement logically follows from one or more statements 
    * a valid logical argument is one in which the conclusion is entailed by the premises, because the conclusion is the consequence of the premises
    
* what are [free variables and bound variables](https://en.wikipedia.org/wiki/Free_variables_and_bound_variables)?
    * in mathematics and other disciplines involving formal languages
        * free variables
            * a notation that specifies places in an expression where substitution may take place 
        * bound variable
            * a variable that was previously free but has been bound to a specific value or set of values called domain of discourse or universe 

* what is a [formal system](https://en.wikipedia.org/wiki/Formal_system)?
    * any well defined system of abstract thought based on the model of mathematics 
    * need not be mathematical 
    * basics
        * each formal system uses a set of primitive symbols to finitely construct a formal language from a set of axioms through inferential rules of formation
        * the system thus consist of valid formulas built up through finite combinations of the primitive symbols 
            * combinations that are formed from the axioms in accordance with the stated rules
        * formal definition
            * a finite set of symbols that can be used for constructing formulas 
            * a grammar which tells how well-formed formulas are constructed out of the symbols in the alphabet
                * usually required that there be a decision procedure for deciding whether a formula is well formed or not
            * a set of axioms or axiom schemata 
                * each axiom must be a well formed formula
            * a set of inference rules 
    * properies of formal systems
        * recursive 
            * a formal system that if the set of axioms and the set of inference rules are decidable sets or semidecidable sets respectively
        * inference and entailment 
            * the entailment of the system by its logical foundation is what distinguishes a formal system from others which may have some basis in an abstract model
        * formal language
            * a language defined by a formal system
        * logical system
            * a logical system or for short logic is a formal system together with a form of semantics usually in the form of model-theoretic interpretation which assigns truth values to sentences of the formal language, that is, formulae that contain no free variables
        * deductive inference
            * a deductive system consists of axioms and rules of inference that can be used to derive theorems of the system 
            * preserve deductive qualities in the formulas that are expressed in the system
                * usually the quality we are concerned with is truth as opposed to falsehood
                * other things such as justification or belief may be preserved instead
            * in order to sustain its deductive integrity a deductive aparatus must be defined without reference to any intended interpretation of the language 
                * the aim is to ensure that each line of a derivation is merely a syntactic consequence of the lines that precede it 
                * there should be no element of any interpretation of the language that gets involved with the deductive nature of the system 

* what is [type theory](https://en.wikipedia.org/wiki/Type_theory)?
    * in mathematics, logic, and computer science a type theory is any of a class of formal systems, some of which can serve as alternatives to set theory as a foundation for all mathematics 
    * in type theory every term has a type and operations are restricted to terms of a certain type

* what is a [type constructor](https://en.wikipedia.org/wiki/Type_constructor)?
    * in an area of mathematical logic and computer science known as type theory 
        * a feature of a typed formal language that builds new types from old ones
        * basic types are considered to be built using nullary type constructors 
        * some type constructors take another type as an argument

* what are [variance, covariance and contravariance](https://en.wikipedia.org/wiki/Covariance_and_contravariance_(computer_science))?
    * variance
        * refers to how subtyping between more complex types relates to subtyping between their components
        * questions addressed
            * how should a list of `Cat`s relate to a list of `Animal`s?
            * how should a function returning `Cat` relate to a function returning `Animal`?
        * depending on the variance of the type constructor the subtyping relation of the simple types to their respective complex types may be either
            * preserved
                * covariant
            * reversed
                * contravariant
            * ignored 
    * covariant
        * the subtyping relation of the simple types are preserved for the complex types
        * example
            * `list of Cat` is a subtype of `list of Animal`
    * contravariant 
        * subtyping relation of the simple types is reversed for the complex types
        * example
            * `function from Animal to String` is a subtype of `function from Cat to String`
    * programming language designers will consider variance when devising typing rules for language features such as arrays, inheritance, and generic datatypes
    * formal definition
        * within the type system of a programming language a typing rule or a type constructor is 
            * covariant 
                * if it preserves the ordering of types which orders types from more specific to more generic
            * contravariant
                * if it reverses this ordering
            * bivariant
                * if both apply at the same time
            * invariant or nonvariant 
                * if neither apply 
    * data structures
        * read-only data types, or sources,  can be covariant
        * write-only data types, or sinks, can be contravariant
        * mutable data types which act as both sources and sinks should be invariant 
    * function types
        * languages with first class functions have function types 
            * `a function expecting a Cat and returning an Animal`
        * these languages also need to specify when one function type is a subtype of another 
            * when it is safe to use a function of one type in a context that expects a function of a different type
        * it is safe to substitute a function f for a function g if f accepts a more general type of arguments and returns a more specific type than g
            * both functions of type `Cat -> Cat` and `Animal -> Animal` can be used whenever a `Cat -> Animal` was expected
        * the `->` type constructor is contravariant in the input type and covariant in the output type

* what is the [liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle)?
    * a principle of object-oriented programming stating that 
        * if S is a subtype of T
            * then objects of type T may be replaced with objects of type S
                * without altering any of the desirable properties of the program
    * also known as strong behavioral subtyping 
        * a particular type of a subtype relation
    * imposes standard requirements on signatures 
        * contravariance of method arguments in the subtype
        * covariance of return types in the subtype
        * no new exceptions should be thrown by methods of the subtype, except where those exceptions are themselves subtypes of exceptions thrown by the methods of the supertype
    * imposes number of behavioral conditions
        * preconditions
            * cannot be strengthened in a subtype
        * postconditions
            * cannot be weakened in a subtype
        * invariants
            * of the supertype must be preserved in a subtype
        * history constraint
            * objects are regarded as being modifiable only through their methods
            * subtypes are not allowed to introduce methods that are not present in the supertype

* what is a [precondition](https://en.wikipedia.org/wiki/Precondition)?
    * precondition for any routine defines any constraint on object state which are necessary for succesful execution
        * the routine caller's portion of the contract 
        * caller then is obligated to ensure that the precondition holds prior to calling the routine
        * the reward for the caller's effort is expressed in the called routine's postcondition
    * in the presence of inheritance the routines inherited by descendant classes do so with their preconditions in force 
        * any implementation or redefinitions of inherited routines also have to be written to comply with their inherited contractor
        * preconditions can be modified in redefined routines but they may only be weakened 
            * the redefined routine may lessen the obligation of the client but not increase it 
    
* what is a [postcondition](https://en.wikipedia.org/wiki/Postcondition)?
    * the postcondition of any routine is a declaration of the properties which are guaranteed upon completion of the routine's execution
    * as it relates to the routine's contract, the postcondition offers assurance to the potential callers that in cases in which the routine is called in a state in which its precondition holds, the properties declared by the postcondition are assured
    * in the presence of inheritance the routines inherited by descendant subclasses do so with their contracts, that is their preconditions and postconditions, in force
        * this means that any implementation or redefinition of inherited routines also have to be written to comply with their inherited contracts
        * postconditions can be modified in redefined routines, but they may only be strengthened
            * the redefined routine may increase the benefits it provides the client, but may not decrease those benefits 

* what is an [invariant](https://en.wikipedia.org/wiki/Invariant_(computer_science))?
    * a condition that can be relied upon to be true during execution of a program, or during some portion of it 
            
* what is the [interface segregation principle](https://en.wikipedia.org/wiki/Interface_segregation_principle)?
   * no client should be forced to depend on methods it does not use
   * intended to keep a system decoupled and thus easier to refactor, change, and redeploy 
   * split interfaces that are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them 
      * also known as role interfaces 
   * within object-oriented design, interfaces provide layers of abstraction that facilitate conceptual explanation of the code and create a barrier preventing coupling to dependencies 
      * a system may become so coupled at multiple levels that it is no longer possible to make a change in one place wihtout necessitating many additional changes, thus using an interface or an abstract class can prevent this side effect

* what is a [creational pattern](https://en.wikipedia.org/wiki/Creational_pattern)?
   * the creational patterns aim to separate a system from how its objects are created, composed, and represented
      * they increase the system's flexibility in terms of the what, who, how, and when of object creation
   * design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation 
      * the basic form of object creation could result in design problems or in added complexity to the design 
      * creational design patterns solve this problem by somehow controlling this object creation
   * composed of two dominant ideas
      * encapsulating knowledge about which concrete classes the system uses
      * another is hiding how instances of these concrete classes are created and combined 
   * categorized into
      * object-creational patterns
         * object creation
         * defer part of its object creation to another object
      * class-creational patterns
         * class instantiation 
         * defer its object creation to subclasses
   * well known design patterns that are parts of creational patterns
      * abstract factory pattern
         * provides an interface for creating related or dependent objects without specifying the objects concrete classes
      * builder pattern
         * which separates the construction of a complex object from its representation so that the same construction process can create different representations 
      * factory method pattern
         * which allows a class to defer instantiation to subclasses
      * prototype pattern
         * which specifies the kind of object to create using a prototypical instance, and creates new objects by cloning this prototype
      * singleton pattern
         * which ensures that a class only has one instance, and provides a global point of access to it
      * dependency injection pattern
         * a class accepts the object it requires from an injector instead of creating the objects directly
      * lazy initialization pattern
         * tactic of delaying the creation of an object, the calculation of a value, or some other expensive process until the first time it is needed 
      * object pool pattern
         * avoid expensive acquisition and release of resources by recycling objects that are no longer in use
   * modern usage
      * modern software engineers depend more on object composition than class inheritance
         * emphasis shifts away from hard-coding behaviors toward defining a smaller set of basic behaviors that can be composed into more complex ones
      * hard-coded behaviors are inflexible because they require overriding or re-implementating the whole thing in order to change parts of the design
      * consider using creational patterns when
         * a system should be independent of how its objects and products are created
         * a set of related objects is designed to be used together
         * hiding the implementations of a class library or product, revealing only their interfaces
         * constructing different representation of independent complex objects
         * a class instantiations are specified at run-time 
         * there must be a single instance and client can access this instance at all times
         * instance should be extensible without being modified

* what is the [dependency inversion principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)?
   * refers to a specific form of decoupling software modules
      * high-level modules should not depend on low-level modules, both should depend on abstractions
      * abstractions should not depend on details, details should depend on abstractions
   * traditional layers pattern
      * policy layer -> mechanism layer -> utility layer
      * in conventional application architecture
         * lower-level components are designed to be consumed by higher-level components which enable increasingly complex systems to be built 
         * higher-level components depend directly upon lower-level components to achieve some task
         * dependency upon lower-level components limits the reuse opportunities of the higher-level components
   * dependency inversion pattern
      * policy layer -> (interface) policy service interface <- mechanism layer -> (interface) mechanism service interface <- utility layer
      * by adding an abstract layer both high and lower-level layers reduce the traditional dependencies from top to bottom
      * both layers depend on abstractions that draw the behavior needed by higher-level layers
      * the inversion of dependencies and ownership encourages the re-usability of the higher/policy layers
         * upper layers could use other implementations of the lower services 
         * when the lower-level layer components are closed or when the application requires the reuse o existing services, it is common that an adapter mediates between the services and the abstractions 
   * dependency inversion pattern generalization
      * in many projects the dependency inversion principle and pattern are considered a single concept that should be generalized 
         * it is simpler to see a good thinking principle as a coding pattern 
         * once an abstract class or an interface has been coded the programmer may say "i have done the job of abstraction"
      * if the used mocking tool relies only on inheritance, generalizing the dependency inversion pattern may become a necessity 
         * simply implementing an interface over a class isn't sufficient and generally does not reduce coupling, only thinking about the potential abstraction of interactions can lead to a less coupled design 
         * implementating generic interfaces everywhere in a project makes it by far harder to understand and maintain
            * at each step the reader will ask themself what are the other implementations of this interface and the response is generally only mocks
         * the interface generalization requires more plumbing code, in particular factories that generally rely on a dependency-injection framework
         * interface generalization also restricts the usage of the programming language
      * generalization restrictions
         * the presence of interfaces to accomplish the depedency inversion pattern have other design implications in an object-oriented program 
            * all member variables in a class must be interfaces or abstracts 
            * all concrete class packages must connect only through interface or abstract class packages
            * no class should derive from a concrete class
            * no method should override an implemented method
            * all variable instantiation requires the implementation of a creational pattern such as the factory method or the factory pattern, or the use of a dependency-injection framework
      * interface mocking restrictions
         * using inheritance-based mocking tools also introduces restrictions
            * static externally visible members should systematically rely on dependency injection making them far harder to implement
            * all testable methods should become an interface implementation or an override of an abstract definition
      * future directions
         * principles are ways of thinking
         * patterns are common ways to solve problems
         * programming languages will continue to evolve to allow to enforce stronger and more precise usage contracts in at least two directions
            * enforcing usage conditions (pre, post, invariant)
            * state-based interfaces
         * more and more mocking tools now use code injection to solve the problem of replacing static and non-virtual members 
            * programming languages will probably evolve to generate mocking-compatible bytecode
               * one direction will restrict the usage of non-virtual members
               * the other will be to generate, at least in test situations, a bytecode allowing non-inheritance based mocking 

* what is a [factory in object oriented programming](https://en.wikipedia.org/wiki/Factory_(object-oriented_programming))?
   * an object for creating other objects 
   * a function or method that returns objects of a varying prototype or class from some method call, which is assumed to be new
      * more broadly, a subroutine that returns a new object may be referred to as a factory, as in factory method or factory function
   * class based programming
      * a factory is an abstraction of a constructor of a class
         * a constructor is concrete in that it creates objects as instances of a single class, and by a specified process through class instantiation 
         * a factory can create objects by instantiating various classes or by using other allocation schemes
   * while in prototype based programming
      * a factory is an abstraction of a prototype object 
         * a prototype object is concrete in that it is used to create objects by being cloned 
         * a factory can create objects by cloning various prototypes, or by other allocation schemes
   * syntax
      * factory method
         * when factories are methods of objects
      * factory function
         * when factories are callable objects 
      * in some languages constructors and factories have identitical syntax while in others constructors have a special syntax
         * python, perl, ruby, object pascal, f# are languages where constructors and factories have identical syntax
   * semantics
      * in languages where objects are dynamically allocated factories are semantically equivalent to constructors 
      * basically the difference is that factories are allocated at run time, and constructors are allocated at compile time
   * benefits
      * descriptive names
      * encapsulation
   * limitations
      * refactoring an existing class to use factories breaks existing clients, since constructor would become private
      * the class cannot be extended, since the pattern relies on using a private constructor
      * the subclass must reimplement all of the factory methods with exactly the same signature if it does force inheirtance by making the constructor protected instead of private

* what is the [abstract factory pattern](https://en.wikipedia.org/wiki/Abstract_factory_pattern)?
   * provides a way to encapsulate a group of individual factories that have a common theme without specifying their concrete classes
      * client software creates concrete implementation of the abstract factory and then uses the generic interface of the factory to create the concrete objects that are part of the theme 
      * client does not know which concrete objects it gets from each of these internal factories, since it uses only the generic interfaces of their products 
      * this pattern separates the details of implementation of a set of objects from their general usage and relies on object composition, as object creation is implemented in methods exposed in the factory interface 
   * the intent in employing the pattern is to insulate the creation of objects from their usage and to create families of related objects without having to depend on their concrete classes
      * allows for new derived types to be introduced with no change to code that uses the base class











