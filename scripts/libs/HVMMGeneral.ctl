#uses "scripts/libs/fwTrending/fwTrending.ctl"


//  global dyn_string channelsToPlot;

// global string myModuleNameMain;
// global string myPanelNameMain;

const float PREFERRED_PLOT_ASPECT_RATIO = 2.21;
const float SIZE_OF_PLOTTABLE_AREA_X    = 915;
const float SIZE_OF_PLOTTABLE_AREA_Y    = 880;
const int   X_INITIAL_OF_PLOTTABLE_AREA = 295;
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
    
    bool isChecked;
    int removeElement;
    getValue("checkBox", "state", 0 ,isChecked);
        
    dyn_string DpesToPlot;
    dpGet("N"+node+".DpesToPlot",DpesToPlot);    
    
    if (isChecked == 1){
      dynAppend(DpesToPlot,"N"+node+".Mapping."+dpeOld);     
    }
    else{
      dynRemove(DpesToPlot, dynContains(DpesToPlot,"N"+node+".Mapping."+dpeOld));
    }

    dpSet("N"+node+".DpesToPlot",DpesToPlot);
        
    int plotsNumber = dynlen(DpesToPlot);
    string channel,alias,nodeSubs;
    if ((isChecked == 1) && (plotsNumber > 1)) removePlots(plotsNumber - 1,node);
    else if ((isChecked == 1) && (plotsNumber = 1)) ;
    else removePlots(plotsNumber + 1,node);
    
        if (dynlen(DpesToPlot) > 0) {
        dyn_int gridSize = splitScreenGridDimensions(plotsNumber, SIZE_OF_PLOTTABLE_AREA_X, SIZE_OF_PLOTTABLE_AREA_Y);
        dyn_dyn_int initCoo = gridToCoordinates(plotsNumber, gridSize);
        dyn_dyn_float scaling = calculateScales(plotsNumber, gridSize);

        dyn_string exceptionInfo;          
        for (int i = 1; i <= plotsNumber; i++) {
          dpGet(DpesToPlot[i]+".Channel",channel);
          dpGet(DpesToPlot[i]+".Alias",alias);
          nodeSubs=substr(DpesToPlot[i],0,2);
            fwTrending_addQuickFaceplate("embModuleN"+node,"N"+node, "Plot" + i, 
                                      makeDynString("CAEN/"+channel+ ".actual.vMon", "CAEN/"+channel + ".actual.iMon"),
                                      initCoo[i][1], initCoo[i][2], exceptionInfo, "_FwTrendingQuickPlotDefaults", scaling[i][1], scaling[i][2],alias,nodeSubs);
              }                                 
        }      
}

void loadPlotsCosmics(string node,string dpeOld,string sector) {
       
    bool isChecked;
    int removeElement;
    getValue("checkBox", "state", 0 ,isChecked);
    
    int nodeToStartSearch;    
    if(sector=="1")
      nodeToStartSearch=1;
    if(sector=="2")
      nodeToStartSearch=5; 
    

    dyn_string DpesToPlot,DpesToPlotTotal;
    dpGet("N"+node+".DpesToPlot",DpesToPlot);    
    
    if (isChecked == 1){
      dynAppend(DpesToPlot,"N"+node+".Mapping."+dpeOld);     
    }
    else{
      dynRemove(DpesToPlot, dynContains(DpesToPlot,"N"+node+".Mapping."+dpeOld));
    }

    dpSet("N"+node+".DpesToPlot",DpesToPlot);

    
    for(int i=nodeToStartSearch;i<=nodeToStartSearch+3;i++)
    {
    dynClear(DpesToPlot);
    dpGet("N"+i+".DpesToPlot",DpesToPlot);
    dynAppend(DpesToPlotTotal,DpesToPlot);    
      
    }

        
    int plotsNumber = dynlen(DpesToPlotTotal);
    string channel,alias,nodeSubs;
    if ((isChecked == 1) && (plotsNumber > 1)) removePlotsCosmics(plotsNumber - 1,node,sector);
    else if ((isChecked == 1) && (plotsNumber = 1)) ;
    else removePlotsCosmics(plotsNumber + 1,node,sector);
    
        if (dynlen(DpesToPlotTotal) > 0) {
        dyn_int gridSize = splitScreenGridDimensions(plotsNumber, SIZE_OF_PLOTTABLE_AREA_X, SIZE_OF_PLOTTABLE_AREA_Y);
        dyn_dyn_int initCoo = gridToCoordinates(plotsNumber, gridSize);
        dyn_dyn_float scaling = calculateScales(plotsNumber, gridSize);

        dyn_string exceptionInfo;          
        for (int i = 1; i <= plotsNumber; i++) {
          dpGet(DpesToPlotTotal[i]+".Channel",channel);
          dpGet(DpesToPlotTotal[i]+".Alias",alias);
          nodeSubs=substr(DpesToPlotTotal[i],0,2);
            fwTrending_addQuickFaceplate("embModuleN"+sector,"N"+sector, "Plot" + i, 
                                      makeDynString("CAEN/"+channel+ ".actual.vMon", "CAEN/"+channel + ".actual.iMon"),
                                      initCoo[i][1], initCoo[i][2], exceptionInfo, "_FwTrendingQuickPlotDefaults", scaling[i][1], scaling[i][2],alias,nodeSubs);
        }          
          
          
      
        }
}
/**
 * Receives the numbers of plots to plot and the size of
 * the grid available and returns the scale of each plot.
 */ 

