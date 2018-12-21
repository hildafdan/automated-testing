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
${Question}       Bagaimana mengelola keuangan bagi fresh graduate

*** Test Cases ***
Open apps
    [Tags]    open
    Open apps

Select lang
    [Tags]    lang
    Select lang

Login
    [Tags]    login
    Find login page
    Fill login form

Add question
    [Tags]    question
    Find add question page
    Add question

*** Keywords ***
Open apps
    Open Application    ${RemoteUrl}    platformName=${PlatformName}    platformVersion=${PlatformVersion}    deviceName=${DeviceName}    appPackage=${PackageName}    appActivity=${MainActivity}
    Sleep    5s

Select lang
    Click Element    xpath=//android.widget.LinearLayout[@index=3]
    Click Element    xpath=//android.widget.RelativeLayout[@index=2]
    Sleep    5s

Find login page
    Click Element    xpath=//android.widget.TextView[@text='Profil']
    Click Button    Masuk
    Sleep    3s

Fill login form
    Input Text    xpath=//android.widget.EditText[@index=2]    ${Email}
    Input Password    xpath=//android.widget.EditText[@index=0]    ${Password}
    Click Button    Masuk
    Sleep    5s

Find add question page
    Click Element    xpath=//android.widget.TextView[@text='Tanya']
    Sleep    3s

Add question
    Input Text    xpath=//android.widget.EditText[@index=1]    ${Question}
    Click Element    xpath=//android.widget.TextView[@text='Tutup Saran']
    Click Element    xpath=//android.widget.TextView[@text='Silahkan pilih topik']
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text='Keuangan']
    Click Button    Simpan
    Sleep    5s
    Click Button    Kirim
    Sleep    5s
