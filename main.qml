
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3 //2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Dialogs 1.2

import "user"
import "common"
import "web"



ApplicationWindow {


    id:root
    width: 1280
    height: 750
    visible: true
    title: "影音同画"
    minimumWidth: 1280*0.8
    minimumHeight: 750*0.8

    //模态对话框
    WidgetDialog{
        id: exitDialog
        isDynamic: true
        tipText: "即将退出影音同画，是否继续？"
        onConfirm: {
            //退出应用
            Qt.quit()
        }
    }

    //拦截窗口关闭函数
    onClosing: {

        //弹出关闭提示
        exitDialog.open()

        //不处理
        close.accepted = false
    }

    //webview页面
    WebView{

    }


//    登录页面
//    Image{
//        height: root.height
//        anchors.left:parent.left
//        anchors.right: parent.right
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom

//        source: "qrc:/images/workbench-login-bg.png"

//        fillMode: Image.PreserveAspectCrop
//    }

//    LoginView{
//        anchors.right: parent.right
//        anchors.rightMargin: 100
//        anchors.verticalCenter: parent.verticalCenter
//    }

//    Image{
//        anchors.leftMargin: 20
//        anchors.topMargin: 20
//        anchors.top: parent.top
//        anchors.left: parent.left
//        width: 150
//        height: 70
//        source: "qrc:/images/login_top_logo.png"
//        fillMode: Image.PreserveAspectFit
//    }

}
