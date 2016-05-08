[ coffee ] = [ (require "coffee-script") ]

describe "CoffeeScript named arguments", ->

  it "exists and works", ->


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


    fn5 = (foo,{
      bar,
      baz
    },qux) ->
      return foo + bar + baz + qux


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

    expect(fn5("foo",bar:"bar",baz:"baz","qux")).toBe("foobarbazqux")
    expect(

      fn5(
        "foo",
        bar:"bar",
        baz:"baz",
        "qux"
      )
      
    ).toBe("foobarbazqux")

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
      errmessage1 = err.message

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
      errmessage2 = err.message

    expect(errmessage1).toBeDefined()
    expect(errmessage1).toBe('unexpected ,')
    expect(errmessage2).toBeDefined()
    expect(errmessage2).toBe('unexpected ,')