@BWOHD
Feature: BWOHD - Verification of BWOHD Design Time

  @BWOHD
  Scenario:Validate Schema is generating for BW plugin using process chain
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPCLIENT" with value: "client"
    Then Enter input plugin property: "Host" with value: "ashost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPGcsPath" with value: "gcsPath"
    Then Enter input plugin property: "ProcessChain" with value: "processChainId"
    Then Enter input plugin property: "SAPNotifyWait" with value: "notifyTime"
    Then Validate "SAP BW Open Hub" plugin properties
    Then Verify "No errors found" is displayed

  Scenario:Validate Schema is generating for BW plugin using Open hub destination without request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPCLIENT" with value: "client"
    Then Enter input plugin property: "Host" with value: "ashost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPGcsPath" with value: "gcsPath"
    Then Click plugin property: "ProcessChainFalse"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_pur2"
    Then Validate "SAP BW Open Hub" plugin properties
    Then Verify "No errors found" is displayed
    Then Close the Plugin Properties page

  Scenario:Validate Schema is generating for BW plugin using load balanced connection for Open hub destination with request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Select radio button plugin property: "SAPConnType" with value: "loadBalance"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPCLIENT" with value: "client"
    Then Enter input plugin property: "Host" with value: "ashost"
    Then Enter input plugin property: "SAPPortNumber" with value: "msserv"
    Then Enter input plugin property: "SAPSystemId" with value: "r3name"
    Then Enter input plugin property: "SAPGroupName" with value: "group"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPGcsPath" with value: "gcsPath"
    Then Click plugin property: "ProcessChainFalse"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_pur2"
    Then Enter input plugin property: "RequestID" with value: "requestId_pur"
    Then Validate "SAP BW Open Hub" plugin properties
    Then Verify "No errors found" is displayed
    Then Close the Plugin Properties page

  Scenario:Validate Schema is generating for BW plugin using load balanced connection for Open hub destination without request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPCLIENT" with value: "client"
    Then Enter input plugin property: "Host" with value: "ashost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPGcsPath" with value: "gcsPath"
    Then Click plugin property: "ProcessChainFalse"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_pur2"
    Then Validate "SAP BW Open Hub" plugin properties
    Then Verify "No errors found" is displayed
    Then Close the Plugin Properties page
