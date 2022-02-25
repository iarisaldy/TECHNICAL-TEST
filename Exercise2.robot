*** Settings ***
Library           MyLibrary

*** Variables ***
${STRING}=        cat
${NUMBER}=        ${1}
@{LIST}=          one    two    three
&{DICTIONARY}=    string=${STRING}    number=${NUMBER}    list=@{LIST}
${ENVIRONMENT_VARIABLE}=    %{PATH=Default value}

*** Test Cases ***
Do conditional IF - ELSE IF - ELSE execution
    IF    ${NUMBER} > 1
        Log    Greater than one.
    ELSE IF    "${STRING}" == "dog"
        Log    It's a dog!
    ELSE
        Log    Probably a cat. 🤔
    END

Loop a list
    Log    ${LIST}    # ['one', 'two', 'three']
    FOR    ${item}    IN    @{LIST}
        Log    ${item}    # one, two, three
    END
    FOR    ${item}    IN    one    two    three
        Log    ${item}    # one, two, three
    END

Loop a dictionary
    Log    ${DICTIONARY}
    # {'string': 'cat', 'number': 1, 'list': ['one', 'two', 'three']}
    FOR    ${key_value_tuple}    IN    &{DICTIONARY}
        Log    ${key_value_tuple}
        # ('string', 'cat'), ('number', 1), ('list', ['one', 'two', 'three'])
    END
    FOR    ${key}    IN    @{DICTIONARY}
        Log    ${key}=${DICTIONARY}[${key}]
        # string=cat, number=1, list=['one', 'two', 'three']
    END

Loop a range from 0 to end index
    FOR    ${index}    IN RANGE    10
        Log    ${index}    # 0-9
    END

Loop a range from start to end index
    FOR    ${index}    IN RANGE    1    10
        Log    ${index}    # 1-9
    END

Loop a range from start to end index with steps
    FOR    ${index}    IN RANGE    0    10    2
        Log    ${index}    # 0, 2, 4, 6, 8
    END

Nest loops
    @{alphabets}=    Create List    a    b    c
    Log    ${alphabets}    # ['a', 'b', 'c']
    @{numbers}=    Create List    ${1}    ${2}    ${3}
    Log    ${numbers}    # [1, 2, 3]
    FOR    ${alphabet}    IN    @{alphabets}
        FOR    ${number}    IN    @{numbers}
            Log    ${alphabet}${number}
            # a1, a2, a3, b1, b2, b3, c1, c2, c3
        END
    END

Exit a loop on condition
    FOR    ${i}    IN RANGE    5
        Exit For Loop If    ${i} == 2
        Log    ${i}    # 0, 1
    END

Continue a loop from the next iteration on condition
    FOR    ${i}    IN RANGE    3
        Continue For Loop If    ${i} == 1
        Log    ${i}    # 0, 2
    END

Create a scalar variable
    ${animal}=    Set Variable    dog
    Log    ${animal}    # dog
    Log    ${animal}[0]    # d
    Log    ${animal}[-1]    # g

Create a number variable
    ${π}=    Set Variable    ${3.14}
    Log    ${π}    # 3.14

Create a list variable
    @{animals}=    Create List    dog    cat    bear
    Log    ${animals}    # ['dog', 'cat', 'bear']
    Log    ${animals}[0]    # dog
    Log    ${animals}[-1]    # bear

Create a dictionary variable
    &{dictionary}=    Create Dictionary    key1=value1    key2=value2
    Log    ${dictionary}    # {'key1': 'value1', 'key2': 'value2'}
    Log    ${dictionary}[key1]    # value1
    Log    ${dictionary.key2}    # value2

Access the items in a sequence (list, string)
    ${string}=    Set Variable    Hello world!
    Log    ${string}[0]    # H
    Log    ${string}[:5]    # Hello
    Log    ${string}[6:]    # world!
    Log    ${string}[-1]    # !
    @{list}=    Create List    one    two    three    four    five
    Log    ${list}    # ['one', 'two', 'three', 'four', 'five']
    Log    ${list}[0:6:2]    # ['one', 'three', 'five']

Log available variables
    Log Variables
    # ${/} = /
    # &{DICTIONARY} = { string=cat | number=1 | list=['one', 'two', 'three'] }
    # ${OUTPUT_DIR} = /Users/<username>/...
    # ...

Evaluate Python expressions
    ${path}=    Evaluate    os.environ.get("PATH")
    ${path}=    Set Variable    ${{os.environ.get("PATH")}}

Use special variables
    Log    ${EMPTY}    # Like the ${SPACE}, but without the space.
    Log    ${False}    # Boolean False.
    Log    ${None}    # Python None
    Log    ${null}    # Java null.
    Log    ${SPACE}    # ASCII space (\x20).
    Log    ${SPACE * 4}    # Four spaces.
    Log    "${SPACE}"    # Quoted space (" ").
    Log    ${True}    # Boolean True.

