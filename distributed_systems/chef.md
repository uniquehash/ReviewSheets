# notes on chef the configuration management tool

* what is [chef in the context of distributed systems](https://en.wikipedia.org/wiki/Chef_(software))?
    *  configuration management tool written in ruby and erlang
        * uses a pure-ruby DSL for writing system configuration recipes
    * used to streamline the task of configuring and maintaining servers
        * can integrate with cloud-based platforms to automatically provision and configure new machines
            * internap
            * amazon EC2
            * google cloud platform
            * openStack
            * softLayer
            * microsoft Azure
            * rackspace
    * contains solutions for both small and large scale systems with features and pricing for the respective ranges
    
* what is a [configuration management in the context of distributed systems](http://devopsbootcamp.osuosl.org/11_devops.html)?
    * configuration management is the process of standardizing resource configurations and enforcing their state across IT infrastructure in an automated yet agile manner
    * infastructure as code
        * cm enables ops to define their infrastructure in code
        * install packages, configure software, start/stop services
        * ensure a state of a machine
        * ensure policies and standards are in place
        * provide history of changes for a system
        * repeatable way of rebuilding systems
        * orchestrate a cluster of services together
    * CM platforms
        * CFengine
            * lightweight agent system
            * manages configuration of a large number of computers using the client-server paradigm or stand-alone
        * puppet
            * puppet consists of a custom declarative language to describe system configuration 
            * distributed using the client-server parafigm 
        * chef
            * a configuration management tool written in Ruby 
            * uses a pure Ruby DSL for writing configuration recipes
            * client-server model
        * ansible
            * combines in one package
                * multi-node deployment
                * ad-hoc tast execution
                * configuration management
            * utilizes SSH with little to no remote agents
    * CM platform comparison
        * CFengine scales like mad, not very agile
        * puppet
            * uses a list of dependencies and figures out what order to run it in
            * pupper DSL can become a blocker and a problem
            * has scaling issues
        * chef
            * executes commnads and scripts as they are listed with minimal amount of dependencies
            * using ruby offers both advantages and disadvantages
        * each platform offers its own level of complexity
        
* what are [chefs features](https://en.wikipedia.org/wiki/Chef_(software)#Features)?
    * user writes recipes that describe how chef manages server applications and utilities and how they are to be configured
    * recipes can be grouped together as a cookbook for ease of management 
    * recipes describe a series of resources that should be in a particular state
        * packages that should be installed
        * services that should be running
        * files that should be written
    * resources can be configured to specific versions of software to run and can ensure that software is installed in the correct order based on dependencies
    * chef ensures that resources are properly configured and corrects any resource that is not in the desired state
    * can run in two modes 
        * clien/server mode 
            * sends various attributes about the node to the chef server
            * server uses solr to index these attributes and provides an API for clients to query this information
            * chef can query these attributes and use the resulting data to help configure nodes
        * chef-solo mode standalone configuration
            * who knows what goes on here

* what does [infrastructure as code mean](https://en.wikipedia.org/wiki/Infrastructure_as_Code)?
    * the process of managing and provisioning computer data centers through machine-readable definition files rather than physical hardware configuration or interactive configuration tools
        * basically "cloud"
    * the IT infrastructure meant by this comprises both physical equipment such as bare-metal servers as well as virtual machines and associated configuration resources
    * can use either scripts or declarative definitions, usually declarative
    * IaC (Infrastructure as Code) supports IaaS (Infrastructure as a Service) but they are not synonymous
    * added value and advantages
        * cost (reduction)
        * speed (faster execution)
        * risk (remove errors and security violations)
    * types of approaches
        * declarative
            * focuses on what the eventual target configuration should be
            * defines desired state and system executes what needs to happen to achieve that sate
        * imperative
            * focuses on how the infrastructure is to be changed to meet this
            * defines specific commands that need to be executed in the appropriate order to end with the desired conclusion
        * intelligent
            * focuses on why the configuration should be a certain way in consideration of all the co-relationships and co-dependencies of multiple applications runnong on the same infrastructure typically found in production
            * determines the correct desired state before the system executes what needs to happen to achieve a desired state that does not impact co-dependent applications
    * methods
        * push
            * controlling server pushes the configuration to the destination system
        * pull
            * server to be configured pulls its configuration from the controlling server
    * tools
        * CCA (Continuous Configuration Automation)
            * an extension of traditional IaC frameworks
            * leverages IaC to
                * change
                * configure
                * automate infrastructure
            * provides in how your infrastructure is managed
                * visibility
                * efficiency
                * flexibility
            * community content
                * many open source tools and content
            * tools
                * ansible tower
                    * method: push
                    * approach: declarative and imperative
                    * python
                * CFengine
                    * method: pull
                    * approach: declarative
                * chef
                    * method: pull
                    * approach imperative
                    * ruby
                * otter
                    * method: push
                    * approach: declarative and imperative
                * puppet
                    * method: pull
                    * approach: declarative
                    * ruby
                * saltstack
                    * method: push and pull
                    * approach: declarative and imperative
                    * python
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
        
