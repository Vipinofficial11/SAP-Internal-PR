@BWOHD
Feature: BWOHD - Negative Scenario

  Scenario Outline: Validate for wrong parameters plugin throws proper error messages
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPClient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "ashost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Enter input plugin property: "ProcessChain" with value: "processChainId"
    Then Verify that after setting BW parameter "<pluginProperty>" as "<Value>" plugin throws error "<errorMessage>"
    Examples:
      | pluginProperty              | Value                    | errorMessage                                                   |                                                                                                                                                                                                                                                        |
      | SAPClient                   | errorValue               | errorMessageSapClient                                          |
      | SAPLanguage                 | errorValue               | errorMessageSapLanguage                                        |
      | SAPAppServerHost            | errorValueHost           | errorMessageSapHost                                            |
      | SAPSystemNumber             | errorValue               | errorMessageSapSystemNumber                                    |
      | ProcessChain                | errorValue               | errorMessageSapProcessChain                                    |
      | SAPJCoLibraryGCSPath        | errorValueGcsPath        | errorMessageSapSAPGcsPath                                      |
