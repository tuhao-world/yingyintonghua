import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3 //2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Dialogs 1.2
import QtWebEngine 1.8
import "user"
import "common"
import "web"


//install_name_tool -change "QtWebEngine.framework/Versions/5/QtWebEngine" "@rpath/Frameworks/QtWebEngine.framework/Versions/5/QtWebEngine" /Users/hh/Documents/qtProject/yingyintonghua/build-mac-Release/quick02.app/Contents/MacOS/quick02
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


    //分发场景下，父级页面需要一直存在内存中
    //因此使用栈的方式管理路由
    StackView{
        id:rootStack
        anchors.fill: parent
        initialItem: mainView
    }

    //主页面
    Rectangle{

        id:mainView
        anchors.fill: parent

        property int currentIndex: 0

        Column{

            padding: 10
            width: 200
            height: parent.height
            id:menuView
            spacing: 10
            Repeater{
                model: 5
                Button{
                    id:menuItem
                    width: parent.width-20
                    height: 30
                    onClicked: {
                        webview.url = "https://www.xiaohongshu.com"

                        var index = menuItem.Positioner.index
                        console.log("当前下标"+index)
                        if(index === 2){
                            rootStack.push(accountWebComponent)
                        }else{
                            mainView.currentIndex = menuItem.Positioner.index
                        }
                    }
                    background: Rectangle{
                        color: mainView.currentIndex === menuItem.Positioner.index?"#3468fe":"#4cCCCCCC"

                        radius: 5
                        Text {
                            id: name
                            anchors.centerIn: parent
                            text: "菜单"+menuItem.Positioner.index
                            color: mainView.currentIndex === menuItem.Positioner.index?"White":"Black"
                        }
                    }

                }
            }

        }

        Column{
            anchors.left: menuView.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            ProgressBar{
                id:pro
                visible: webview.loadProgress != 100
                    from: 0.0  //起始值
                    to: 100  //终点值
                    value: webview.loadProgress
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 5
            }

            WebEngineView {
                id:webview

                anchors.top: pro.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right


                url: "https://www.baidu.com/"

                settings.pluginsEnabled: true

                //devToolsView: devToolsView

                //WebEngineNavigationRequest.navigationType: 1

                //点击其他链接
                onNewViewRequested: {
                    console.log("打开方式:"+request.destination)
                    //request.openIn(webview)
                    url = request.requestedUrl
                }
                onNavigationRequested: {


                    console.log("onNavigationRequested加载新地址"+request.navigationType)
                    //url = request.requestedUrl
                    //request.openIn(webview)
                }

            }
        }

    }


    //账号管理
    Component{
        id:accountWebComponent

        AccountManager{
            rootView: rootStack
        }

//  另外写一个用于web调试的页面。学习、测试用
//        WebView{
//            rootView: rootStack
//        }
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
