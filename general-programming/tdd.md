# What is TDD?

TDD, otherwise known as test-driven development, is the cyclical process of writing
a single test, before writing a single line of production code, then running the test, allowing
the test to fail, and writing just enough code for to satisfy the error message, and
repeating until no more errors are received and the test ultimately passes with green
success,  allowing the developer to move onto the writing of the next test. Thus
the cycle continues.

# What are the benefits?

There are many benefits to practicing TDD. It allows the developer to map out the
acceptance criteria and ensure that they are satisfying those requirements as they
build out the code. Because TDD forces writing a single test before writing
actual code, it forces the developer to think about the public api that is needed. 
Another great benefit to TDD, is that as the developer writes tests and build out
code to satisfy those tests, they now have a sort of "safety net", that allows them
to refactor code without the fear of messing something up, because things will just
need to be refactored until the tests run green again. There's also the most obvious
benefit, having tests for the code! That, in and of itself, should be enough to win
the heart of any developer. The more test coverage, the less bugs. And we, developers,
hate bugs!

# So how does one do TDD properly?

1. A first test has to be written. The first test can be hard to decide. While it
   is important to plan out what the public api should be, it's ultimately best to just 
   find a starting point and go with it. Consider that a "Dog" class is going to
   be built with TDD in mind. There are several methods that could be built off of
   `Dog`. There may be an `eat` method, a `sleep` method, a `bite` method, or a `bark`
   method. Find a simple point of entry to start. "bark" seems like a pretty easy
   starting point. Build out a skeleton test method with an explicit description of
   what the test should accomplish. This should be focused on testing one thing.

   ```
   class DogTest < Minitest::Test
     def test_dog_can_bark 

     end
   end
   ```

   If the test is ran, at this point, it will show that 1 run has completed successfully
   with no errors. This is because nothing has been asserted yet, and therefore
   nothing is actually being tested.

2. The test should have setup, this will create any of the things needed for the
   code to be tested. In the Dog example, it might make sense as part of the setup
   to save the expected results to a variable. This is not always necessary but
   adding for example purposes. The expected results could be just as easily coded
   directly in the assertion method as a parameter, and might make more sense for
   a test as simple as this. It's really all preference and whatever looks cleanest.

   ```
   class DogTest < Minitest::Test
     def test_dog_can_bark 
       expected_results = "woof!"
     end	
   end
   ```

   If the test is ran, at this point, it will show that 1 run has completed successfully
   with no errors. Again, this is because assertions have not been made yet. 

3. To have a test, there needs to be expected results for the test to assert against.
   The 'dog can bark' test has this as part of the setup and this is great because
   it now clearly presents a criteria for what the return for the class and method
   should be. This approach is already driving the development process! There also
   needs to be some thought around what the class and method, that are being tested, are going
   to be named. This, like the setup of expected return results, will further drive
   development, because now the developer will have decided on what class and method
   needs to be built.

   ```
   class DogTest < Minitest::Test
     def test_dog_can_bark 
	   expected_results = "woof!"
	   assert_equal(expected_results, Dog.new.bark)
     end
   end
   ```

   If the test is ran, at this point, the first failure will present itself, because
   now there is an assertion. Something is finally being tested. Because no real code
   has been written, this first error will say `NameError: Uninitialize constant DogTest::Dog`.

4. Now that the first error has presented itself, real code for the class can start
   being developed out, but in this step, only enough code should be written to resolve
   the error and get a new error message to present itself. It's tempting to just
   build the `Dog` class with a `bark` instance method that returns "woof!", but
   TDD promises better results if that inclination is resisted and the TDD rules
   are followed strictly. That being said, this is the introduction of just the
   `Dog` class, no methods.

   ```
   class Dog
   end
   ```

   Now upon running the test, an error is still presented but this time the error
   is different. Instead of there being an error about an uninitialized
   constant, the error now says `NoMethodError: undefined method `bark' for #<Dog:0x00005639119a81e8>`.
   This makes sense. There is now a `Dog` constant that can be initialized, but the
   test is calling `bark` off of that initialized `Dog`, and the `Dog` class currently
   has no instance method for `bark`.

