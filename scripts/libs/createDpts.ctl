
    // generated using Cacophony, an optional module of quasar
    // generated at: TODO


    //SCA
bool
createDptSCA ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerSCA", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "address"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));

  dynAppend (xxdepes, makeDynString ("", "online"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_BOOL));

  dynAppend (xxdepes, makeDynString ("", "id"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_UINT));

  dynAppend (xxdepes, makeDynString ("", "numberRequests"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_ULONG));

  dynAppend (xxdepes, makeDynString ("", "numberReplies"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_ULONG));

  dynAppend (xxdepes, makeDynString ("", "lastReplySecondsAgo"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_ULONG));

  dynAppend (xxdepes, makeDynString ("", "requestRate"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));

  dynAppend (xxdepes, makeDynString ("", "numberLostReplies"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_ULONG));

  dynAppend (xxdepes, makeDynString ("", "lostRepliesRate"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //AnalogInput
bool
createDptAnalogInput ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerAnalogInput", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "value"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));

  dynAppend (xxdepes, makeDynString ("", "rawValue"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_UINT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //I2cMaster
bool
createDptI2cMaster ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerI2cMaster", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "diagnostics"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //SpiSystem
bool
createDptSpiSystem ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerSpiSystem", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //AnalogInputSystem
bool
createDptAnalogInputSystem ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerAnalogInputSystem", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "generalRefreshRate"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));

  dynAppend (xxdepes, makeDynString ("", "diagnostics"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //SpiSlave
bool
createDptSpiSlave ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerSpiSlave", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "value"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_BLOB));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //DigitalIOSystem
bool
createDptDigitalIOSystem ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerDigitalIOSystem", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "diagnostics"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //DigitalIO
bool
createDptDigitalIO ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerDigitalIO", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "value"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_BOOL));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //DacSystem
bool
createDptDacSystem ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerDacSystem", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //DacOutput
bool
createDptDacOutput ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerDacOutput", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "voltage"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //I2cSlave
bool
createDptI2cSlave ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerI2cSlave", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "value"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_BLOB));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //Meta
bool
createDptMeta ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerMeta", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "versionString"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //XilinxFpga
bool
createDptXilinxFpga ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerXilinxFpga", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "idcodeNumeric"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_UINT));

  dynAppend (xxdepes, makeDynString ("", "idcodeString"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_STRING));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //JtagSystem
bool
createDptJtagSystem ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerJtagSystem", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //ScaSupervisor
bool
createDptScaSupervisor ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerScaSupervisor", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "numberOffline"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_UINT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //AdcSampler
bool
createDptAdcSampler ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerAdcSampler", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}

    //GlobalStatistician
bool
createDptGlobalStatistician ()
{
  // the names of vars and the way of generating DPT come directly from examples of dpTypeCreate
  dyn_dyn_string xxdepes;
  dyn_dyn_int xxdepei;
  dynAppend (xxdepes, makeDynString ("OpcUaScaServerGlobalStatistician", ""));
  dynAppend (xxdepei, makeDynInt (DPEL_STRUCT));

  dynAppend (xxdepes, makeDynString ("", "requestRate"));
  dynAppend (xxdepei, makeDynInt (0, DPEL_FLOAT));


  int status = dpTypeCreate (xxdepes, xxdepei);
  return status == 0;
}


int
main ()
{

  if (!createDptSCA ())
    return 1;

  if (!createDptAnalogInput ())
    return 1;

  if (!createDptI2cMaster ())
    return 1;

  if (!createDptSpiSystem ())
    return 1;

  if (!createDptAnalogInputSystem ())
    return 1;

  if (!createDptSpiSlave ())
    return 1;

  if (!createDptDigitalIOSystem ())
    return 1;

  if (!createDptDigitalIO ())
    return 1;

  if (!createDptDacSystem ())
    return 1;

  if (!createDptDacOutput ())
    return 1;

  if (!createDptI2cSlave ())
    return 1;

  if (!createDptMeta ())
    return 1;

  if (!createDptXilinxFpga ())
    return 1;

  if (!createDptJtagSystem ())
    return 1;

  if (!createDptScaSupervisor ())
    return 1;

  if (!createDptAdcSampler ())
    return 1;

  if (!createDptGlobalStatistician ())
    return 1;

  return 0;
}