dyn_dyn_float calculateScales(int nPlots, dyn_int grid) {
  
    dyn_dyn_float scales; 
    float scx, scy;
    
    scx = (SIZE_OF_PLOTTABLE_AREA_X / grid[2]) / 517;
    scy = (SIZE_OF_PLOTTABLE_AREA_Y / grid[1]) / 277;
    
    for (int i = 1; i <= nPlots; i++) {
        dynAppend(scales, makeDynFloat(scx, scy));
    } 
    return scales;
}


/**
 * Removes the first Nplots or if 0 is passsed it removes all the plots.
 */

void removePlots(int Nplots,string node) {
  
  dyn_string DpesToPlot;
  dpGet("N"+node+".DpesToPlot",DpesToPlot);
  
  if (Nplots == 0) Nplots = dynlen(DpesToPlot);
    dyn_string exceptionInfo;
    
    for (int i = 1; i <= Nplots; i++) {
        fwTrending_removeFaceplate("embModuleN"+node ,"N"+node, "Plot" + i, exceptionInfo);
    }
}


void removePlotsCosmics(int Nplots,string node,string sector) {
  
      int nodeToStartSearch;    
    if(sector=="1")
      nodeToStartSearch=1;
    if(sector=="2")
      nodeToStartSearch=5;
    
    
    dyn_string DpesToPlot,DpesToPlotTotal;    
    for(int i=nodeToStartSearch;i<=nodeToStartSearch+3;i++)
    {
    dynClear(DpesToPlot);
    dpGet("N"+node+".DpesToPlot",DpesToPlot);
    dynAppend(DpesToPlotTotal,DpesToPlot);    
      
    }
  
   if (Nplots == 0) Nplots = dynlen(DpesToPlotTotal);
    dyn_string exceptionInfo;
    
    for (int i = 1; i <= Nplots; i++) {
        fwTrending_removeFaceplate("embModuleN"+sector ,"N"+sector, "Plot" + i, exceptionInfo);
    }
}

void loadChannels(string node, string type,string sector)
{
  
    string chamberName=type;
    dyn_string chamberMappingStrips,chamberMappingDrift; 
    int channelsNo = 0;
    int x = 5;//5
    int channelHeight = 18;
    int titleHeight = 28;
    int y=5;
    
//     y[1] = 25; // Offset for first chamber
  
     dpGet("N"+node+".Mapping.ChannelsTotal.Strips",chamberMappingStrips);
     dpGet("N"+node+".Mapping.ChannelsTotal.Drift",chamberMappingDrift);
  
//      y[2] = y[1] +  channelHeight * channelsNo + titleHeight;
     
     addSymbol(myModuleName() ,myPanelName(),"objects/chamber.pnl", "chamber.pnl.Ref." + chamberName,
                  makeDynString("$node:"+node,"$chamberName:" + chamberName,"$sector:"+sector, "$x:" + x, "$y:" + y), 0, 0, 0, 1, 1);
  
}  

