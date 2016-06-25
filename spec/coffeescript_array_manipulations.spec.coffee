####################################################################################################
describe "CoffeeScript array manipulations", ->
####################################################################################################
####################################################################################################
  it "multiple array manipulation oneliners", ->

    ################################################################################################


    arr1 = ["A","B"," ","D","E"," ","|","A","B"," ","D","E"," "]
    arr2 = ["A"," ","C","D"," ","F","|","A"," ","C","D"," ","F"]
    arr3 = ["A"," ","C","D","E"," ","|","A"," ","C","D","E"," "]


    # Array merging.
    multiple_array_merge_1 = arr1.concat [arr2,arr3]...
    multiple_array_merge_2 = [].concat [arr1,arr2,arr3]...
    multiple_array_merge_3 = [arr1,arr2,arr3].reduce((prev,next) -> prev.concat(next))
    multiple_array_merge_4 = (-> @push el for el in arr for arr in [arr1,arr2,arr3];@).apply([])
    expect(multiple_array_merge_1).toEqual([
      "A","B"," ","D","E"," ","|","A","B"," ","D","E"," ",
      "A"," ","C","D"," ","F","|","A"," ","C","D"," ","F",
      "A"," ","C","D","E"," ","|","A"," ","C","D","E"," ",
    ])
    expect(multiple_array_merge_2).toEqual([
      "A","B"," ","D","E"," ","|","A","B"," ","D","E"," ",
      "A"," ","C","D"," ","F","|","A"," ","C","D"," ","F",
      "A"," ","C","D","E"," ","|","A"," ","C","D","E"," ",
    ])
    expect(multiple_array_merge_3).toEqual([
      "A","B"," ","D","E"," ","|","A","B"," ","D","E"," ",
      "A"," ","C","D"," ","F","|","A"," ","C","D"," ","F",
      "A"," ","C","D","E"," ","|","A"," ","C","D","E"," ",
    ])
    expect(multiple_array_merge_4).toEqual([
      "A","B"," ","D","E"," ","|","A","B"," ","D","E"," ",
      "A"," ","C","D"," ","F","|","A"," ","C","D"," ","F",
      "A"," ","C","D","E"," ","|","A"," ","C","D","E"," ",
    ])


    # Array unique.
    multiple_array_unique_1 = (-> @push el for el in arr when el not in @ for arr in [arr1,arr2,arr3];@).apply([])
    expect(multiple_array_unique_1).toEqual(
      ["A","B"," ","D","E","|","C","F"]
    )


    # Array intersections.
    multiple_array_intersect_1 = [arr1,arr2,arr3].reduce((prev,next) -> prev.filter((el) -> next.includes(el)))
    expect(multiple_array_intersect_1).toEqual(
      ["A"," ","D"," ","|","A"," ","D"," "]
    )

    ################################################################################################

####################################################################################################
####################################################################################################
  it "fixed number array manipulation oneliners", ->

    ################################################################################################


    arr1 = ["A","B"," ","D","E"," ","|","A","B"," ","D","E"," "]
    arr2 = ["A"," ","C","D"," ","F","|","A"," ","C","D"," ","F"]


    array_unique_1 = arr1.filter((el,key,arr) -> arr.indexOf(el) is key)
    array_unique_2 = (-> @push el for el in arr1 when el not in @;@).apply([])
    array_unique_3 = (item for item, key in arr1 when key is arr1.indexOf(item))

    expect(array_unique_1).toEqual(["A","B"," ","D","E","|"])
    expect(array_unique_2).toEqual(["A","B"," ","D","E","|"])
    expect(array_unique_3).toEqual(["A","B"," ","D","E","|"])


    ################################################################################################
