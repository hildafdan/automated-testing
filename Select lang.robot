*** Settings ***
Library           AppiumLibrary

*** Variables ***
${RemoteUrl}      http://localhost:4723/wd/hub
${PlatformName}    Android
${PlatformVersion}    4.1.1
${DeviceName}     192.168.183.101:5555
${PackageName}    my.soulusi.androidapp.develop
${MainActivity}    my.soulusi.androidapp.ui.activity.MainActivity

*** Test Cases ***
Select lang
    [Tags]    lang
    Open apps
    Select lang

*** Keywords ***
Open apps
    Open Application    ${RemoteUrl}    platformName=${PlatformName}    platformVersion=${PlatformVersion}    deviceName=${DeviceName}    appPackage=${PackageName}    appActivity=${MainActivity}
    Sleep    5s

Select lang
    Click Element    xpath=//android.widget.LinearLayout[@index=3]
    Click Element    xpath=//android.widget.RelativeLayout[@index=2]
    Sleep    5s
