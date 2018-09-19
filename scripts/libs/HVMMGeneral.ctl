#uses "scripts/libs/fwTrending/fwTrending.ctl"
global dyn_string channelsToPlot;
global string myModuleNameMain;
global string myPanelNameMain;

const float PREFERRED_PLOT_ASPECT_RATIO = 2.21;
const float SIZE_OF_PLOTTABLE_AREA_X    = 890;
const float SIZE_OF_PLOTTABLE_AREA_Y    = 880;
const int   X_INITIAL_OF_PLOTTABLE_AREA = 325;
const int   Y_INITIAL_OF_PLOTTABLE_AREA = 10;



void currentLayer(int layer){

  
  for(int i=1;i<8;i++)
  {
    if(layer==i)
    {LayerOn(i);}
    else
    {LayerOff(i);}
  }  
}

/**
 * Disables all checkboxes of the panel.
 */

void disableAllCheckboxes() {
    // logoShape1.visible = TRUE;
     dyn_string allCheckboxes = getShapes(myModuleName(), myPanelName(), "shapeType", "CHECK_BOX");

     for( int i = 1; i <= dynlen(allCheckboxes); i++) {
         setValue(myModuleName() + "." + myPanelName() + ":" + allCheckboxes[i], "enabled", false);        
     }
}

/**
 * Enables all checkboxes of the panel.
 */

void enableAllCheckboxes() {
  
    dyn_string allCheckboxes = getShapes(myModuleName(),myPanelName(), "shapeType", "CHECK_BOX");
    
    for( int i = 1; i <= dynlen(allCheckboxes); i++) {
        setValue(myModuleName() + "." + myPanelName() + ":" + allCheckboxes[i], "enabled", true);    
    }
    //logoShape1.visible = FALSE;
}

/**
 * Shows a plot for the specified dpe. Position and size depends on 
 * the channelsToPlot variable that contains all the plots to be plotted.
 * Calls splitScreenGridDimensions to define the grid size, then
 * calls gridToCoordinates to translate grid size to position coordinates and
 * finally calculates the scalling with calculateScales function.
 */

void loadPlots(string node,string dpeOld) {
  
//     if (dpe == "") dpe = $dpe;
    string dpe;
    dpGet("N"+node+".Mapping."+dpeOld+".Channel" ,dpe);
    dpe="CAEN/"+dpe;
    bool isChecked;
    int removeElement;
    getValue("checkBox", "state", 0 ,isChecked);
    if (isChecked == 1)
        dynAppend(channelsToPlot, dpe);
    else {
        dynRemove(channelsToPlot, dynContains(channelsToPlot, dpe));
    }

    int plotsNumber = dynlen(channelsToPlot);
    if ((isChecked == 1) && (plotsNumber > 1)) removePlots(plotsNumber - 1);
    else if ((isChecked == 1) && (plotsNumber = 1)) ;
    else removePlots(plotsNumber + 1);
    
    if (dynlen(channelsToPlot) > 0) {
        dyn_int gridSize = splitScreenGridDimensions(plotsNumber, SIZE_OF_PLOTTABLE_AREA_X, SIZE_OF_PLOTTABLE_AREA_Y);
        dyn_dyn_int initCoo = gridToCoordinates(plotsNumber, gridSize);
        dyn_dyn_float scaling = calculateScales(plotsNumber, gridSize);

        dyn_string exceptionInfo;
        for (int i = 1; i <= plotsNumber; i++) {
            fwTrending_addQuickFaceplate(myModuleNameMain,myPanelNameMain, "Plot" + i, 
                                      makeDynString(channelsToPlot[i] + ".actual.vMon", channelsToPlot[i] + ".actual.iMon"),
                                      initCoo[i][1], initCoo[i][2], exceptionInfo, "_FwTrendingQuickPlotDefaults", scaling[i][1], scaling[i][2],dpeOld);
        }
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
