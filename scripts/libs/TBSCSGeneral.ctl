/* *************************************************************************************** *
 *    Developer: Paris Moschovakos                                                         *
 *    e-mail: paris.moschovakos@cern.ch                                                    *
 *    Date: 13/3/2015                                                                      *
 *                                                                                         *
 *    Description: This library provides all the functions used in TBSCS project.          *
 * *************************************************************************************** */

global dyn_string channelsToPlot;
global string myModuleNameMain;
global string myPanelNameMain;

const float PREFERRED_PLOT_ASPECT_RATIO = 2.21;
const float SIZE_OF_PLOTTABLE_AREA_X    = 890;
const float SIZE_OF_PLOTTABLE_AREA_Y    = 880;
const int   X_INITIAL_OF_PLOTTABLE_AREA = 350;
const int   Y_INITIAL_OF_PLOTTABLE_AREA = 51;

/**
 * Notifies through email the recipient
 */

string alertViaEmail(string recipient, string sender, string subject, string mainBody) {
 
    dyn_string emailContent;
    int ret; 
    string status; 
    string smtpServer = "cernmx.cern.ch";
    string hostName = getHostname(); 
    
    emailContent[1] = recipient;
    emailContent[2] = sender;
    emailContent[3] = subject;
    emailContent[4] = mainBody;
  
    emSendMail(smtpServer, hostName, emailContent, ret);
    if (ret == 0)  status = "Message sent";
    else status = "Message sent failed";
    return status;
}

