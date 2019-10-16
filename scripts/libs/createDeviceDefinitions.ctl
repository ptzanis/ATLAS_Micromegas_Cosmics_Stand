
    // generated using Cacophony, an optional module of quasar
    // generated at: TODO

void
appendToDpe (string dpe, string value)
{
  dyn_string dsSomething;
  dpGet (dpe, dsSomething);
  dynAppend (dsSomething, value);
  dpSet (dpe, dsSomething);
}


    //SCA
bool
createDeviceDefinitionSCA ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerSCAInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerSCAInfo.dpType", "OpcUaScaServerSCA");
  dpSet ("OpcUaScaServerSCAInfo.version", 1);
  dpSet ("OpcUaScaServerSCAInfo.configuration.address.canHave", true);
  dpSet ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.general.canHave",
	 true);
  dpSet
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar address
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.address");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar online
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.online");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar id
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.id");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar numberRequests
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.numberRequests");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar numberReplies
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.numberReplies");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar lastReplySecondsAgo
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.lastReplySecondsAgo");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar requestRate
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.requestRate");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar numberLostReplies
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.numberLostReplies");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");


  // for cachevar lostRepliesRate
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.lostRepliesRate");
  appendToDpe
    ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerSCAInfo.configuration.address.OPCUA.variants",
	       "EMPTY");



  return true;
}

    //AnalogInput
bool
createDeviceDefinitionAnalogInput ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerAnalogInputInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerAnalogInputInfo.dpType", "OpcUaScaServerAnalogInput");
  dpSet ("OpcUaScaServerAnalogInputInfo.version", 1);
  dpSet ("OpcUaScaServerAnalogInputInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar value
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.items",
     "ns=2;s=xxx.value");
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.types", 750);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.direction",
     2);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants",
     "EMPTY");


  // for cachevar rawValue
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.items",
     "ns=2;s=xxx.rawValue");
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.types", 750);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.direction",
     2);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants", 1);
  appendToDpe
    ("OpcUaScaServerAnalogInputInfo.configuration.address.OPCUA.variants",
     "EMPTY");



  return true;
}

    //I2cMaster
bool
createDeviceDefinitionI2cMaster ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerI2cMasterInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerI2cMasterInfo.dpType", "OpcUaScaServerI2cMaster");
  dpSet ("OpcUaScaServerI2cMasterInfo.version", 1);
  dpSet ("OpcUaScaServerI2cMasterInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerI2cMasterInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerI2cMasterInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerI2cMasterInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //SpiSystem
bool
createDeviceDefinitionSpiSystem ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerSpiSystemInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerSpiSystemInfo.dpType", "OpcUaScaServerSpiSystem");
  dpSet ("OpcUaScaServerSpiSystemInfo.version", 1);
  dpSet ("OpcUaScaServerSpiSystemInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerSpiSystemInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerSpiSystemInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerSpiSystemInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //AnalogInputSystem
bool
createDeviceDefinitionAnalogInputSystem ()
{
  int rv;
  rv =
    dpCreate ("OpcUaScaServerAnalogInputSystemInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerAnalogInputSystemInfo.dpType",
	 "OpcUaScaServerAnalogInputSystem");
  dpSet ("OpcUaScaServerAnalogInputSystemInfo.version", 1);
  dpSet ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.canHave",
	 true);
  dpSet
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar generalRefreshRate
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.items",
     "ns=2;s=xxx.generalRefreshRate");
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.kinds",
     1);
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.types",
     750);
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.direction",
     2);
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerAnalogInputSystemInfo.configuration.address.OPCUA.variants",
     "EMPTY");



  return true;
}

    //SpiSlave
bool
createDeviceDefinitionSpiSlave ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerSpiSlaveInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerSpiSlaveInfo.dpType", "OpcUaScaServerSpiSlave");
  dpSet ("OpcUaScaServerSpiSlaveInfo.version", 1);
  dpSet ("OpcUaScaServerSpiSlaveInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerSpiSlaveInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerSpiSlaveInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerSpiSlaveInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //DigitalIOSystem
bool
createDeviceDefinitionDigitalIOSystem ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerDigitalIOSystemInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerDigitalIOSystemInfo.dpType",
	 "OpcUaScaServerDigitalIOSystem");
  dpSet ("OpcUaScaServerDigitalIOSystemInfo.version", 1);
  dpSet ("OpcUaScaServerDigitalIOSystemInfo.configuration.address.canHave",
	 true);
  dpSet
    ("OpcUaScaServerDigitalIOSystemInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerDigitalIOSystemInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerDigitalIOSystemInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //DigitalIO
bool
createDeviceDefinitionDigitalIO ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerDigitalIOInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerDigitalIOInfo.dpType", "OpcUaScaServerDigitalIO");
  dpSet ("OpcUaScaServerDigitalIOInfo.version", 1);
  dpSet ("OpcUaScaServerDigitalIOInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerDigitalIOInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerDigitalIOInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerDigitalIOInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //DacSystem
bool
createDeviceDefinitionDacSystem ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerDacSystemInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerDacSystemInfo.dpType", "OpcUaScaServerDacSystem");
  dpSet ("OpcUaScaServerDacSystemInfo.version", 1);
  dpSet ("OpcUaScaServerDacSystemInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerDacSystemInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerDacSystemInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerDacSystemInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //DacOutput
bool
createDeviceDefinitionDacOutput ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerDacOutputInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerDacOutputInfo.dpType", "OpcUaScaServerDacOutput");
  dpSet ("OpcUaScaServerDacOutputInfo.version", 1);
  dpSet ("OpcUaScaServerDacOutputInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerDacOutputInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerDacOutputInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerDacOutputInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //I2cSlave
bool
createDeviceDefinitionI2cSlave ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerI2cSlaveInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerI2cSlaveInfo.dpType", "OpcUaScaServerI2cSlave");
  dpSet ("OpcUaScaServerI2cSlaveInfo.version", 1);
  dpSet ("OpcUaScaServerI2cSlaveInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerI2cSlaveInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerI2cSlaveInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerI2cSlaveInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //Meta
bool
createDeviceDefinitionMeta ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerMetaInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerMetaInfo.dpType", "OpcUaScaServerMeta");
  dpSet ("OpcUaScaServerMetaInfo.version", 1);
  dpSet ("OpcUaScaServerMetaInfo.configuration.address.canHave", true);
  dpSet ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.general.canHave",
	 true);
  dpSet
    ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar versionString
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.items",
	       "ns=2;s=xxx.versionString");
  appendToDpe
    ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.types",
	       750);
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.direction",
	       2);
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.variants",
	       1);
  appendToDpe ("OpcUaScaServerMetaInfo.configuration.address.OPCUA.variants",
	       "EMPTY");



  return true;
}

    //XilinxFpga
