import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

///自定义内嵌消息对话框
Item {
    id:root
    anchors.centerIn: parent

    //提示框内容
    property alias tipText: msg.text
    //提示框颜色
    property string backGroundColor: "white"
    property Item parentItem : Rectangle {}

    //true为模态对话框,否则为静态对话框
    //区别：前者不可点击窗口外取消
    property bool isDynamic: false

    signal confirm()

    //Dialog header、contentItem、footer之间的间隔默认是12
    // 提示框的最小宽度是 100
    width: {
        if(msg.implicitWidth < 300 || msg.implicitWidth == 300)
            return 300;
        else
            return msg.implicitWidth > 300 ? 300 + 24 : (msg.implicitWidth + 24);
    }
    height: 150



    Dialog{
        id: dialog
        width: root.width
        height: root.height
        //背景蒙版
        modal: false
        closePolicy: isDynamic?Popup.NoAutoClose:Popup.CloseOnPressOutside
        background: Rectangle {
            color: backGroundColor
            anchors.fill: parent
            radius: 5
        }
        header: Rectangle{
            id:head
            x:10
            y:10

            Row{
                height: 30
                Image {
                    id:logo
                    width: 20
                    height: 20
                    source: "qrc:/images/app_logo.png"
                }
                Rectangle{
                    height: 20
                    width:tips.implicitWidth+10
                    Text {
                        anchors.centerIn: parent
                        id: tips
                        text: "提示"
                        font.pixelSize: 16

                    }
                }

            }
        }
        contentItem: Rectangle {
            border.color: backGroundColor
            color: backGroundColor

            Text {
                anchors.fill: parent
                anchors.centerIn: parent
                anchors.bottomMargin: 20
                font.family: "Microsoft Yahei"
                color: "#333333"
                text: tipText
                font.pixelSize: 15
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Row{

                id:footer
                anchors.bottom: parent.bottom
                anchors.right: parent.right

                spacing: 20
                Button{
                    id: btn_cancel
                    visible: true
                    text: "取消"
                    contentItem: Text {
                        text: "取消"
                        color: "#333333"
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle{
                        implicitWidth: 65
                        implicitHeight: 32
                        color: "white"
                        border.color: "#D9D9D9"
                        border.width: 1
                        radius: 5
                    }
                    onClicked: {
                        dialog.close()
                    }
                }


                Button{
                    id: btn_ok
                    text: "确认"
                    visible: control.buttonFlags&MessageWindow.OkButton
                    //默认焦点为确认
                    focus: true
                    contentItem: Text {
                        text: "确定"
                        color: "white"
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle{
                        implicitWidth: 65
                        implicitHeight: 32
                        color: "#3468fe"
                        radius: 5
                    }
                    onClicked: {
                        root.confirm()
                        dialog.close()
                    }
                }
            }
        }
        padding:10
    }


    Text{
        id:msg
        visible: false
        wrapMode: Text.wrapMode
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    function open(){
        root.x = (parent.width-dialog.width) /2
        root.y = (parent.height-dialog.height) /2
        dialog.open();
    }
}
