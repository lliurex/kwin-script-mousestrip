/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 Juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import org.kde.kirigami 2.12 as Kirigami
import org.kde.kwin 3.0 as KWinComponents

Item {
    id: root

    Loader {
        id: mainItemLoader
    }
    Loader {
        id: mainItemLoaderTop
    }
    Loader {
        id: mainItemLoaderBottom
    }

    property color bkgColor: "black"
    property double stripOpacity: 15
    property color rColor: "black"
    property int stripHeight: 2
    property color borderColor: "yellow" 
    property double borderOpacity: 30
    property color rBorderColor: "yellow"
    property int borderHeight: 14
    property bool fillBorder: false
	property bool outputOnly:true
    property bool show: true

    function reloadStrip(show=true){
        mainItemLoader.sourceComponent=undefined;
        mainItemLoaderTop.sourceComponent=undefined;
        mainItemLoaderBottom.sourceComponent=undefined;
        mainItemLoader.source="";
        mainItemLoaderTop.source="";
        mainItemLoaderBottom.source="";
		if (show==true)
        	moveStrip();
        root.show=show;
    }
    
    function readConfig(){
        bkgColor= KWin.readConfig("BackgroundColor",Qt.rgba(0,0,1,1));
        stripOpacity= KWin.readConfig("StripOpacity",20)/100;
        rColor=Qt.rgba(bkgColor.r,bkgColor.g,bkgColor.b,1.0);
        stripHeight= KWin.readConfig("StripHeight",3);
	    borderOpacity= KWin.readConfig("BorderOpacity",20)/100;
		if (borderOpacity>=1) borderOpacity=0.99;
        borderColor= KWin.readConfig("BorderColor",Qt.rgba(0,0,1,borderOpacity));
		/* If set to 100 graphics get corrupted */
        rBorderColor=Qt.rgba(borderColor.r,borderColor.g,borderColor.b,borderOpacity);
        borderHeight= KWin.readConfig("BorderHeight",2);
        fillBorder= KWin.readConfig("FillBorder",false);
    }

    function updateConfig(){
		console.log("**** UPDATE ****")
    }

    function applyConfig(){
       var ReadStrip;
       var BorderStripTop;
       var BorderStripBottom;
       readConfig();
       mainItemLoaderTop.source = "border.qml";
       BorderStripTop=mainItemLoaderTop.item;
       BorderStripTop.height=borderHeight;
       BorderStripTop.color=rBorderColor;
       BorderStripTop.opacity=borderOpacity;
       BorderStripTop.y=0;
       BorderStripTop.width= KWinComponents.Workspace.workspaceWidth;
       mainItemLoaderBottom.source = "borderB.qml";
       BorderStripBottom=mainItemLoaderBottom.item;
       BorderStripBottom.height=borderHeight;
       BorderStripBottom.color=rBorderColor;
       BorderStripBottom.opacity=borderOpacity;
	   console.log("Color: "+rBorderColor);
       BorderStripBottom.width= KWinComponents.Workspace.workspaceWidth;
       mainItemLoader.source = "stripe.qml";
       ReadStrip=mainItemLoader.item;
       ReadStrip.color=rColor;
	   ReadStrip.opacity=stripOpacity;
       ReadStrip.height=Kirigami.Units.gridUnit*2*root.stripHeight;
       ReadStrip.width= KWinComponents.Workspace.workspaceWidth;
    }

    function moveStrip(){
       var ReadStrip;
       var BorderStripTop;
       var BorderStripBottom;
       if (!mainItemLoader.item) {
           applyConfig();
       }
       ReadStrip=mainItemLoader.item;
       BorderStripTop=mainItemLoaderTop.item;
       BorderStripBottom=mainItemLoaderBottom.item;
       ReadStrip.y=KWinComponents.Workspace.cursorPos.y-(ReadStrip.height*0.5);
       BorderStripBottom.y=ReadStrip.height+ReadStrip.y;
       if (fillBorder==true)
       {
           BorderStripTop.height=ReadStrip.y;
           BorderStripBottom.height=KWinComponents.Workspace.workspaceHeight-BorderStripBottom.y;
       } else {
           BorderStripTop.y=ReadStrip.y-borderHeight;
           BorderStripBottom.y=ReadStrip.height+ReadStrip.y;
       }
    }


    Connections {
        target: KWinComponents.Options
        function onConfigChanged() { updateConfig(); }
    }

    Connections {
        target: KWinComponents.Workspace
        function onCursorPosChanged() {
            if (show==true){
                moveStrip();
            }
        }
    }

    KWinComponents.DBusCall {
        id: kwinReconfigure
        service: "org.kde.KWin"; path: "/KWin"; method: "reconfigure";
    }

	KWinComponents.ShortcutHandler {
		name: "Toggle MouseStrip"
		text: "Shows or hides the read strip"
		sequence: 'Meta+Ctrl+M'
		onActivated: reloadStrip(!show)
	}

    Component.onCompleted: {
        reloadStrip(true);
    }
}
