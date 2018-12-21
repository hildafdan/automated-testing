*** Settings ***
Library           AppiumLibrary

*** Variables ***
${RemoteUrl}      http://localhost:4723/wd/hub
${PlatformName}    Android
${PlatformVersion}    4.1.1
${DeviceName}     192.168.183.101:5555
${PackageName}    my.soulusi.androidapp.develop
${MainActivity}    my.soulusi.androidapp.ui.activity.MainActivity
${Email}          hilda14003@mail.unpad.ac.id
${Password}       hildafd24

*** Test Cases ***
Login
    [Tags]    login
    Open apps
    Find login page
    Fill login form

*** Keywords ***
Open apps
    Open Application    ${RemoteUrl}    platformName=${PlatformName}    platformVersion=${PlatformVersion}    deviceName=${DeviceName}    appPackage=${PackageName}    appActivity=${MainActivity}
    Sleep    5s

Find login page
    Click Element    xpath=//android.widget.FrameLayout[@index=2]
    Click Button    Login
    Sleep    5s

Fill login form
    Input Text    xpath=//android.widget.EditText[@index=2]    ${Email}
    Input Password    xpath=//android.widget.EditText[@index=0]    ${Password}
    Click Button    Login
    Sleep    5s
