/*
 * Copyright © 2022 Cask Data, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package io.cdap.plugin.bwohd.stepsdesign;

import com.google.cloud.bigquery.TableResult;
import com.google.gson.Gson;
import io.cdap.e2e.pages.actions.CdfPluginPropertiesActions;
import io.cdap.e2e.utils.*;
import io.cdap.plugin.bwohd.locators.BWOHDLocators;
import io.cucumber.java.en.Then;
import org.apache.commons.lang.StringUtils;
import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Map;
import java.util.Set;


/**
 * Contains BW OHD e2e test scenarios step definitions.
 */
public class BWOHDStepDefinition implements CdfHelper {

    private static final Logger logger = LoggerFactory.getLogger(PluginPropertyUtils.class); //not used,remove
    private static Gson gson = new Gson();
    private static String materialCreated = StringUtils.EMPTY;

    @Then("Verify {string} is displayed")
    public void verifyNoErrorMessageIsPresent(String successMessage) {
        AssertionHelper.verifyElementContainsText(BWOHDLocators.successMessage,
                successMessage);
        WaitHelper.waitForElementToBePresent(BWOHDLocators.schemaItem);
    }

    @Then("Verify that after setting BW parameter {string} as {string} plugin throws error {string}")
    public void userIsAbleToSetBWParameterAsAndGettingRowForWrongInput(
            String inputParameter, String inputValue, String errorMessage) {
        ElementHelper.replaceElementValue(BWOHDLocators.inputParameter(inputParameter), inputValue);
        CdfPluginPropertiesActions.clickValidateButton();
        boolean errorExist = errorMessage.
                toLowerCase().contains(ElementHelper.getElementText(BWOHDLocators.bannerError).toLowerCase());
        Assert.assertTrue(errorExist);
    }

    @Then("Validate and Match the expected Sap record in BigQuery {string} Table")
    public static void fetchTheRecordFromBQ(String table) throws IOException, InterruptedException {
        String sapRecord = PluginPropertyUtils.pluginProp("bwohd");
        Map<String, String> sapRcordInMap = gson.fromJson(sapRecord, Map.class);
        String selectQuery = "SELECT TO_JSON(t) result FROM `" +
                PluginPropertyUtils.pluginProp("projectId") + "." +
                PluginPropertyUtils.pluginProp("dataset") +
                "." + PluginPropertyUtils.pluginProp(table) + "` AS t WHERE REQTSN='20220504093007000135000'and DATAPAKID=1 " +
                "and RECORD=6";
        TableResult result = BigQueryClient.getQueryResult(selectQuery);
        String bigQueryJsonResponse = result.getValues().iterator().next().get(0).getValue().toString();
        Map<String, Object> bigQueryResponseInMap = gson.fromJson(bigQueryJsonResponse, Map.class);
        Assert.assertTrue(compareValueOfBothJson(sapRcordInMap, bigQueryResponseInMap));
    }

    private static boolean compareValueOfBothJson(Map<String, String> sapRcordInMap,
                                                  Map<String, Object> bigQueryResponseMap) {
        if (sapRcordInMap.isEmpty() || bigQueryResponseMap.isEmpty()) {
            return false;
        }
        boolean result = false;
        Set<String> bigQueryKeySet = bigQueryResponseMap.keySet();

        for (String key : bigQueryKeySet) {
            Object sapValue = sapRcordInMap.get(key);
            Object bigQueryValue = bigQueryResponseMap.get(key);
            result = String.valueOf(sapValue).equals(String.valueOf(bigQueryValue));
            if (!result) {
                return false;
            }
        }
        return result;
    }
}
