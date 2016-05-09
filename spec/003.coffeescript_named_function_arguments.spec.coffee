[ coffee ] = [ (require "coffee-script") ]
####################################################################################################
describe "CoffeeScript named arguments", ->

  it "exists and works", ->

    ################################################################################################
    fn1 = ({foo,bar}) ->
      return foo + bar

    result1 = fn1(foo:"foo",bar:"bar")

    result2 = fn1(
      foo:"foo",
      bar:"bar"
    )
    ################################################################################################
    expect(result1).toBe("foobar")
    expect(result2).toBe("foobar")
    ################################################################################################

    ################################################################################################
    fn2 = (foo,{bar,baz}) ->
      return foo + bar + baz

    result3 = fn2("foo",bar:"bar",baz:"baz")

    result4 = fn2(
      "foo",
      bar:"bar",
      baz:"baz"
    )
    ################################################################################################
    expect(result3).toBe("foobarbaz")
    expect(result4).toBe("foobarbaz")
    ################################################################################################

    ################################################################################################
    fn3 = (foo,{bar,baz},qux) ->
      return foo + bar + baz + qux

    result5 = fn3("foo",bar:"bar",baz:"baz","qux")

    result6 = fn3(
      "foo",
      bar:"bar",
      baz:"baz",
      "qux"
    )
    ################################################################################################
    expect(result5).toBe("foobarbazqux")
    expect(result6).toBe("foobarbazqux")
    ################################################################################################

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





    expect(result7).toBe("foobar")
    expect(result8).toBe("foobar")
    expect(result9).toBe("foobarbazqux")
    expect(result10).toBe("foobarbazqux")


  it "can have default values", ->


    fn1 = ({foo = 'foo',bar}) ->
      return foo + bar


    fn2 = (foo,{
      bar,
      baz = 'baz'
    },qux) ->
      return foo + bar + baz + qux


    result1 = fn1(bar:"bar")


    result2 = fn1({})


    result3 = fn2("foo",bar:"bar","qux")


    result4 = fn2(
      "foo",
      bar:"bar",
      "qux"
    )


    expect(result1).toBe("foobar")
    expect(result2).toBe("fooundefined")
    expect(result3).toBe("foobarbazqux")
    expect(result4).toBe("foobarbazqux")


  it "can have trailing commas", ->


    fn1 = ({foo,bar,}) ->
      return foo + bar


    fn2 = ({
      foo,
      bar,
    }) ->
      return foo + bar


    result1 = fn1(foo:"foo",bar:"bar")


    result2 = fn1(
      foo:"foo",
      bar:"bar"
    )


    expect(result1).toBe("foobar")
    expect(result2).toBe("foobar")


  it "has syntax limitations", ->


    # `fn1()` call should be `fn1({})` because it needs an object to make destructuring assignment.
    try
      coffee.eval(
        """
        fn1 = ({foo = 'foo',bar}) ->
          return foo + bar

        console.dir fn1()
        """
      )
    catch err
      errmessage1 = err.message


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
      errmessage2 = err.message


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
      errmessage3 = err.message

    expect(errmessage1).toBe("Cannot read property 'foo' of undefined")
    expect(errmessage2).toBe("unexpected ,")
    expect(errmessage3).toBe("unexpected ,")