@BWOHD
Feature: BWOHD - Verification of BWOHD to BQ successful data transfer

  @BQ_SINK_TEST
  Scenario: Validate successful records transfer from Bw to BQ using Open hub destination without request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPClient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "serverHost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Click plugin property: "UseProcessChain"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_pur2"
    Then Click on the Get Schema button
    Then Validate "SAP BW Open Hub" plugin properties
    Then Close the Plugin Properties page
    Then Expand Plugin group in the LHS plugins list: "Sink"
    Then Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "Project" with value: "gcpProjectId"
    Then Enter input plugin property: "DatasetProject" with value: "projectId"
    Then Enter input plugin property: "ReferenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "Dataset" with value: "dataset"
    Then Enter input plugin property: "Table" with value: "bqTargetTable"
    Then Click plugin property: "switch-truncateTable"
    Then Click plugin property: "switch-allowSchemaRelaxation"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Connect plugins: "SAP BW Open Hub" and "BigQuery" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"

  @BQ_SINK_TEST
  Scenario:Validate successful records transfer from Bw to BQ using Open hub destination with request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPClient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "serverHost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Click plugin property: "UseProcessChain"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_mat"
    Then Enter input plugin property: "RequestID" with value: "requestId_mat"
    Then Click on the Get Schema button
    Then Validate "SAP BW Open Hub" plugin properties
    Then Close the Plugin Properties page
    Then Expand Plugin group in the LHS plugins list: "Sink"
    Then Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "Project" with value: "gcpProjectId"
    Then Enter input plugin property: "DatasetProject" with value: "projectId"
    Then Enter input plugin property: "ReferenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "Dataset" with value: "dataset"
    Then Enter input plugin property: "Table" with value: "bqTargetTable"
    Then Click plugin property: "switch-truncateTable"
    Then Click plugin property: "switch-allowSchemaRelaxation"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Connect plugins: "SAP BW Open Hub" and "BigQuery" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"

  @BQ_SINK_TEST
  Scenario:Validate successful records transfer using load balanced connection from Bw to BQ using Open hub destination with request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Select radio button plugin property: "SAPConnType" with value: "loadBalance"
    Then Enter input plugin property: "ReferenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPlient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "serverHost"
    Then Enter input plugin property: "SAPPortNumber" with value: "msserv"
    Then Enter input plugin property: "SAPSystemId" with value: "r3name"
    Then Enter input plugin property: "SAPGroupName" with value: "group"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Click plugin property: "UseProcessChain"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_mat"
    Then Enter input plugin property: "RequestID" with value: "requestId_mat"
    Then Click on the Get Schema button
    Then Validate "SAP BW Open Hub" plugin properties
    Then Close the Plugin Properties page
    Then Expand Plugin group in the LHS plugins list: "Sink"
    Then Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "Project" with value: "gcpProjectId"
    Then Enter input plugin property: "DatasetProject" with value: "projectId"
    Then Enter input plugin property: "ReferenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "Dataset" with value: "dataset"
    Then Enter input plugin property: "Table" with value: "bqTargetTable"
    Then Click plugin property: "switch-truncateTable"
    Then Click plugin property: "switch-allowSchemaRelaxation"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Connect plugins: "SAP BW Open Hub" and "BigQuery" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"

  @BQ_SINK_TEST
  Scenario:Validate successful records transfer using load balanced connection from Bw to BQ using Open hub destination without request id
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Select radio button plugin property: "SAPConnType" with value: "loadBalance"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPClient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "serverHost"
    Then Enter input plugin property: "SAPPortNumber" with value: "msserv"
    Then Enter input plugin property: "SAPSystemId" with value: "r3name"
    Then Enter input plugin property: "SAPGroupName" with value: "group"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Click plugin property: "UseProcessChain"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_pur2"
    Then Click on the Get Schema button
    Then Validate "SAP BW Open Hub" plugin properties
    Then Close the Plugin Properties page
    Then Expand Plugin group in the LHS plugins list: "Sink"
    Then Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "Project" with value: "gcpProjectId"
    Then Enter input plugin property: "DatasetProject" with value: "projectId"
    Then Enter input plugin property: "ReferenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "Dataset" with value: "dataset"
    Then Enter input plugin property: "Table" with value: "bqTargetTable"
    Then Click plugin property: "switch-truncateTable"
    Then Click plugin property: "switch-allowSchemaRelaxation"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Connect plugins: "SAP BW Open Hub" and "BigQuery" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"

  @BQ_SINK_TEST
  Scenario:Validate successful records transfer for all supported data types
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "SAP BW Open Hub" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "SAP BW Open Hub"
    Then Enter input plugin property: "referenceName" with value: "SAPBWOHD"
    Then Enter input plugin property: "SAPClient" with value: "client"
    Then Enter input plugin property: "SAPAppServerHost" with value: "serverHost"
    Then Enter input plugin property: "SAPSystemNumber" with value: "sysnr"
    Then Enter input plugin property: "SAPLogonUsername" with value: "bwohd_username"
    Then Enter input plugin property: "SAPLogonPassword" with value: "bwohd_password"
    Then Enter input plugin property: "SAPJCoLibraryGCSPath" with value: "gcsPath"
    Then Click plugin property: "UseProcessChain"
    Then Enter input plugin property: "OpenHubDestination" with value: "openHubDestination_dtty"
    Then Enter input plugin property: "RequestID" with value: "requestId_dtty"
    Then Click on the Get Schema button
    Then Validate "SAP BW Open Hub" plugin properties
    Then Close the Plugin Properties page
    Then Expand Plugin group in the LHS plugins list: "Sink"
    Then Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "Project" with value: "gcpProjectId"
    Then Enter input plugin property: "DatasetProject" with value: "projectId"
    Then Enter input plugin property: "ReferenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "Dataset" with value: "dataset"
    Then Enter input plugin property: "Table" with value: "bqTargetTable"
    Then Click plugin property: "switch-truncateTable"
    Then Click plugin property: "switch-allowSchemaRelaxation"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Connect plugins: "SAP BW Open Hub" and "BigQuery" to establish connection
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Validate and Match the expected Sap record in BigQuery "bqTargetTable" Table
