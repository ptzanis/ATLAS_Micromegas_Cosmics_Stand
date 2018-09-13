
void currentLayer(int layer){

  
  for(int i=1;i<8;i++)
  {
    if(layer==i)
    {LayerOn(i);}
    else
    {LayerOff(i);}
  }  
}

void refreshConfigurationTable() {
    
  channelsTable.tableMode(TABLE_SELECT_NOTHING);
   // channelsTable.font("Lucida Grande"); 

    dyn_string dpes;
    float tempi0, tempv0, temprUp, temprDwn, temptripTime, VMax;
    string alias;
    bool isOn;
    
  //  dyn_string mainframe1527=dpNames("*", "FwCaenCrateSY1527");
    dyn_string allChannels=dpNames("CAEN/*/board*/channel*");
    
    for (int i = 1; i <= dynlen(allChannels); i++){
        dpGet(allChannels[i] + ".readBackSettings.i0:_original.._value", tempi0);
        dpGet(allChannels[i] + ".readBackSettings.v0:_original.._value", tempv0);
        dpGet(allChannels[i] + ".readBackSettings.rUp:_original.._value", temprUp);
        dpGet(allChannels[i] + ".readBackSettings.rDwn:_original.._value", temprDwn);
        dpGet(allChannels[i] + ".readBackSettings.tripTime:_original.._value", temptripTime);
        alias = dpGetAlias(allChannels[i] + ".");
        dpGet(allChannels[i] + ".readBackSettings.vMaxSoftValue:_original.._value", VMax);
        channelsTable.appendLine("Alias", alias, "Channels", substr(allChannels[i], strlen(getSystemName()) + 5),
                                 "v0", tempv0, "i0", tempi0, "rUp", temprUp,
                                 "rDwn", temprDwn, "trip", temptripTime, "VMax", VMax);
        dpGet(allChannels[i] + ".actual.isOn:_original.._value", isOn);
        if (isOn) {
            channelsTable.cellBackColRC(i-1, "Alias", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "Channels", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "v0", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "i0", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "rUp", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "rDwn", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "trip", "FwStateOKPhysics");
            channelsTable.cellBackColRC(i-1, "VMax", "FwStateOKPhysics");
        }
    }
    
    setInputFocus (myModuleName(), myPanelName(), "channelsTable"); 
    channelsTable.tableMode(TABLE_SELECT_MULTIPLE);
    channelsTable.selectByClick(TABLE_SELECT_LINE);
    
}



int searchDPTexistance(string search){
  
  dyn_string test=dpTypes(search);
  
  if (test == "") {
    DebugN("DPT doesn't exist!");
    return -1;
  } else {
    DebugN("DPT has been found!");
    return 0;
  }    
}



touchChannels() {
  
  dyn_string mainframe1527=dpNames("*", "FwCaenCrateSY1527");
  dyn_string psChannels=dpNames(mainframe1527[1]+"/board*/channel*");

  float temp1, temp2;
  for (int i = 1; i <= dynlen(psChannels); i++) {
      dpGet(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpGet(psChannels[i] + ".actual.iMon:_original.._value", temp2);
      dpSetWait(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpSetWait(psChannels[i] + ".actual.iMon:_original.._value", temp2);
  }
}
