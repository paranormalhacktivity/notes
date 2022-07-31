# Adapter Pattern

## Gang of Four definition
“Convert the interface of a class into another interface clients expect. Adapter 
lets classes work together that couldn’t otherwise because of incompatible interfaces.”

## Intent
It is a structural pattern that allows objects with incompatible interfaces to collaborate.

## What is a real world problem that this would solve?
You need to add a feature that would allow for clients to pay using a third-party
service. Your payment class communicates with this third party service, no problem,
however, your customer/manager says that a new payment service must be added and
this service has different naming convention for the payment method than the previous
service. You could add a conditional that checks what service the class needs to use
but this has the potential to become quite messy, since a conditional would need to
get added each time a new payment service needs to be supported.

## How could this pattern be used to solve the problem above?
You could create an adapter object for each new service that needs to be supported. 
These adapter objects would implement a uniformly named payment method that maps to
the third-party services' payment method. This would then allow you to inject the
adapter object into your payment class, and call that uniformly named method, no matter
the adapter passed in. Your payment class is now agnostic.

## Real world analogy
Say you book a trip to Europe and take all of your electronics. When you get there,
you realize that the outlet is completely different from that of America. You need
to be able to charge your phone, what do you do? You buy a power adapter, that will
essentially "translate" the power plug to the power socket.

## When to use this pattern
 - When you want to use an existing class but it's interface is not compatible with
   the rest of your code.
 - When you want to reuse several existing subclasses that lack some common functionality
   that can't be added to the superclass. You could extend to each subclass and put the
   missing functionality into each new child class, however, that would cause a bunch of 
   duplication, which is a code smell. The more elegant solution is to create an adapter,
   and add the missing functionality to it instead, and wrap the objects with the missing
   functionality, inside the adapter class. The target classes should have a common
   interface and the adapter should follow that interface. This approach looks similar
   to the decorator pattern.


## How to implement
1. Have two classes with incompatible interfaces.
2. Declare the client interface and describe how clients communicate with the service
3. Create the adapter class and make it follow the client interface
4. Store reference to the service object, this can be done by initializing the
   adapter class with the service object, or sometimes it's more convenient to pass
   it to the adapter when calling the methods.
5. Implement all of the methods of the client interface in the adapter class. The adapter
   should delegate most of the real work to the service object, handling only the
   interface or data format conversion.
6. Clients should use the adapter via the client interface, this will allow for the changing
   or extending of the adapters without affecting the client code.

## Pros vs. Cons

### Pros
 - Follows Single Responsibility Principle. You can separate the interface or data
   conversion from the core business logic of the application.
 - Follows the Open/Closed Principle. You can introduce new types of adapters into the
   code, without breaking the existing client's code.

### Cons
 - This adds complexity, as new interfaces/classes need to be added to the system. Sometimes
   it's easier to just modify the service class, so that it matches your code.

## How does it relate to other patterns
 - "Bridge" is usually designed upfront, allowing parts of an application to be developed
   independently of each other, while "Adapter" is usually implemented using an existing
   application and allowing some otherwise-incompatible classes to communicate with each
   other.
 - "Adapter" changes the interface of an existing object, while "Decorator" enhances
   an object without changing it's interface. In addition, "Decorator" supports recursive
   composition while adapter does not.
 - "Adapter" providers a different interface of a wrapped object, "Proxy" providers it
   with the same, and "Decorator" provides an enhanced interface.
 - "Facade" defines a new interface for existing objects, while "Adapter" tries to
   make the existing interface usable. "Adapter" usually wraps one object, while
   "Facade" works with an entire subsystem of objects.
 - "Bridge", "State", "Strategy", and to a degree "Adapter", all have a similar structure.
   All of these patterns are based on composition, which is delegating work to other
   objects. However, they all solve different problems. A pattern isn't just a recipe
   for structuring your code in a specific way, it can also communicate to other 
   developers, the problem that it solves.
