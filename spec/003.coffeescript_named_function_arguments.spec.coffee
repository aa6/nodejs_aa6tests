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


    result1 = fn1(foo:"foo",bar:"bar")


    result2 = fn1(
      foo:"foo",
      bar:"bar"
    )


    result3 = fn2("foo",bar:"bar",baz:"baz")


    result4 = fn2(
      "foo",
      bar:"bar",
      baz:"baz"
    )


    result5 = fn3("foo",bar:"bar",baz:"baz","qux")


    result6 = fn3(
      "foo",
      bar:"bar",
      baz:"baz",
      "qux"
    )


    result7 = fn4(foo:"foo",bar:"bar")


    result8 = fn4(
      foo:"foo",
      bar:"bar"
    )


    result9 = fn5("foo",bar:"bar",baz:"baz","qux")


    result10 = fn5(
      "foo",
      bar:"bar",
      baz:"baz",
      "qux"
    )


    expect(result1).toBe("foobar")
    expect(result2).toBe("foobar")
    expect(result3).toBe("foobarbaz")
    expect(result4).toBe("foobarbaz")
    expect(result5).toBe("foobarbazqux")
    expect(result6).toBe("foobarbazqux")
    expect(result7).toBe("foobar")
    expect(result8).toBe("foobar")
    expect(result9).toBe("foobarbazqux")
    expect(result10).toBe("foobarbazqux")


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