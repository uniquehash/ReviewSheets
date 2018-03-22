
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








