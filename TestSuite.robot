*** Settings ***
Library           AppiumLibrary

*** Variables ***
${RemoteUrl}      http://localhost:4723/wd/hub
${PlatformName}    Android
${PlatformVersion}    7.0
${DeviceName}     192.168.183.101:5555
${PackageName}    my.soulusi.androidapp.develop
${MainActivity}    my.soulusi.androidapp.ui.activity.MainActivity
${Email}          hilda14003@mail.unpad.ac.id
${Password}       hildafd24
${Question}       Bagaimana mengelola keuangan bagi fresh graduate?

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

Logout
    [Tags]    logout
    Logout

*** Keywords ***
Open apps
    Open Application    ${RemoteUrl}    platformName=${PlatformName}    platformVersion=${PlatformVersion}    deviceName=${DeviceName}    appPackage=${PackageName}    appActivity=${MainActivity}
    Sleep    5s

Select lang
    Click Element    xpath=//android.widget.LinearLayout[@resource-id='my.soulusi.androidapp.develop:id/lyt_toolbar_language']
    Click Element    xpath=//android.widget.LinearLayout[@resource-id='my.soulusi.androidapp.develop:id/btn_indonesia']
    Sleep    5s

Find login page
    Click Element    xpath=//android.widget.FrameLayout[@resource-id='my.soulusi.androidapp.develop:id/action_profile']
    Click Element    xpath=//android.widget.Button[@resource-id='my.soulusi.androidapp.develop:id/btn_no_login_view_action']
    Sleep    3s

Fill login form
    Input Text    xpath=//android.widget.EditText[@resource-id='my.soulusi.androidapp.develop:id/et_email']    ${Email}
    Input Password    xpath=//android.widget.EditText[@resource-id='my.soulusi.androidapp.develop:id/et_password']    ${Password}
    Click Element    xpath=//android.widget.Button[@resource-id='my.soulusi.androidapp.develop:id/btn_login']
    Sleep    5s
    Element Should Be Visible    xpath=//android.widget.ImageView[@resource-id='my.soulusi.androidapp.develop:id/iv_toolbar_logo']

Find add question page
    Click Element    xpath=//android.widget.LinearLayout[@resource-id='my.soulusi.androidapp.develop:id/btn_toolbar_ask']
    Sleep    3s

Add question
    Input Text    xpath=//android.widget.EditText[@resource-id='my.soulusi.androidapp.develop:id/et_question']    ${Question}
    Click Element    xpath=//android.widget.LinearLayout[@resource-id='my.soulusi.androidapp.develop:id/btn_close_suggestion']
    Sleep    2s
    Click Element    xpath=//android.widget.ImageView[@resource-id='my.soulusi.androidapp.develop:id/iv_drop_down']
    Sleep    2s
    Click Element    xpath=//android.widget.TextView[@resource-id='my.soulusi.androidapp.develop:id/tv_country_name']
    Click Element    xpath=//android.widget.Button[@resource-id='my.soulusi.androidapp.develop:id/btn_save']
    Sleep    2s
    Click Element    xpath=//android.widget.Button[@resource-id='my.soulusi.androidapp.develop:id/btn_submit']
    Sleep    5s
    Element Should Be Visible    xpath=//android.widget.ImageView[@resource-id='my.soulusi.androidapp.develop:id/iv_toolbar_logo']

Logout
    Click Element    xpath=//android.widget.FrameLayout[@resource-id='my.soulusi.androidapp.develop:id/action_profile']
    Click Element    xpath=//android.widget.TextView[@text='Settings' or @text='Pengaturan' or @text='Tetapan' or @text='设置']
    Click Element    xpath=//android.widget.TextView[@resource-id='my.soulusi.androidapp.develop:id/btn_logout']
    Click Element    xpath=//android.widget.Button[@resource-id='my.soulusi.androidapp.develop:id/btn_save']
    sleep    5s
    Element Should Be Visible    xpath=//android.widget.TextView[@resource-id='my.soulusi.androidapp.develop:id/lyt_ask_no_login']
