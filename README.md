# UnitTest
iOS unit testing is software testing that involves testing individual units of source code for iOS apps.

Assertion
| Assertion | Purpose |
| --------- | ------- |
| XCTAssertEqual(_: _:) | Asserts that two values are equal |
| XCTAssertEqual(_: _:) | Asserts that two floating-point values are equal within a certain accuracy |
| XCTAssertNil(_:) | Asserts that an optional values is nil |
| XCTAssertNotNil(_:) | Asserts that an optional value is not nil |
| XCTAssertTrue(_:) | Asserts an expression is true |
| XCTAssertFalse(_:) | Asserts that an expression is false Fails the current test |
| XCTFail() | Fail the current test, You should always provide a descriptive test |

## Keys Takeaways
What are the key points from this chapter that you should apply to your
coding?
A test case is a function in a subclass of XCTestCase where the function has
the following traits:
– Its name starts with test
– It has no parameters, and no return value
– It isn’t private
- Press D-U (think U for “unit test”) to run tests.
- An assertion failure marks the test as failing. Otherwise, the test case
passes.
- Avoid conditional branches in test code to keep test code simple. You can
do this by choosing an assertion that expresses the condition you need.
- When comparing floating-point numbers, use XCTAssertEqual() with an accuracy: argument.
- If your test needs a condition that the built-in assertions don’t provide,
then put an XCTFail() (with a description message) inside a conditional
clause.
- Check the failure reporting of your tests. If the description of an object is
hard to read, provide a custom description by conforming to the CustomStringConvertible protocol.
