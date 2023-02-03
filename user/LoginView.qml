import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3 //2.12

//echoMode：模式,如果设置密码模式输入密码后显示的是圆点
Rectangle{

    id:root
    width: 330
    height: 550
    color: "transparent"//transparent

    //倒计时
    property int downInt: -1


    //0手机号，1账号登录,2微信登录
    //用于微信登录的情况下启动定时器轮询请求登录状态，非微信登录则关闭定时器
    property int loginType: 0

    //手机号验证标志
    property bool firstInputPhone: true
    property int isPhoneNumber: -1//-1初始，1失败，0成功

    //验证码验证标志
    property bool firstInputCode: true
    property int isCode: -1//-1初始，1失败，0成功

    //账号验证标志
    property bool firstInputAccount: true
    property int isAccount: -1//-1初始，1失败，0成功

    //密码验证标志
    property bool firstInputPass: true
    property int isPass: -1//-1初始，1失败，0成功

    //图形验证标志
    property bool firstInputImageCode: true
    property int isImageCode: -1//-1初始，1失败，0成功


    //是否可以登录标志
    property bool enableLogin: false

    //手机号账号，微信登录切换
    function onChange(){
        if(loginType == 0 || loginType == 1){
            loginType = 2
        }else{
            loginType = 0
        }
    }

    //验证是否可以登录
    function judgeLogin(){

        //根据登录方式，校验是否可以登录
        if(loginType == 0){
            var phoneSuccess = RegExp(/^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/).test(tfPhone.text)

            var codeSuccess = (tfCode.text.length === 4)

            enableLogin = (phoneSuccess && codeSuccess)
        }else if(loginType == 1){
            var accountSuccess = tfAccount.text.length>0
            var passSuccess = tfPass.text.length>0
            var imageCodeSuccess = tfImageCode.text.length>0
            enableLogin = (accountSuccess && passSuccess && imageCodeSuccess)
        }

        var str = loginType==0?"手机号":"账号"
        console.log("登录方式为 "+str+" ，是否能登录"+enableLogin)
    }

    Column{

        spacing: 10
        Text{
            Layout.rowSpan: 1
            text: "登录"
            font.pointSize: 23
            color: "#ffffff"
        }


        StackLayout{
            id:stackMain
            anchors.topMargin: 20
            width: root.width
            //height: root.height
            currentIndex: (loginType==0||loginType==1)?0:1

            //手机号账号登录相关view
            Column{

                function aa(index){
                    loginType = index
                }

                spacing: 30
                TabBar{
                    id:tabBar
                    Material.accent: "#3468fe"
                    Material.background: "transparent"//transparent
                    TabButton{

                        contentItem:Text{
                            text: "短信登录/注册"
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignBottom
                            color: tabBar.currentIndex === 0?"#ffffff":"#80ffffff"
                        }
                    }
                    TabButton{

                        contentItem:Text{
                            text: "账号登录"
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignBottom
                            color: tabBar.currentIndex === 1?"#ffffff":"#80ffffff"
                        }

                    }

                }


                StackLayout{

                    currentIndex: tabBar.currentIndex

                    onCurrentIndexChanged: {
                        loginType = tabBar.currentIndex
                        judgeLogin()
                    }
                    //手机号登录
                    Column{
                        //Material.accent: "#3468fe"
                        TextField{
                            id:tfPhone
                            width: stackMain.width
                            implicitHeight: 45
                            placeholderText: "请输入手机号"
                            placeholderTextColor: "#4cffffff"

                            verticalAlignment: TextInput.AlignVCenter
                            topPadding: 5
                            bottomPadding: 5
                            leftPadding: 5

                            font.pixelSize: 14
                            color: "#ffffff"

                            //实时校验
                            onTextChanged: {
                                judgeLogin();
                            }
                            //失去焦点校验
                            onActiveFocusChanged: {
                                if(firstInputPhone){
                                    firstInputPhone = false;
                                }else{
                                    var isPhone = RegExp(/^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/).test(tfPhone.text)
                                    if(isPhone){
                                        isPhoneNumber = 0;
                                    }else{
                                        isPhoneNumber = 1;
                                    }
                                }
                            }
                            background: Rectangle{
                                color: "#1affffff"
                                border.width: 1
                                radius: 8
                                border.color: isPhoneNumber == 1?"#c45656":tfPhone.focus?"#3468fe":"#4cffffff"
                            }

                        }
                        //手机号提示
                        Text{
                            opacity: isPhoneNumber == 1?1:0
                            height: 20
                            text: "请输入正确的手机号"
                            color: "#f56c6c"
                            anchors.bottomMargin: 5
                            font.pixelSize: 12
                        }



                        Row{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 10
                            TextField{
                                id:tfCode
                                width: (stackMain.width-10) * 0.7
                                implicitHeight: 45
                                placeholderText: "请输入验证码"
                                placeholderTextColor: "#4cffffff"
                                verticalAlignment: TextInput.AlignVCenter
                                topPadding: 5
                                bottomPadding: 5
                                leftPadding: 5
                                color: "#ffffff"
                                font.pixelSize: 14
                                background: Rectangle{
                                    color:"#1affffff"
                                    border.width: 1
                                    radius: 8
                                    border.color: isCode == 1?"#c45656":tfCode.focus?"#3468fe":"#4cffffff"
                                }
                                onTextChanged: {
                                    judgeLogin();
                                }
                                onActiveFocusChanged: {
                                    if(firstInputCode){
                                        firstInputCode = false;
                                    }else{
                                       isCode = (tfCode.text.length === 4)?0:1
                                    }
                                }
                            }
                            Rectangle{
                                implicitHeight: 45
                                implicitWidth: (stackMain.width-10) * 0.3
                                radius: 8
                                color: (RegExp(/^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/).test(tfPhone.text) && downInt < 0)
                                       ?"#3468fe":"#1affffff"

                                Timer {
                                       id: countDown
                                       interval: 1000
                                       repeat: true
                                       triggeredOnStart: true
                                       onTriggered: {
                                           tvCode.text = downInt;
                                           downInt -= 1;
                                           if (downInt < 0){
                                               countDown.stop();
                                               tvCode.text = "重新获取";
                                           }
                                       }
                                   }

                                Text {
                                    id: tvCode
                                    text: qsTr("获取验证码")
                                    color: "#ffffff"
                                    anchors.centerIn: parent
                                }
                                MouseArea{
                                    enabled: (RegExp(/^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/).test(tfPhone.text) && downInt < 0)
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        downInt = 60;
                                        countDown.start();
                                    }
                                }
                            }
                        }

                        //验证码提示
                        Text{
                            opacity: isCode == 1?1:0
                            height: 20
                            text: "请输入4位验证码"
                            color: "#f56c6c"
                            anchors.bottomMargin: 5
                            font.pixelSize: 12
                        }

                        Row{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 10
                            TextField{
                                id:tfVerify
                                width: (stackMain.width-10) * 0.7
                                implicitHeight: 45
                                placeholderText: "首次注册请填写邀请码"
                                placeholderTextColor: "#4cffffff"
                                verticalAlignment: TextInput.AlignVCenter
                                topPadding: 5
                                bottomPadding: 5
                                leftPadding: 5
                                color: "#ffffff"
                                font.pixelSize: 14
                                background: Rectangle{
                                    color: "#1affffff"
                                    border.width: 1
                                    radius: 8
                                    border.color: tfVerify.focus?"#3468fe":"#4cffffff"
                                }
                            }
                            Rectangle{
                                implicitHeight: 45
                                implicitWidth: (stackMain.width-10) * 0.3
                                radius: 8
                                color: "#3468fe"
                                Text {
                                    text: qsTr("获取邀请码")
                                    color: "#ffffff"
                                    anchors.centerIn: parent
                                }
                                MouseArea{
                                    cursorShape: Qt.PointingHandCursor
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log("Clicked on:" + buttonTextId.text)
                                    }
                                }
                            }
                        }

                    }

                    //账号登录
                    Column{
                        //Material.accent: "#3468fe"
                        TextField{
                            id:tfAccount
                            width: stackMain.width
                            implicitHeight: 45
                            placeholderText: "请输入账号"
                            placeholderTextColor: "#4cffffff"

                            verticalAlignment: TextInput.AlignVCenter
                            topPadding: 5
                            bottomPadding: 5
                            leftPadding: 5

                            font.pixelSize: 14
                            color: "#ffffff"

                            //实时校验
                            onTextChanged: {
                                //judgeLogin();
                            }
                            //失去焦点校验
                            onActiveFocusChanged: {
                                if(firstInputAccount){
                                    firstInputAccount = false;
                                }else{
                                   isAccount = (tfAccount.text.length > 0)?0:1
                                    console.log("账号:"+isAccount)
                                }
                            }
                            background: Rectangle{
                                color: "#1affffff"
                                border.width: 1
                                radius: 8
                                border.color: isAccount == 1?"#c45656":tfAccount.focus?"#3468fe":"#4cffffff"
                            }

                        }
                        //账号提示
                        Text{
                            opacity: isAccount == 1?1:0
                            height: 20
                            text: "请输入账号"
                            color: "#f56c6c"
                            anchors.bottomMargin: 5
                            font.pixelSize: 12
                        }


                        TextField{
                            id:tfPass
                            width: stackMain.width
                            implicitHeight: 45
                            placeholderText: "请输入密码"
                            placeholderTextColor: "#4cffffff"

                            verticalAlignment: TextInput.AlignVCenter
                            topPadding: 5
                            bottomPadding: 5
                            leftPadding: 5

                            font.pixelSize: 14
                            color: "#ffffff"

                            //实时校验
                            onTextChanged: {
                                judgeLogin();
                            }
                            //失去焦点校验
                            onActiveFocusChanged: {
                                if(firstInputPass){
                                    firstInputPass = false;
                                }else{
                                   isPass = (tfPass.text.length > 0)?0:1
                                }
                            }
                            background: Rectangle{
                                color: "#1affffff"
                                border.width: 1
                                radius: 8
                                border.color: isPass == 1?"#c45656":tfPass.focus?"#3468fe":"#4cffffff"
                            }

                        }
                        //密码提示
                        Text{
                            opacity: isPass == 1?1:0
                            height: 20
                            text: "请输入密码"
                            color: "#f56c6c"
                            anchors.bottomMargin: 5
                            font.pixelSize: 12
                        }



                        Row{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 10
                            TextField{
                                id:tfImageCode
                                width: (stackMain.width-10) * 0.7
                                implicitHeight: 45
                                placeholderText: "请输入验证码"
                                placeholderTextColor: "#4cffffff"
                                verticalAlignment: TextInput.AlignVCenter
                                topPadding: 5
                                bottomPadding: 5
                                leftPadding: 5
                                color: "#ffffff"
                                font.pixelSize: 14
                                background: Rectangle{
                                    color: "#1affffff"
                                    border.width: 1
                                    radius: 8
                                    border.color: tfImageCode.focus?"#3468fe":"#4cffffff"
                                }
                                //实时校验
                                onTextChanged: {
                                    judgeLogin();
                                }
                                //失去焦点校验
                                onActiveFocusChanged: {
                                    if(firstInputImageCode){
                                        firstInputImageCode = false;
                                    }else{
                                       isImageCode = (tfImageCode.text.length > 0)?0:1
                                    }
                                }
                            }
                            Rectangle{
                                implicitHeight: 45
                                implicitWidth: (stackMain.width-10) * 0.3
                                radius: 8
                                color: "#3468fe"
                                Text {
                                    text: qsTr("获取验证码")
                                    color: "#ffffff"
                                    anchors.centerIn: parent
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        console.log("Clicked on:" + buttonTextId.text)
                                    }
                                }
                            }
                        }

                        //图形验证码提示
                        Text{
                            opacity: isImageCode == 1?1:0
                            height: 20
                            text: "请输入验证码"
                            color: "#f56c6c"
                            anchors.bottomMargin: 5
                            font.pixelSize: 12
                        }


                    }

                }


                Rectangle{
                    enabled: enableLogin
                    implicitHeight: 45
                    implicitWidth: parent.width
                    radius: 45/2
                    color: enableLogin?"#3468fe":"#4cffffff"
                    Text {
                        text: qsTr("登录")
                        color: "#ffffff"
                        font.pixelSize: 14
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Clicked on:" + buttonTextId.text)
                        }
                    }
                }

                Button{
                    Layout.preferredHeight: 35
                    Layout.preferredWidth: 35
                    anchors.horizontalCenter: parent.horizontalCenter

                    icon.width: 25
                    icon.height: 25
                    onClicked: onChange()
                    icon.source: "qrc:/images/wechat.png"
                    icon.color:"#ffffff"



                    background: Rectangle {
                        color:"#1afa29"
                        radius: 25
                      //color: Qt.rgba(250/255,250/255,250/255,1)
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        acceptedButtons: Qt.NoButton
                    }


                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("未注册用户在手机验证后自动创建账号")
                    color: "#80ffffff"
                }

            }

            //微信登录相关view
            Column{

                height: stackMain.height
                width: stackMain.width

                spacing: 40

                Rectangle{height: 30
                width: 1
                color: "transparent"
                }

                Rectangle{
                    id:wxMain
                    width: 180
                    height: 180
                    color: "transparent"
                    anchors.horizontalCenter: parent.horizontalCenter
                    Image {
                        id:wxBg
                        anchors.centerIn: parent
                        anchors.fill: parent
                        source: "qrc:/images/wx-code-bg.png"
                    }
                    Image {
                        anchors.centerIn: parent
                        width: 130
                        height: 130
                        source: "qrc:/images/wx-code.jpg"
                    }
                }

                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "微信扫码自动注册/登录"
                    color: "#ffffff"
                    font.pixelSize: 16
                }

                Rectangle{
                    height: 20
                    width: 120
                    color: "transparent"
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        font.pixelSize: 16
                        text: "密码登录 | 注册"
                        color: "#3468fe"
                    }
                    MouseArea{
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: {
                            onChange()
                        }
                    }
                }


            }

        }

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                color: "#80ffffff"
                text: qsTr("登录即表示您同意影音同画的")
            }

            Rectangle{
                width: 70
                height: 20
                color: "transparent"
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("《用户协议》")
                }
                MouseArea{
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }

            Text {
                color: "#80ffffff"
                text: qsTr("与")
            }

            Rectangle{
                width: 70
                height: 20
                color: "transparent"
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("《隐私协议》")
                }
                MouseArea{
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked: {


                    }
                }
            }
        }
    }
}



