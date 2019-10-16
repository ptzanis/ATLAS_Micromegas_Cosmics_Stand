
    // generated using Cacophony, an optional module of quasar
    // generated at: TODO




void
configureSCA (int docNum,
	      int childNode,
	      string prefix,
	      bool createDps, bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.SCA called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "SCA";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".address";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".online";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".id";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".numberRequests";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".numberReplies";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".lastReplySecondsAgo";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".requestRate";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".numberLostReplies";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".lostRepliesRate";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "I2cMaster");
  for (int i = 1; i <= dynlen (children); i++)
    configureI2cMaster (docNum, children[i], fullName + "/", createDps,
			assignAddresses, continueOnError);

  children = getChildNodesWithName (docNum, childNode, "SpiSystem");
  for (int i = 1; i <= dynlen (children); i++)
    configureSpiSystem (docNum, children[i], fullName + "/", createDps,
			assignAddresses, continueOnError);

  children = getChildNodesWithName (docNum, childNode, "AnalogInputSystem");
  for (int i = 1; i <= dynlen (children); i++)
    configureAnalogInputSystem (docNum, children[i], fullName + "/",
				createDps, assignAddresses, continueOnError);

  children = getChildNodesWithName (docNum, childNode, "DigitalIOSystem");
  for (int i = 1; i <= dynlen (children); i++)
    configureDigitalIOSystem (docNum, children[i], fullName + "/", createDps,
			      assignAddresses, continueOnError);

  children = getChildNodesWithName (docNum, childNode, "DacSystem");
  for (int i = 1; i <= dynlen (children); i++)
    configureDacSystem (docNum, children[i], fullName + "/", createDps,
			assignAddresses, continueOnError);

  children = getChildNodesWithName (docNum, childNode, "JtagSystem");
  for (int i = 1; i <= dynlen (children); i++)
    configureJtagSystem (docNum, children[i], fullName + "/", createDps,
			 assignAddresses, continueOnError);


}


void
configureAnalogInput (int docNum,
		      int childNode,
		      string prefix,
		      bool createDps,
		      bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.AnalogInput called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "AnalogInput";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".value";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".rawValue";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureI2cMaster (int docNum,
		    int childNode,
		    string prefix,
		    bool createDps,
		    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.I2cMaster called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "I2cMaster";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".diagnostics";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "I2cSlave");
  for (int i = 1; i <= dynlen (children); i++)
    configureI2cSlave (docNum, children[i], fullName + "/", createDps,
		       assignAddresses, continueOnError);


}


void
configureSpiSystem (int docNum,
		    int childNode,
		    string prefix,
		    bool createDps,
		    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.SpiSystem called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "SpiSystem";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "SpiSlave");
  for (int i = 1; i <= dynlen (children); i++)
    configureSpiSlave (docNum, children[i], fullName + "/", createDps,
		       assignAddresses, continueOnError);


}


void
configureAnalogInputSystem (int docNum,
			    int childNode,
			    string prefix,
			    bool createDps,
			    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.AnalogInputSystem called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "AnalogInputSystem";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".generalRefreshRate";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_IO_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".diagnostics";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "AnalogInput");
  for (int i = 1; i <= dynlen (children); i++)
    configureAnalogInput (docNum, children[i], fullName + "/", createDps,
			  assignAddresses, continueOnError);


}


void
configureSpiSlave (int docNum,
		   int childNode,
		   string prefix,
		   bool createDps, bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.SpiSlave called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "SpiSlave";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".value";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_IO_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureDigitalIOSystem (int docNum,
			  int childNode,
			  string prefix,
			  bool createDps,
			  bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.DigitalIOSystem called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "DigitalIOSystem";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".diagnostics";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "DigitalIO");
  for (int i = 1; i <= dynlen (children); i++)
    configureDigitalIO (docNum, children[i], fullName + "/", createDps,
			assignAddresses, continueOnError);


}


void
configureDigitalIO (int docNum,
		    int childNode,
		    string prefix,
		    bool createDps,
		    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.DigitalIO called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "DigitalIO";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".value";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_IO_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureDacSystem (int docNum,
		    int childNode,
		    string prefix,
		    bool createDps,
		    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.DacSystem called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "DacSystem";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "DacOutput");
  for (int i = 1; i <= dynlen (children); i++)
    configureDacOutput (docNum, children[i], fullName + "/", createDps,
			assignAddresses, continueOnError);


}