bool
createDeviceDefinitionXilinxFpga ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerXilinxFpgaInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerXilinxFpgaInfo.dpType", "OpcUaScaServerXilinxFpga");
  dpSet ("OpcUaScaServerXilinxFpgaInfo.version", 1);
  dpSet ("OpcUaScaServerXilinxFpgaInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerXilinxFpgaInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerXilinxFpgaInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerXilinxFpgaInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //JtagSystem
bool
createDeviceDefinitionJtagSystem ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerJtagSystemInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerJtagSystemInfo.dpType", "OpcUaScaServerJtagSystem");
  dpSet ("OpcUaScaServerJtagSystemInfo.version", 1);
  dpSet ("OpcUaScaServerJtagSystemInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerJtagSystemInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerJtagSystemInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerJtagSystemInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //ScaSupervisor
bool
createDeviceDefinitionScaSupervisor ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerScaSupervisorInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerScaSupervisorInfo.dpType",
	 "OpcUaScaServerScaSupervisor");
  dpSet ("OpcUaScaServerScaSupervisorInfo.version", 1);
  dpSet ("OpcUaScaServerScaSupervisorInfo.configuration.address.canHave",
	 true);
  dpSet
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar numberOffline
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.items",
     "ns=2;s=xxx.numberOffline");
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.kinds", 1);
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.types",
     750);
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.direction",
     2);
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerScaSupervisorInfo.configuration.address.OPCUA.variants",
     "EMPTY");



  return true;
}

    //AdcSampler
bool
createDeviceDefinitionAdcSampler ()
{
  int rv;
  rv = dpCreate ("OpcUaScaServerAdcSamplerInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerAdcSamplerInfo.dpType", "OpcUaScaServerAdcSampler");
  dpSet ("OpcUaScaServerAdcSamplerInfo.version", 1);
  dpSet ("OpcUaScaServerAdcSamplerInfo.configuration.address.canHave", true);
  dpSet
    ("OpcUaScaServerAdcSamplerInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerAdcSamplerInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerAdcSamplerInfo.configuration.address.OPCUA.general.driverNumber",
     15);


  return true;
}

    //GlobalStatistician
bool
createDeviceDefinitionGlobalStatistician ()
{
  int rv;
  rv =
    dpCreate ("OpcUaScaServerGlobalStatisticianInfo", "_FwDeviceDefinition");
  if (rv != 0)
    {
      throwError (getLastError ());
      return false;
    }
  dpSet ("OpcUaScaServerGlobalStatisticianInfo.dpType",
	 "OpcUaScaServerGlobalStatistician");
  dpSet ("OpcUaScaServerGlobalStatisticianInfo.version", 1);
  dpSet ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.canHave",
	 true);
  dpSet
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.general.canHave",
     true);
  dpSet
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.general.serverName",
     "OpcUaScaServer");
  dpSet
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.general.driverNumber",
     15);

  // for cachevar requestRate
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.items",
     "ns=2;s=xxx.requestRate");
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.subscriptions",
     "OPCUA_SUBSCRIPTION");
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.kinds",
     1);
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.types",
     750);
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.direction",
     2);
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.variants",
     1);
  appendToDpe
    ("OpcUaScaServerGlobalStatisticianInfo.configuration.address.OPCUA.variants",
     "EMPTY");



  return true;
}



int
main ()
{

  if (!createDeviceDefinitionSCA ())
    return 1;

  if (!createDeviceDefinitionAnalogInput ())
    return 1;

  if (!createDeviceDefinitionI2cMaster ())
    return 1;

  if (!createDeviceDefinitionSpiSystem ())
    return 1;

  if (!createDeviceDefinitionAnalogInputSystem ())
    return 1;

  if (!createDeviceDefinitionSpiSlave ())
    return 1;

  if (!createDeviceDefinitionDigitalIOSystem ())
    return 1;

  if (!createDeviceDefinitionDigitalIO ())
    return 1;

  if (!createDeviceDefinitionDacSystem ())
    return 1;

  if (!createDeviceDefinitionDacOutput ())
    return 1;

  if (!createDeviceDefinitionI2cSlave ())
    return 1;

  if (!createDeviceDefinitionMeta ())
    return 1;

  if (!createDeviceDefinitionXilinxFpga ())
    return 1;

  if (!createDeviceDefinitionJtagSystem ())
    return 1;

  if (!createDeviceDefinitionScaSupervisor ())
    return 1;

  if (!createDeviceDefinitionAdcSampler ())
    return 1;

  if (!createDeviceDefinitionGlobalStatistician ())
    return 1;

  return 0;
}