string alertViaSMS(string number, string sender, string subject, string mainBody) {
//provide the receiver  (receiver) cell phone number with the digits of the country infront (e.g. 0041..)
//provide your (sender) email address
//provide the title of your sms (it will go in parenthesis in the begining of the sms)
//provide the text of your mail (no more than 160 characters)
    
    string receiver = number + "@mail2sms.cern.ch";
                 
    dyn_string emailContent;
    int ret; 
    string status; 
    string smtp = "cernmx.cern.ch";
    string hostName = getHostname();   
    emailContent[1] = receiver;
    emailContent[2] = sender;
    emailContent[3] = subject;
    emailContent[4] = mainBody;
  
    emSendMail(smtp, hostName, emailContent, ret);
    if (ret == 0)  status = "Message sent";
    else status = "Message sent failed";
    return status;
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
 * Checks the datapoint type existance of TbscsChamber dpt.
 * Returns 0 if it exists else -1.
 */ 

int checkDPTexistance() {
  
  dyn_string test = dpTypes("TbscsChamber");
  
  if (test == "") {
    DebugN("DPT doesn't exist!");
    return -1;
  } else {
    DebugN("DPT has been found!");
    return 0;
  }
}

/** 
 * Checks the existance of the destination directory
 * during export. If the folder doesn't exist, it creates it.
 */ 

bool checkOrCreateDirectory(string folderPath)
{
  
    if(isdir(folderPath))
    return TRUE;
    else {    
        mkdir(folderPath, 777);
        return FALSE;
    } 
}

/**
 * Clears the chamber column on the main panel
 */ 

void clearScreen() {
    
    dyn_string allChambers = dpNames("*", "TbscsChamber");
    
    removeChamberObjects(allChambers);
}

/**
 * Loads the data and creates the format of the plots.
 */ 

void createPlotFormatBatch (string plotFormatPath, dyn_string channelDatPath) {
    
    string folderPath = destFolderTextField.text;
    if(!isdir(folderPath + "plots/")) 
        mkdir(folderPath + "plots/", 777);   
    
    string pngName = channelDatPath[1] + ".eps";
    strreplace(pngName, " ", "_");
    string startTime, endTime;
    startTime = getStartTime();
    endTime = getEndTime();
    
    file plotFormatGNU;
    // DebugN("Creating the plot format batch file...");
    
    plotFormatGNU = fopen(plotFormatPath, "w");
    
    fprintf(plotFormatGNU, "%s \n", "#Script automatically created by TBSCS");
    fprintf(plotFormatGNU, "%s \n", "#for internal use. P");
    
    fprintf(plotFormatGNU, "%s \n", "set terminal postscript eps enhanced color font 'Helvetica,10'");
//    fprintf(plotFormatGNU, "%s \n", "set terminal png size 1200,900");

    fprintf(plotFormatGNU, "%s \n", "set xdata time");
    fprintf(plotFormatGNU, "%s \n", "set grid");
    fprintf(plotFormatGNU, "%s \n", "set timefmt '%m/%d/%Y_%H:%M:%S'");
    fprintf(plotFormatGNU, "%s \n", "set output '" + folderPath + "plots/" + pngName + "'");   
    fprintf(plotFormatGNU, "%s \n", "#set xrange ['" + startTime + "':'" + endTime + "']"); // set Time or comment for full range
    fprintf(plotFormatGNU, "%s \n", "set yrange [0:650]");
    fprintf(plotFormatGNU, "%s \n", "set y2range [0:5]");        
    fprintf(plotFormatGNU, "%s \n", "set y2tics 0, .5");
    fprintf(plotFormatGNU, "%s \n", "set ytics 50 nomirror");
    fprintf(plotFormatGNU, "%s \n", "set xlabel 'Time' offset 0,-2");    
    fprintf(plotFormatGNU, "%s \n", "set ylabel 'Voltage (V)'");     
    fprintf(plotFormatGNU, "%s \n", "set y2label 'Current (uA)'");  
//    fprintf(plotFormatGNU, "%s \n", "set autoscale y");  
//    fprintf(plotFormatGNU, "%s \n", "set autoscale y2");
    fprintf(plotFormatGNU, "%s \n", "set ytic auto");
    fprintf(plotFormatGNU, "%s \n", "set y2tic auto");
    
    fprintf(plotFormatGNU, "%s \n", "set key inside left top");

    fprintf(plotFormatGNU, "%s\n", "plot \"" + channelDatPath[2] + "\" using 1:3 title '" + channelDatPath[1] + " Voltage" + "' with steps linewidth 1.5, \\");
    fprintf(plotFormatGNU, "%s\n", "\"" + channelDatPath[3] + "\" using 1:3 title '" + channelDatPath[1] + " Current" + "' with steps linewidth 1.5 axis x1y2 \\"); 
    
    fprintf(plotFormatGNU, "\n\n%s", "set output");
    
    fclose(plotFormatGNU);
}

/**
 * Creates the dpt TbscsChamber.
 */ 

createTbscsChamberDPT() {
  
  dyn_dyn_string elements; dyn_dyn_int types;
  
  elements[1] = makeDynString ("TbscsChamber","");
  
  elements[2] = makeDynString ("","ChamberID");
  elements[3] = makeDynString ("","ChamberName");
  elements[4] = makeDynString ("","Mapping");
  elements[5] = makeDynString ("","Aliases");
  elements[6] = makeDynString ("","Visibility");
  
  types[1] = makeDynInt (DPEL_STRUCT);
            
  types[2] = makeDynInt (0, DPEL_INT);
  types[3] = makeDynInt (0, DPEL_STRING);
  types[4] = makeDynInt (0, DPEL_DYN_STRING);
  types[5] = makeDynInt (0, DPEL_DYN_STRING);
  types[6] = makeDynInt (0, DPEL_BOOL);
  
  int x = dpTypeCreate(elements, types);
  
  if (x == 0){
    DebugN("Datapoint type creation succeeded!");
  }
  else {
    DebugN ("Datapoint type creation returned an error!");
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
 * Creates the batch file that will trigger gnuplot. Receives the target
 * file path, the GNUplot batch script file pathand the gnuplot.exe path
 * and configures the spark batch file accordingly.
 */

int editCreateSpark(string sparkPath, string plotPath, string gnuPath) {
    
    file sparkGNU;
    
    if (isfile(sparkPath)) {
        sparkGNU = fopen(sparkPath, "w");
        fprintf(sparkGNU, "%s \n", "cd " + gnuPath);
        fprintf(sparkGNU, "%s \n", "gnuplot /noend " + plotPath);
        DebugN("Creating the GNU spark batch file...");
    }
    else {
        sparkGNU = fopen(sparkPath, "w");
        fprintf(sparkGNU, "%s \n", "cd " + gnuPath);
        fprintf(sparkGNU, "%s", "gnuplot /noend " + splotFormatPath);
    }
    return fclose(sparkGNU);
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
 * Receives the iMon/vMon, the channels and the starting and ending time
 * and exports any archived data to a file for the specified period of time
 * to the specified by the destination path folder.
 */ 

bool exportCAEN(string valueType, dyn_string channels, string start, string end, string folderPath) {

    dyn_dyn_anytype archived;
    string query, currentDate, filePath;
    
    for (int i = 1; i <= dynlen(channels); i++) {
        query = "SELECT ALL '_original.._stime', '_original.._value' FROM 'CAEN/" + channels[i] +
                ".actual." + valueType + "' TIMERANGE(\"" + start + "\",\"" + end +"\",1,0)";
        
        dpQuery(query, archived);
        
        file export;
        currentDate = formatTime("%d_%m", getCurrentTime());
        strreplace(channels[i], "/", "_");
        filePath = folderPath + valueType + "_" + channels[i] + "_" + currentDate + ".dat";
        strreplace(filePath, "/", "//");
   
        if (isfile(filePath)) {
            popupMessage("_Ui_1", "File Exists");
            popupMessage("_Ui_2", "File Exists");
            popupMessage("_Ui_3", "File Exists");
            popupMessage("_Ui_4", "File Exists");
            popupMessage("_Ui_5", "File Exists");
            return FALSE;
        }
        else {
            export = fopen(filePath, "a");
        }
            
        for (int j = 2; j <= dynlen(archived); j++) { 
            fprintf(export, "%s \n", formatTime("%m/%d/%Y_%H:%M:%S", archived[j][2],"  %04d") + "\t" + archived[j][3]);
        }
        fclose(export);
    }
    
    return TRUE;
}

/**
 * Exports in a temporary folder .dat files for GNUplot use.
 */

bool exportTempData() {
    
    string tempPath = PROJ_PATH + "temp/";
    
    if(isdir(tempPath))
        rmdir(tempPath, 1);   
    
    mkdir(tempPath, 777);

    string start = getStartTime();
    string end = getEndTime();
    
    dyn_string allChannels;  
    allChannels = dpNames("*", "FwCaenChannel");
    
    for (int i = 1; i <= dynlen(allChannels); i++) {
        allChannels[i] = substr(allChannels[i], strpos(allChannels[i], "CAEN") + 5);
    }
    
    DebugN("Exporting temporary data...");
    
    if (!exportCAEN("iMon", allChannels, start, end, tempPath)) 
        return FALSE;
    if (!exportCAEN("vMon", allChannels, start, end, tempPath)) 
        return FALSE;
    
    return TRUE;
}

/**
 * Returns the specified starting time in the appropriate format.
 */

string getEndTime() {
    
    time endTime;
    string endDateString, endTimeString, endString;
 
    string endDateTextBox = "dateSelection.endDateField";
    string endTimeTextBox = "dateSelection.endTimeField";
    
    getValue(endDateTextBox, "text", endDateString);
    getValue(endTimeTextBox, "text", endTimeString);
    
    endString = endDateString + " " + endTimeString;
    
    if (!fwGeneral_hasCorrectFormat(endString)) {
        DebugN("The ending time provided is wrong, check again and retry.");
        return;
    }
    
    endTime = fwGeneral_stringToDate(endString);
    endString = formatTime("%Y.%m.%d %H:%M:%S", endTime);
    
    return endString;
}

/**
 * Returns the specified ending time in the appropriate format.
 */

string getStartTime() {
    
    time startTime;
    string startDateString, startTimeString, startString;
    
    string startDateTextBox = "dateSelection.startDateField";
    string startTimeTextBox = "dateSelection.startTimeField";
    
    getValue(startDateTextBox, "text", startDateString);
    getValue(startTimeTextBox, "text", startTimeString);

    startString = startDateString + " " + startTimeString;    
    
    if (!fwGeneral_hasCorrectFormat(startString)) {
        DebugN("The starting time provided is wrong, check again and retry.");
        return;
    }
    
    startTime = fwGeneral_stringToDate(startString);
    startString = formatTime("%Y.%m.%d %H:%M:%S", startTime);
    
    return startString;
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

/** 
 * Returns TRUE if archiving is configured and on
 * for all the CAEN channels. 
 */ 

bool isArchiving() {
    
    bool isArchiving = TRUE;
    dyn_bool configExists;
    dyn_string archiveClass;
    dyn_int archiveType;
    dyn_int smoothProcedure;
    dyn_float deadband;
    dyn_float timeInterval;
    dyn_bool isActive;
    dyn_string exceptionInfo;
    dyn_string archivedDpesTemp = dpNames("*", "FwCaenChannel");
    dyn_string archivedDpes;
  
    for (int i = 1; i <= dynlen(archivedDpesTemp); i++) {
        archivedDpes[i] = archivedDpesTemp[i] + ".actual.vMon";
        archivedDpes[i + dynlen(archivedDpesTemp)] = archivedDpesTemp[i] + ".actual.iMon";
        archivedDpes[i + 2 * dynlen(archivedDpesTemp)] = archivedDpesTemp[i] + ".readBackSettings.v0";
    }
       
    fwArchive_getMany(archivedDpes, configExists, archiveClass, archiveType, smoothProcedure, deadband, timeInterval, isActive, exceptionInfo);

    for (int i = 1; i <= dynlen(archivedDpes); i++) {
        isArchiving = isArchiving && isActive[i];
    }
    
    if (isArchiving) archiveIndicator.backCol("S7_stateWentUnq"); else archiveIndicator.backCol("red");
    
    return isArchiving;
}

/**
 * Loads the created chambers on the chamber module.
 */

void loadChambers(dyn_string chambers, int yOffset) {
    
    dyn_string chamberName = dpNames("*", "TbscsChamber");
    int redrawFrom = dynContains(chamberName, chambers[1]);
    dyn_string chamberMapping;
    string chName;
    int channelsNo = 0;
    int x = 5;
    int channelHeight = 18;
    int titleHeight = 28;
    int wght;
    bool isMinimized;
    dyn_int y;
    
    y[1] = yOffset; // Offset for first chamber
    
    // calculates the y coordinate to place every chamber
    for (int i = 2; i <= dynlen(chamberName); i++) {
        dpGet(chamberName[i-1] + ".Mapping:_original.._value", chamberMapping);
        channelsNo = dynlen(chamberMapping);
        dpGet(chamberName[i-1] + ".Visibility:_original.._value", isMinimized);
        wght = isMinimized;
        y[i] = y[i-1] + wght * channelHeight * channelsNo + titleHeight;
    }
    
    for (int i = redrawFrom; i <= dynlen(chamberName); i++){
        chName = substr(chamberName[i], strlen(getSystemName()));
        addSymbol(myModuleName() ,myPanelName(),"objects/chamber.pnl", "chamber.pnl.Ref." + chName,
                makeDynString("$chamberName:" + chName, "$x:" + x, "$y:" + y[i]), 0, 0, 0, 1, 1);
    }
}

/**
 * Shows a plot for the specified dpe. Position and size depends on 
 * the channelsToPlot variable that contains all the plots to be plotted.
 * Calls splitScreenGridDimensions to define the grid size, then
 * calls gridToCoordinates to translate grid size to position coordinates and
 * finally calculates the scalling with calculateScales function.
 */

void loadPlots(string dpe) {
  
    if (dpe == "") dpe = $dpe;
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
                                      initCoo[i][1], initCoo[i][2], exceptionInfo, "_FwTrendingQuickPlotDefaults", scaling[i][1], scaling[i][2]);
        }
    }
}

/**
 * Removes all the Bfield monitoring panel contents.
 */

void removeBmonitor() {
    
    dyn_string dpes = dpNames("*","BSensorCalc");
    dyn_string exceptionInfo;
    string dpExt;

     for(int i = 1; i <= dynlen(dpes); i++){
         for(int j = 1; j <= 5; j++){
             if(j == 4){
                 dpExt = ".hAll";
                 fwTrending_removeFaceplate(myModuleNameMain, myPanelNameMain, "BSens" + i, exceptionInfo);
             }
             else if (j == 5) dpExt=".T";
             else dpExt = ".h" + j;
             
             removeSymbol(myModuleNameMain, myPanelNameMain, "value" + dpes[i] + dpExt);
             removeSymbol(myModuleNameMain, myPanelNameMain, dpes[i] + dpExt);
         }
     }
}

/**
 * Removes title objects of the chambers and their channel objects (not used / for testing).
 */

private removeCB() {
  
    dyn_dyn_string chamberMapping, dpes;
    dyn_string chamberName = dpNames("*", "TbscsChamber");
  
    for (int i = 1; i <= dynlen(chamberName); i++){
        dpGet(chamberName[i] +".Mapping:_original.._value", chamberMapping[i]);
    }
  
    if (dynlen(chamberName) == 0) DebugN("---> Empty, no chambers to remove.");
    else { 
        for (int i = 1; i <= dynlen(chamberName); i++){  
            for (int j = 1; j <= dynlen(chamberMapping[i]); j++){ 
                dpes[i][j] = getSystemName() + "CAEN/" + chamberMapping[i][j];
            }
        }
    }
    
    // DebugN("Chamber Name: ", chamberName, "Chamber Mapping: ", chamberMapping, "Dpes: ", dpes);
    for (int i = 1; i <= dynlen(chamberName); i++){
        removeSymbol(myModuleName(), myPanelName(), "titleObject_" + chamberName[i]);
        for (int j = 1; j <= dynlen(chamberMapping[i]); j++){
            removeSymbol(myModuleName(), myPanelName(), "channelObject_" + dpes[i][j]);
        }
    } 
}

/**
 * Removes the chamber objects (channels and titles).
 */

void removeChamberObjects(dyn_string chambers) {
    
    for (int i = 1; i <= dynlen(chambers); i++) {
        removeChannelsForChamber(chambers[i]);
        
        if (patternMatch(getSystemName() + "*", chambers[i]))
            chambers[i] = substr(chambers[i], strlen(getSystemName()));
        
        removeSymbol(myModuleName(), myPanelName(), "chamberTitle_pnl_Ref_" + chambers[i]);   
    }
}

/**
 * Removes the contents of the channel object.
 */

void removeChannelsForChamber(string chamber, bool force = FALSE) {
    
    dyn_string channels, dpes;
    string chamberName = chamber;
    string channelBare;
    bool isVisible;
    
    if (patternMatch(getSystemName() + "*", chamberName))
        chamberName = substr(chamberName, strlen(getSystemName()));
    
    //DebugN("Removing channels for chamber", chamberName);
    
    dpGet(chamberName + ".Mapping", channels);
    dpGet(chamberName + ".Visibility", isVisible);
    
    if (!isVisible && !force) {
      //DebugN("CAME here to avoid deleting channels for:", chamberName);
      return; 
    }
    
    for (int k = 1; k <= dynlen(channels); k++){
        dynAppend(dpes, "CAEN/" + channels[k]);
        removeSymbol(myModuleName(), myPanelName(), "parameter_pnl_Ref_" + chamberName + "_" + dpes[k] + "_Voltage");
        removeSymbol(myModuleName(), myPanelName(), "parameter_pnl_Ref_" + chamberName + "_" + dpes[k] + "_Current");
    }

    if (!chamberName) DebugN("---> Empty, no chambers to remove.");
    else {   
       for (int i = 1; i <= dynlen(channels); i++){ 
           removeSymbol(myModuleName(), myPanelName(), "channel_pnl_Ref_" + chamberName + "_" + dpes[i]);
       }
    }
}

/**
 * Removes the first Nplots or if 0 is passsed it removes all the plots.
 */

void removePlots (int Nplots) {
    
    if (Nplots == 0) Nplots = dynlen(channelsToPlot);
    dyn_string exceptionInfo;
    
    for (int i = 1; i <= Nplots; i++) {
        fwTrending_removeFaceplate(myModuleNameMain, myPanelNameMain, "Plot" + i, exceptionInfo);
    }
}

/**
 * Executes the spark batch that triggers GNUplot.
 */

int runBatch(string path) {
    
    return system("cmd /c " + path);
}

/**
 * Spash screen.
 */

void splashScreen(bool enabled) {
    
    if (enabled) {    
        addSymbol(myModuleName(), myPanelName(), "objects/shadow.pnl", "shadow",
                  makeDynString(), 0, 0, 1, 1, 1); 
        ChildPanelOn("objects/about.pnl", "About", makeDynString(""), 400, 300);
        delay(4);
        
        PanelOffPanel("About");
        delay(0, 500);
        removeSymbol(myModuleName(), myPanelName(), "shadow");
    }
}

/**
 *  Gets the number of plots and the size of the area
 *  and returns the optimal size of the grid to print them.
 */
    
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
 *  Touches the values of vMon and iMon of All fwCaenChannel
 */
touchChannels() {

  dyn_string psChannels = dpNames("*", "FwCaenChannel");

  float temp1, temp2;
  for (int i = 1; i <= dynlen(psChannels); i++) {
      dpGet(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpGet(psChannels[i] + ".actual.iMon:_original.._value", temp2);
      dpSetWait(psChannels[i] + ".actual.vMon:_original.._value", temp1);
      dpSetWait(psChannels[i] + ".actual.iMon:_original.._value", temp2);
  }
}
