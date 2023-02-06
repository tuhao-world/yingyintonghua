import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3 //2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Dialogs 1.2
import QtWebEngine 1.8

//账号管理页面
//需求
//1）：用户列表、添加账号、网页标签页均为QML，其余为web
//2）：web需要处理session隔离

Row{

    //父级页面，用于当前页面出栈
    property StackView rootView


    states:[

        State{
            name:""
        }
    ]

    //用户列表
    Rectangle{
        width: 200
        height: parent.height

        color: "red"
        Button{

            anchors.bottom: parent.bottom


            width: parent.width

            text: "返回主页面"
            onClicked: {
                rootView.pop()
            }
        }

    }


    Rectangle{
        color: "green"
        height: parent.height
        width: parent.width-200
        Column{

            //web选项卡
            TabBar{
                id:tabbar
               Repeater{
                    model: 5
                    TabButton{
                        text: "测试"
                    }
               }
            }

            //web内容
            StackLayout{
                currentIndex: tabbar.currentIndex
                children: [


                ]
            }

        }
    }
}
