﻿import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import "./component"

FluScrollablePage{

    title:"StatusView"
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        id:layout_actions
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 50
        paddings: 10
        RowLayout{
            spacing: 14
            FluDropDownButton{
                id:btn_status_mode
                Layout.preferredWidth: 140
                text:"Loading"
                items:[
                    FluMenuItem{
                        text:"Loading"
                        onClicked: {
                            btn_status_mode.text = text
                            status_view.statusMode = FluStatusView.Loading
                        }
                    },
                    FluMenuItem{
                        text:"Empty"
                        onClicked: {
                            btn_status_mode.text = text
                            status_view.statusMode = FluStatusView.Empty
                        }
                    },
                    FluMenuItem{
                        text:"Error"
                        onClicked: {
                            btn_status_mode.text = text
                            status_view.statusMode = FluStatusView.Error
                        }
                    },
                    FluMenuItem{
                        text:"Success"
                        onClicked: {
                            btn_status_mode.text = text
                            status_view.statusMode = FluStatusView.Success
                        }
                    }
                ]
            }
        }
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 10
        height: 380
        paddings: 10
        FluStatusView{
            id:status_view
            anchors.fill: parent
            onErrorClicked:{
                showError("点击重新加载")
            }
            Rectangle {
                anchors.fill: parent
                color:FluTheme.primaryColor.dark
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluStatusView{
    anchors.fill: parent
    statusMode: FluStatusView.Loading
    Rectangle{
        anchors.fill: parent
        color:FluTheme.primaryColor.dark
    }
}'
    }

}
