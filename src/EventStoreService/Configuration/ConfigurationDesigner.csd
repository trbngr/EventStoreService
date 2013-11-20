<?xml version="1.0" encoding="utf-8"?>
<configurationSectionModel xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="417279c0-6bf9-47b1-88b0-edbf9effd099" namespace="EventStoreService.Configuration" xmlSchemaNamespace="urn:EventStoreService.Configuration" xmlns="http://schemas.microsoft.com/dsltools/ConfigurationSectionDesigner">
  <typeDefinitions>
    <externalType name="String" namespace="System" />
    <externalType name="Boolean" namespace="System" />
    <externalType name="Int32" namespace="System" />
    <externalType name="Int64" namespace="System" />
    <externalType name="Single" namespace="System" />
    <externalType name="Double" namespace="System" />
    <externalType name="DateTime" namespace="System" />
    <externalType name="TimeSpan" namespace="System" />
    <externalType name="IPAddress" namespace="System.Net" />
    <externalType name="IPEndPoint" namespace="System.Net" />
    <enumeratedType name="RunMode" namespace="EventStoreService.Configuration" codeGenOptions="None">
      <literals>
        <enumerationLiteral name="SingleNode" />
        <enumerationLiteral name="Cluster" />
      </literals>
    </enumeratedType>
    <enumeratedType name="ArgumentKind" namespace="EventStoreService.Configuration" codeGenOptions="None">
      <literals>
        <enumerationLiteral name="Json" />
        <enumerationLiteral name="CommandLine" />
      </literals>
    </enumeratedType>
    <enumeratedType name="RunProjections" namespace="EventStoreService.Configuration" codeGenOptions="None">
      <literals>
        <enumerationLiteral name="None" />
        <enumerationLiteral name="System" />
        <enumerationLiteral name="All" />
      </literals>
    </enumeratedType>
  </typeDefinitions>
  <configurationElements>
    <configurationSection name="EventStoreServiceConfiguration" codeGenOptions="Singleton, XmlnsProperty" xmlSectionName="eventStoreService">
      <elementProperties>
        <elementProperty name="WindowsService" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="windowsService" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/WindowsServiceElement" />
          </type>
        </elementProperty>
        <elementProperty name="EventStore" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="eventStore" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/EventStoreElement" />
          </type>
        </elementProperty>
      </elementProperties>
    </configurationSection>
    <configurationElement name="WindowsServiceElement">
      <attributeProperties>
        <attributeProperty name="ServiceName" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="serviceName" isReadOnly="false">
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="Description" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="description" isReadOnly="false">
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="DisplayName" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="displayName" isReadOnly="false">
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="EventStoreElement">
      <attributeProperties>
        <attributeProperty name="RunMode" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="runMode" isReadOnly="false" documentation="The type of node to start." defaultValue="RunMode.SingleNode">
          <type>
            <enumeratedTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/RunMode" />
          </type>
        </attributeProperty>
        <attributeProperty name="BinaryPath" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="binaryPath" isReadOnly="false" documentation="The path to the EventStore binaries." defaultValue="&quot;eventstore&quot;">
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="Debug" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="debug" isReadOnly="false" defaultValue="false">
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
        <attributeProperty name="Arguments" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="arguments" isReadOnly="false" defaultValue="ArgumentKind.Json">
          <type>
            <enumeratedTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ArgumentKind" />
          </type>
        </attributeProperty>
      </attributeProperties>
      <elementProperties>
        <elementProperty name="Database" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="database" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/DatabaseElement" />
          </type>
        </elementProperty>
        <elementProperty name="Projections" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="projections" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ProjectionsElement" />
          </type>
        </elementProperty>
        <elementProperty name="SingleNode" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="singleNode" isReadOnly="false" documentation="Configuration for single node run mode.">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/SingleNodeElement" />
          </type>
        </elementProperty>
        <elementProperty name="Cluster" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="cluster" isReadOnly="false" documentation="Configuration for cluster run mode.">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterElement" />
          </type>
        </elementProperty>
      </elementProperties>
    </configurationElement>
    <configurationElement name="DatabaseElement">
      <attributeProperties>
        <attributeProperty name="InMemory" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="inMemory" isReadOnly="false" documentation="Keep everything in memory, no directories or files are created." browsable="false" defaultValue="true">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InMemDbCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InMemDbJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
        <attributeProperty name="DbPath" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="path" isReadOnly="false" documentation="The path the db should be loaded/saved to." defaultValue="Opts.DbPathDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.DbPathCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.DbPathJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="Logs" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="logs" isReadOnly="false">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.LogsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.LogsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="SkipDbVerify" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="skipDbVerify" isReadOnly="false" documentation="Bypasses the checking of file hashes of database during startup (allows for faster startup)." defaultValue="Opts.SkipDbVerifyDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.SkipDbVerifyCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.SkipDbVerifyJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
        <attributeProperty name="CachedChunks" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="cachedChunks" isReadOnly="false" documentation="The number of chunks to cache in unmanaged memory." defaultValue="Opts.CachedChunksDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.CachedChunksCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.CachedChunksJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="ChunksCacheSize" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="chunksCacheSize" isReadOnly="false" documentation="The amount of unmanaged memory to use for caching chunks." defaultValue="TFConsts.ChunksCacheSize">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ChunksCacheSizeCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ChunksCacheSizeJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="MinFlushDelay" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="minFlushDelay" isReadOnly="false" documentation="The minimum flush delay in milliseconds." defaultValue="2d">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.MinFlushDelayMsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.MinFlushDelayMsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Double" />
          </type>
        </attributeProperty>
        <attributeProperty name="StatsPeriod" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="statsPeriod" isReadOnly="false" documentation="The number of seconds between statistics gathers." defaultValue="Opts.StatsPeriodDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.StatsPeriodCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.StatsPeriodJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="NodePriority" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="nodePriority" isReadOnly="false" documentation="The node priority used during master election" defaultValue="Opts.NodePriorityDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.NodePriorityCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.NodePriorityJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="DisableScavengeMerge" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="disableScavengeMerge" isReadOnly="false" documentation="Disables the merging of chunks when scavenge is running" defaultValue="Opts.DisableScavengeMergeDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.DisableScavengeMergeCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.DisableScavengeMergeJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ProjectionsElement">
      <attributeProperties>
        <attributeProperty name="Run" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="run" isReadOnly="false" documentation="Enables the running of JavaScript projections." defaultValue="RunProjections.System">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.RunProjectionsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.RunProjectionsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <enumeratedTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/RunProjections" />
          </type>
        </attributeProperty>
        <attributeProperty name="Threads" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="threads" isReadOnly="false" documentation="The number of threads to use for projections." defaultValue="Opts.ProjectionThreadsDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ProjectionThreadsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ProjectionThreadsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="SingleNodeElement">
      <attributeProperties>
        <attributeProperty name="Ip" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="ip" isReadOnly="false" documentation="The IP address to bind to." typeConverter="Custom" defaultValue="&quot;127.0.0.1&quot;">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddressTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.IpCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.IpJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
          </type>
        </attributeProperty>
        <attributeProperty name="TcpPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="tcpPort" isReadOnly="false" documentation="The port to run the TCP server on." defaultValue="Opts.TcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.TcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.TcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="SecureTcpPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="secureTcpPort" isReadOnly="false" defaultValue="Opts.SecureTcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.SecureTcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.SecureTcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="HttpPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="httpPort" isReadOnly="false" documentation="The port to run the HTTP server on." defaultValue="Opts.HttpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.HttpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.HttpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterElement">
      <attributeProperties>
        <attributeProperty name="ClusterSize" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="clusterSize" isReadOnly="false" documentation="The number of nodes in the cluster." defaultValue="Opts.ClusterSizeDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ClusterSizeCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ClusterSizeJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="CommitCount" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="commitCount" isReadOnly="false" documentation="The number of nodes which must acknowledge commits before acknowledging to a client." defaultValue="Opts.CommitCountDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.CommitCountCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.CommitCountJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="PrepareCount" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="prepareCount" isReadOnly="false" documentation="The number of nodes which must acknowledge prepares." defaultValue="Opts.PrepareCountDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.PrepareCountCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.PrepareCountJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
      <elementProperties>
        <elementProperty name="Ip" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="ip" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterIpElement" />
          </type>
        </elementProperty>
        <elementProperty name="Http" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="http" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterHttpElement" />
          </type>
        </elementProperty>
        <elementProperty name="Tcp" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="tcp" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterTcpElement" />
          </type>
        </elementProperty>
        <elementProperty name="Manager" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="manager" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterManagerElement" />
          </type>
        </elementProperty>
        <elementProperty name="Ssl" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="ssl" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterSslElement" />
          </type>
        </elementProperty>
        <elementProperty name="Dns" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="dns" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterDnsElement" />
          </type>
        </elementProperty>
        <elementProperty name="Gossip" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="gossip" isReadOnly="false">
          <type>
            <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/ClusterGossipElement" />
          </type>
        </elementProperty>
      </elementProperties>
    </configurationElement>
    <configurationElement name="ClusterIpElement">
      <attributeProperties>
        <attributeProperty name="Internal" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="internal" isReadOnly="false" documentation="Internal IP Address." typeConverter="Custom" defaultValue="&quot;127.0.0.1&quot;">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddressTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalIpCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalIpJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
          </type>
        </attributeProperty>
        <attributeProperty name="External" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="external" isReadOnly="false" documentation="External IP Address." typeConverter="Custom" defaultValue="&quot;127.0.0.1&quot;">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddressTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalIpCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalIpJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterHttpElement">
      <attributeProperties>
        <attributeProperty name="InternalPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="internalPort" isReadOnly="false" documentation="Internal HTTP Port." defaultValue="Opts.InternalHttpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalHttpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalHttpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="ExternalPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="externalPort" isReadOnly="false" documentation="External HTTP Port." defaultValue="Opts.ExternalHttpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalHttpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalHttpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterTcpElement">
      <attributeProperties>
        <attributeProperty name="InternalPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="internalPort" isReadOnly="false" documentation="Internal TCP Port." defaultValue="Opts.InternalTcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalTcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalTcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="InternalSecurePort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="internalSecurePort" isReadOnly="false" documentation="Internal Secure TCP Port." defaultValue="Opts.InternalSecureTcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalSecureTcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalSecureTcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="ExternalPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="externalPort" isReadOnly="false" documentation="External TCP Port." defaultValue="Opts.ExternalTcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalTcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalTcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="ExternalSecurePort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="externalSecurePort" isReadOnly="false" documentation="External Secure TCP Port." defaultValue="Opts.ExternalSecureTcpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalSecureTcpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalSecureTcpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterManagerElement">
      <attributeProperties>
        <attributeProperty name="InternalIp" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="internalIp" isReadOnly="false" typeConverter="Custom" defaultValue="&quot;127.0.0.1&quot;">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddressTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalManagerIpCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalManagerIpJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
          </type>
        </attributeProperty>
        <attributeProperty name="ExternalIp" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="externalIp" isReadOnly="false" typeConverter="Custom" defaultValue="&quot;127.0.0.1&quot;">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddressTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalManagerIpCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalManagerIpJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
          </type>
        </attributeProperty>
        <attributeProperty name="InternalHttpPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="internalHttpPort" isReadOnly="false" defaultValue="Opts.InternalManagerHttpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.InternalManagerHttpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.InternalManagerHttpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
        <attributeProperty name="ExternalHttpPort" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="externalHttpPort" isReadOnly="false" defaultValue="Opts.ExternalManagerHttpPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ExternalManagerHttpPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ExternalManagerHttpPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterSslElement">
      <attributeProperties>
        <attributeProperty name="UseInternalSsl" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="useInternalSsl" isReadOnly="false" documentation="Whether to use secure internal communication." defaultValue="Opts.UseInternalSslDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.UseInternalSslCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.UseInternalSslJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
        <attributeProperty name="SslTargetHost" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="sslTargetHost" isReadOnly="false" documentation="Target host of server's SSL certificate." defaultValue="Opts.SslTargetHostDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.SslTargetHostCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.SslTargetHostJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
        <attributeProperty name="SslValidateServer" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="sslValidateServer" isReadOnly="false" defaultValue="Opts.SslValidateServerDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.SslValidateServerCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.SslValidateServerJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterDnsElement">
      <attributeProperties>
        <attributeProperty name="DiscoverViaDns" isRequired="true" isKey="false" isDefaultCollection="false" xmlName="discoverViaDns" isReadOnly="false" documentation="Whether to use DNS lookup to discover other cluster nodes." defaultValue="Opts.DiscoverViaDnsDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.DiscoverViaDnsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.DiscoverViaDnsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Boolean" />
          </type>
        </attributeProperty>
        <attributeProperty name="ClusterDns" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="clusterDns" isReadOnly="false" documentation="DNS name from which other nodes can be discovered." defaultValue="Opts.ClusterDnsDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ClusterDnsCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ClusterDnsJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/String" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElement name="ClusterGossipElement">
      <attributeProperties>
        <attributeProperty name="Port" isRequired="false" isKey="false" isDefaultCollection="false" xmlName="port" isReadOnly="false" documentation="The port on which cluster nodes' managers are running." defaultValue="Opts.ClusterGossipPortDefault">
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.ClusterGossipPortCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.ClusterGossipPortJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/Int32" />
          </type>
        </attributeProperty>
      </attributeProperties>
      <elementProperties>
        <elementProperty name="Seeds" isRequired="true" isKey="false" isDefaultCollection="true" xmlName="seeds" isReadOnly="false" documentation="Endpoints for other cluster nodes from which to seed gossip">
          <type>
            <configurationElementCollectionMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPEndpointElementCollection" />
          </type>
        </elementProperty>
      </elementProperties>
    </configurationElement>
    <configurationElement name="IPEndpointElement">
      <attributeProperties>
        <attributeProperty name="Address" isRequired="true" isKey="true" isDefaultCollection="false" xmlName="address" isReadOnly="false" typeConverter="Custom">
          <customTypeConverter>
            <converterMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPEndPointTypeConverter" />
          </customTypeConverter>
          <customAttributes>
            <attribute name="CommandLineArgument">
              <parameters>
                <parameter name="" value="Opts.GossipSeedCmd" />
              </parameters>
            </attribute>
            <attribute name="JsonProperty">
              <parameters>
                <parameter name="" value="Opts.GossipSeedJson" />
              </parameters>
            </attribute>
          </customAttributes>
          <type>
            <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPEndPoint" />
          </type>
        </attributeProperty>
      </attributeProperties>
    </configurationElement>
    <configurationElementCollection name="IPEndpointElementCollection" xmlItemName="endpoint" codeGenOptions="Indexer, AddMethod, RemoveMethod, GetItemMethods">
      <itemType>
        <configurationElementMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPEndpointElement" />
      </itemType>
    </configurationElementCollection>
  </configurationElements>
  <propertyValidators>
    <validators />
  </propertyValidators>
  <customTypeConverters>
    <converter name="IPAddressTypeConverter">
      <type>
        <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPAddress" />
      </type>
    </converter>
    <converter name="IPEndPointTypeConverter">
      <type>
        <externalTypeMoniker name="/417279c0-6bf9-47b1-88b0-edbf9effd099/IPEndPoint" />
      </type>
    </converter>
  </customTypeConverters>
</configurationSectionModel>