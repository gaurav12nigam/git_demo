*** Settings ***
Library  ../Automation_Robot/oper_mat.py
Library  ../Automation_Robot/numbers.py     ${n1}       ${n2}


*** Variables ***
${n1}       50
${n2}       60

*** Test Cases ***
Calling Functions From PY File
    [Documentation]  Test_call_fun_normal
    [Tags]      Regression
    ${n1}=      Convert to Integer      ${n1}
    ${n2}=      Convert to Integer      ${n2}
    ${res}=     oper_mat.multiply     ${n1}        ${n2}
    ${res}=     Convert to string       ${res}
    Should Be Equal     ${res}       3000

Calling Custom Keywords
    [Documentation]  User Defined Keyword
    [Tags]      Regression
    ${n1}=      Convert to Integer      ${n1}
    ${n2}=      Convert to Integer      ${n2}
    ${res}=     My Custom Keyword   ${n1}   ${n2}
    ${res}=     Convert to string       ${res}
    Should Be Equal     ${res}       10

Calling Using OOps
    [Documentation]  Object  oriented approach
    [Tags]      Regression
    #Class:numbers
    ${n1}=      Convert to Integer      ${n1}
    ${n2}=      Convert to Integer      ${n2}
    ${res}=     numbers.sum
    ${res}=     Convert to string       ${res}
    Should Be Equal     ${res}       110



*** Keywords ***
