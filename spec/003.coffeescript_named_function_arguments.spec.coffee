npmlibs = require("child_process").execSync("npm config get prefix").toString().trim()
coffee = require "#{npmlibs}/lib/node_modules/coffee-script/"

describe "CoffeeScript named arguments", ->

  it "exist and work", ->

    fn1 = ({foo,bar}) ->
      return foo + bar

    fn2 = (foo,{bar,baz}) ->
      return foo + bar + baz

    fn3 = (foo,{bar,baz},qux) ->
      return foo + bar + baz + qux

    fn4 = ({
      foo,
      bar
    }) ->
      return foo + bar

    expect(fn1(foo:"foo",bar:"bar")).toBe("foobar")
    expect(
      fn1(
        foo:"foo",
        bar:"bar"
      )
    ).toBe("foobar")

    expect(fn2("foo",bar:"bar",baz:"baz")).toBe("foobarbaz")
    expect(
      fn2(
        "foo",
        bar:"bar",
        baz:"baz"
      )
    ).toBe("foobarbaz")

    expect(fn3("foo",bar:"bar",baz:"baz","qux")).toBe("foobarbazqux")
    expect(
      fn3(
        "foo",
        bar:"bar",
        baz:"baz",
        "qux"
      )
    ).toBe("foobarbazqux")

    expect(fn4(foo:"foo",bar:"bar")).toBe("foobar")
    expect(
      fn4(
        foo:"foo",
        bar:"bar"
      )
    ).toBe("foobar")

  it "have some syntax limitations", ->

    try
      coffee.eval(
        """
        fn = (
          foo,
          {bar,baz},
          qux
        )
        """
      )
    catch err
      errmessage = err.message

    expect(errmessage).toBeDefined()
    expect(errmessage).toBe('unexpected ,')

    try
      coffee.eval(
        """
        fn = (
          foo,
          {
            bar,
            baz
          },
          qux
        )
        """
      )
    catch err
      errmessage = err.message

    expect(errmessage).toBeDefined()
    expect(errmessage).toBe('unexpected ,')