void loadChannelsCosmics(string sector)
{
  
  int startNodeSearch;
  if(sector=="1")
      startNodeSearch=1;
  if(sector=="2")
      startNodeSearch=5;  
    
  
    dyn_string chamberName;
    dyn_string chamberMappingStrips,chamberMappingDrift;
    int channelsNo = 0;
    int x = 5;//5
    int channelHeight = 18;
    int titleHeight = 28;
    dyn_int y;
    string side;
    
    y[1] = 5; // Offset for first chamber
    
    // calculates the y coordinate to place every chamber
    for(int i=startNodeSearch;i<=(startNodeSearch+3);i++){
      if(i==1 || i==2 || i==5 || i==6 )
       {side="IP";}
      else
      {
       side="HO";
      } 
        dpGet("N"+i+".ChamberType",chamberName[i-startNodeSearch+1]);
        chamberName[i-startNodeSearch+1]=chamberName[i-startNodeSearch+1]+"-"+side;
        dpGet("N"+i+".Mapping.ChannelsTotal.Strips",chamberMappingStrips);
        dpGet("N"+i+".Mapping.ChannelsTotal.Drift",chamberMappingDrift);
        
        channelsNo = dynlen(chamberMappingStrips)+dynlen(chamberMappingDrift);
        y[i-startNodeSearch+2] = y[i-startNodeSearch+1] +  channelHeight * channelsNo + titleHeight;
    }


  
    for(int i=startNodeSearch;i<=(startNodeSearch+3);i++){
        addSymbol(myModuleName() ,myPanelName(),"objects/chamber.pnl", "chamber.pnl.Ref." + chamberName[i-startNodeSearch+1],
                  makeDynString("$node:"+i,"$chamberName:" + chamberName[i-startNodeSearch+1], "$x:" + x, "$y:" + y[i-startNodeSearch+1],"$sector:"+sector), 0, 0, 0, 1, 1);
    }

  
  
  
  
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
  
//   dyn_string mainframe1527=dpNames("*", "FwCaenCrateSY1527");
//   dyn_string psChannels=dpNames(mainframe1527[1]+"/board*/channel*");
    dyn_string psChannels=dpNames("CAEN/*/board*/channel*");
    
  float temp1, temp2;
  for (int i = 1; i <= dynlen(psChannels); i++) {
      dpGet(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpGet(psChannels[i] + ".actual.iMon:_original.._value", temp2);
      dpSetWait(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpSetWait(psChannels[i] + ".actual.iMon:_original.._value", temp2);
  }
}

dyn_int splitScreenGridDimensions(int numberOfPlots, float sizeX, float sizeY) {
    
    dyn_dyn_int arraySizeCandidates = makeDynInt(); 
    float i = 1;
    float rowsPerArrays = numberOfPlots;
    float fac;
    dyn_float factors;
    
    while (i <= rowsPerArrays) {
        dynAppend(arraySizeCandidates, makeDynInt(i, rowsPerArrays));
        if (i != rowsPerArrays) dynAppend(arraySizeCandidates, makeDynInt(rowsPerArrays, i));
        i++;
        rowsPerArrays = ceil(numberOfPlots/i);
    }
    
    for ( int i = 1; i <= dynlen(arraySizeCandidates); i++) {
          fac = (arraySizeCandidates[i][1] * sizeX) / (arraySizeCandidates[i][2] * sizeY);
          dynAppend(factors, fabs(fac - PREFERRED_PLOT_ASPECT_RATIO));
    }
    
    int pos = dynContains(factors, dynMin(factors));
    dyn_int optimalSize = arraySizeCandidates[pos];
    
    return optimalSize;
}
/**
 *  Gets the number of plots and the grid size in an area
 *  and returns the coordinates of where the objects should
 *  be deployed.
 */

dyn_dyn_int gridToCoordinates(int Nplots, dyn_int grid) {
  
    dyn_dyn_int initialPositions;
    float x, y;

    for (int i = 1; i <= grid[1]; i++) {
        for (int j = 1; j <= grid[2]; j++) {
            x = X_INITIAL_OF_PLOTTABLE_AREA + (j-1) * SIZE_OF_PLOTTABLE_AREA_X / grid[2];
            y = Y_INITIAL_OF_PLOTTABLE_AREA + (i-1) * SIZE_OF_PLOTTABLE_AREA_Y / grid[1];
            
            dynAppend(initialPositions, makeDynInt(floor(x), floor(y)));
        }
    }
    
    return initialPositions;  
}