5. Again, just enough code needs to be written in order for this particular error
   to go away, and the only way to do that is to create an empty method called `bark`.
   It is important that the method does not do anything, because that breaks the TDD
   rule of only coding enough to resolve the error.

   ```
   class Dog
     def bark
	 end
   end
   ```

   Now upon running the test, it's the first time that an error message is not
   produced, instead the test fails. The test is now saying, there is a working
   class and method, but it is not returning what it is expected to return. The
   test fails with the following message...

   ```
   Expected: "woof!"
   Actual: nil
   ```

6. At this point, just enough code needs to be written to get the `bark` method
   to return "woof!" and can be done so, quite simply.

   ```
   class Dog
     def bark
	   "woof!"
	 end
   end
   ```

7. Complexity is built off of this. A developer may decide at this point that a
   bark method that returns "woof!" may be appropriate for a German Shepherd, but
   may not be appropriate for a Chihuahua. Maybe the developer recalibrates at this
   point and realizes that they need to allow for a breed to be passed in at 
   initialization, but before they start working on doing that, it all goes back
   to the test.

   ```
   class DogTest < Minitest::Tes
	def test_dog_can_bark
	  expected_results = "woof!"
	  assert_equal(expected_reults, Dog.new("German Shepherd").bark)
	end
   end
   ```

   Now when this test gets ran, it returns an error message, this time it returns
   `ArgumentError: wrong number of arguments (given 1, expected 0)`. This is because
   the `initialize` was not built to accept an argument.

8. The test is now back to a state of red. TDD states that just enough code should
   be added to fix the failure. All this takes, is adding an empty `initialize` method
   that takes an argument. The "_" is conventional naming for any unused arguments.

   ```
   class Dog
     def initialize(_)
	 end

     def bark
	   "woof!"
	 end
   end
   ```

   And just like, that the test is back to returning green success.

9. At this point, it begins to feel like there needs to be a re-evaluation of what is actually
   being tested. It feel's like it's time to adjust the description of this particular
   test. Therefore this test might get renamed and maybe a test for a small dog gets
   added. 

   ```
   class DogTest < Minitest::Test
     def test_big_dog_bark
	   expected_results = "woof!"
	   assert_equal(expected_reults, Dog.new("German Shepherd").bark)
	 end	 

	 def test_little_dog_bark
	   expected_results = "yip!"
	   assert_equal(expected_results, Dog.new("Chihuahua").bark)
	 end
   end
   ```
   
   Maybe the developer decides that in order for the 'small dog bark' test
   to pass, there is gonna need to be a test around setting the dogs breed in the
   initialize, so they skip the `small dog bark` test, and come back to it after
   testing the breed. 

   ```
   class DogTest < Minitest::Test
     def test_breed_of_dog
	   expected_results = "German Shepherd"
	   assert_equal(expected_results, Dog.new("German Shepherd").breed)  
	 end

     def test_big_dog_bark
	   expected_results = "woof!"
	   assert_equal(expected_reults, Dog.new("German Shepherd").bark)
	 end	 

	 def test_little_dog_bark
	   skip
	   expected_results = "yip!"
	   assert_equal(expected_results, Dog.new("Chihuahua").bark)
	 end
   end
   ```

10. The process repeats itself with a different test, until all tests successfully pass
    and there are no more tests to be added.

# Summary

TDD makes the promise that if developers follow it's rules, then their code will
iteratively get better and they will have better test coverage because every new
piece of functionality added, started with a test. The results allow for
better refactoring, because developers can feel safe knowing that if their
refactors have resulted in failing tests, they just need to keep refactoring until
they get back to a state of green successes. This instills a level of confidence
that may even increase productivity. The developer will spend less time doing manual
testing. The developer can feel confident that so long as the tests are green, the
code is in just as good a state as it was before refactoring took place, and if it
isn't, then it can be picked up in QA and a test should be added to ensure that
whatever bug is found is not reintroduced into the code.