void
configureDacOutput (int docNum,
		    int childNode,
		    string prefix,
		    bool createDps,
		    bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.DacOutput called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "DacOutput";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".voltage";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_IO_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureI2cSlave (int docNum,
		   int childNode,
		   string prefix,
		   bool createDps, bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.I2cSlave called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "I2cSlave";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".value";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_IO_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureMeta (int docNum,
	       int childNode,
	       string prefix,
	       bool createDps, bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.Meta called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "Meta";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".versionString";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureXilinxFpga (int docNum,
		     int childNode,
		     string prefix,
		     bool createDps,
		     bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.XilinxFpga called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "XilinxFpga";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".idcodeNumeric";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

      dpe = fullName + ".idcodeString";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address, "" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SQUERY /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureJtagSystem (int docNum,
		     int childNode,
		     string prefix,
		     bool createDps,
		     bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.JtagSystem called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "JtagSystem";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

    }

  dyn_int children;

  children = getChildNodesWithName (docNum, childNode, "XilinxFpga");
  for (int i = 1; i <= dynlen (children); i++)
    configureXilinxFpga (docNum, children[i], fullName + "/", createDps,
			 assignAddresses, continueOnError);


}


void
configureScaSupervisor (int docNum,
			int childNode,
			string prefix,
			bool createDps,
			bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.ScaSupervisor called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "ScaSupervisor";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".numberOffline";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}


void
configureAdcSampler (int docNum,
		     int childNode,
		     string prefix,
		     bool createDps,
		     bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.AdcSampler called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "AdcSampler";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

    }

  dyn_int children;


}


void
configureGlobalStatistician (int docNum,
			     int childNode,
			     string prefix,
			     bool createDps,
			     bool assignAddresses, bool continueOnError)
{
  DebugTN ("Configure.GlobalStatistician called");
  string name;
  xmlGetElementAttribute (docNum, childNode, "name", name);
  string fullName = prefix + name;
  string dpt = "OpcUaScaServer" + "GlobalStatistician";

  if (createDps)
    {
      DebugTN ("Will create DP " + fullName);
      int result = dpCreate (fullName, dpt);
      if (result != 0)
	{
	  DebugTN ("dpCreate name='" + fullName + "' dpt='" + dpt +
		   "' not successful or already existing");
	  if (!continueOnError)
	    throw (makeError
		   ("Cacophony", PRIO_SEVERE, ERR_IMPL, 1, "XXX YYY ZZZ"));
	}
    }

  if (assignAddresses)
    {
      string dpe, address;
      dyn_string dsExceptionInfo;

      dpe = fullName + ".requestRate";
      address = dpe;		// address can be generated from dpe after some mods ...
      strreplace (address, "/", ".");
      fwPeriphAddress_setOPCUA (dpe /*dpe */ ,
				"OpcUaScaServer" /* server name */ ,
				15,
				"ns=2;s=" + address,
				"OpcUaScaServerSub" /* subscription */ ,
				1 /* kind */ ,
				1 /* variant */ ,
				750 /* datatype */ ,
				DPATTR_ADDR_MODE_INPUT_SPONT /* mode */ ,
				"" /*poll group */ ,
				dsExceptionInfo);

    }

  dyn_int children;


}



dyn_int
getChildNodesWithName (int docNum, int parentNode, string name)
{
  dyn_int result;
  int node = xmlFirstChild (docNum, parentNode);
  while (node >= 0)
    {
      if (xmlNodeName (docNum, node) == name)
	dynAppend (result, node);
      node = xmlNextSibling (docNum, node);
    }
  return result;
}

int
main (string configFileName, bool createDps, bool assignAddresses,
      bool continueOnError)
    /* Create instances */
{
  string errMsg;
  int errLine;
  int errColumn;
  int docNum =
    xmlDocumentFromFile (configFileName, errMsg, errLine, errColumn);
  if (docNum < 0)
    {
      DebugN ("Didn't open the file: at Line=" + errLine + " Column=" +
	      errColumn + " Message=" + errMsg);
      return -1;
    }

  int firstNode = xmlFirstChild (docNum);
  if (firstNode < 0)
    {
      DebugN ("Cant get the first child of the config file.");
      return -1;
    }
  while (xmlNodeName (docNum, firstNode) != "configuration")
    {
      firstNode = xmlNextSibling (docNum, firstNode);
      if (firstNode < 0)
	{
	  DebugTN ("configuration node not found, sorry.");
	  return -1;
	}
    }
  // now firstNode holds configuration node   
  dyn_int children;

  dyn_int children = getChildNodesWithName (docNum, firstNode, "SCA");
  for (int i = 1; i <= dynlen (children); i++)
    {
      configureSCA (docNum, children[i], "", createDps, assignAddresses,
		    continueOnError);
    }

  dyn_int children = getChildNodesWithName (docNum, firstNode, "AdcSampler");
  for (int i = 1; i <= dynlen (children); i++)
    {
      configureAdcSampler (docNum, children[i], "", createDps,
			   assignAddresses, continueOnError);
    }



  return 0;
}
