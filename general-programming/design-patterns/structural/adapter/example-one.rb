# This is an example of a service class. This is often a third party library.
# We'll use venmo as our first example of a third party service that is being used
# by our client class.
class Venmo
  def pay(recipient, amount)
    # Third party code.
  end
end

# We also need to support CashApp's payment service. This service has a different
# interface than the venmo service.
class CashApp
  def send(recipient, amount)
    # Third party code.
  end
end

# Our last third party service example, that we need to support in our application,
# is PayPal. Again, this also has it's own interface that we need to interact with,
# that is different from the other two. It could become quite unruly, if we handled
# the logic for sending a payment, in our client class, via conditional logic.
class PayPal
  def send_payment(recipient, amount)
    # Third party code
  end
end

# Finally, let's take a look at our client code. Our client code, is a PaymentDeliverer
# class, that will send a payment via one of the third party services above.
class PaymentDeliverer
  # In this case, because we are using the adapter pattern, we will construct our
  # class with the desired adapter. This follows the principles of Dependency Inversion
  # and Opened/Closed.
  def initialize(service)
    @service = service
  end

  # We are not in control of the third party application code, we could monkey patch
  # the third party classes to support our desired naming, but that can start feeling
  # a little weird. Instead we can decide on a uniform naming convention for the payment
  # method's in each of our adapter, and use that to translate to the appropriate
  # service payment method. In this case, our adapters also kind of double as proxy objects,
  # as we are able to substitute any of the adapters in the pay method.
  def pay(recipient, amount)
    @service.pay(recipient, amount)
  end
end

# Here is our classes for each of our adapters. We simply inject our service into
# the adapter class and add our desirably named method, let that method do the "translating".
class VenmoAdapter
  def initialize(service)
    @service = service 
  end

  def pay(recipient, amount)
    @service.pay(recipient, amount 
  end
end

class CashAppAdapter
  def initialize(service)
    @service = service
  end

  def pay(recipient, amount)
    @service.send(recipient, amount)
  end
end

class PayPalAdapter
  def initialize(service)
    @service = service
  end

  def pay(recipient, amount)
    @service.send_payment(recipient, amount)
  end
end
