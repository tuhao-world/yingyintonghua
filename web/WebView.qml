
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3
import QtWebEngine 1.8
import Qt.labs.platform 1.0
import Qt3D.Render 2.2

import "../common"
import FileObject 1.0


Rectangle{
    anchors.fill: parent


    Row{
        id:contr
        Button{
            text: '后退'
            onClicked: {
                webview.goBack()
            }
        }

        Button{
            text: '前进'
            onClicked: {
                webview.goForward()
            }
        }
        Button{
            text: '刷新'
            onClicked: {
                webview.reload()
            }
        }
        Button{
            text: '打开控制台'
            onClicked: {
                webview.devToolsView.visible = !webview.devToolsView.visible
                mr.visible = !mr.visible
            }
        }



        Image{
          source: fileObject.source
          width: 100
          height: 50
        }



        FileObject{
            id:fileObject
        }
        FileDialog{
            id:fileDialog
            onAccepted: {
                fileObject.source = fileDialog.file
                tvPath.visible = true
                tvPath.text = fileObject.source
            }
        }

        Button{
            id:btSelect
            text: '选择文件'
            onClicked: {
                fileDialog.open()
            }
        }


        Text{
            id:tvPath
            visible: false
            text: "文件路径"+fileObject.source
        }
    }

    WebEngineView {
        id:webview
        anchors.top: contr.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        url: "https://www.baidu.com/"
        settings.pluginsEnabled: true
        devToolsView: devToolsView
        onNewViewRequested: {
            console.log("加载新地址"+request.requestedUrl)
            url = request.requestedUrl
        }
        onNavigationRequested: {
            console.log("onNavigationRequested加载新地址"+request.url)
            url = request.requestedUrl
        }
    }


    Rectangle{

        id:mr
        visible: false
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.height
        width: 300

        WebEngineView {
            id: devToolsView
            visible: false
            //inspectedView: 0
            anchors.fill: parent
            onNewViewRequested: function(request) {
                var tab = webview.profile
                // tabs.currentIndex = tabs.count - 1;
                request.openIn(webview);
            }
        }

        ResizableRectangle{
            resizeTarget: mr
        }

    }

}

