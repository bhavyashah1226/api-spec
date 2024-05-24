// ********RoostGPT********
/*
Test generated by RoostGPT for test sandbox using AI Type Azure Open AI and AI Model roostgpt-4-32k

Test generated for /v1/sandbox-self-service/data_post for http method type POST in rest-assured framework

RoostTestHash=228818e10e


*/

// ********RoostGPT********
package org.springframework.RoostTest;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static io.restassured.RestAssured.given;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import org.hamcrest.MatcherAssert;
import static org.hamcrest.Matchers.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.json.JSONObject;
import org.json.XML;
import org.json.JSONException;
import org.json.JSONArray;
import java.util.Arrays;

public class v1SandboxselfserviceDataPostTest {

    List<Map<String, String>> envList = new ArrayList<>();


    @BeforeEach
    public void setUp() {
      TestdataLoader dataloader = new TestdataLoader();
      String[] envVarsList = {"client-id", "client-secret", "profile-id"};
      envList = dataloader.load("src/test/java/org/springframework/RoostTest/v1_sandbox-self-service_dataPostTest.csv", envVarsList);
    }

  
    @Test  
    public void v1SandboxselfserviceDataPost_Test() throws JSONException {
        this.setUp();
        Integer testNumber = 1;
        for (Map<String, String> testData : envList) {
          RestAssured.baseURI = (testData.get("BASE_URL") != null && !testData.get("BASE_URL").isEmpty()) ? testData.get("BASE_URL"): "https://sandbox.corporate-api.hsbc.com";  
          JSONObject requestBodyObject = new JSONObject();
          if(testData.get("RequestBody") != null){
              requestBodyObject = new JSONObject(testData.get("RequestBody"));
          }
                Response responseObj = given()
				.header("x-hsbc-client-id", testData.get("x-hsbc-client-id") != null ? testData.get("x-hsbc-client-id") : "")
				.header("x-hsbc-client-secret", testData.get("x-hsbc-client-secret") != null ? testData.get("x-hsbc-client-secret") : "")
				.header("x-hsbc-profile-id", testData.get("x-hsbc-profile-id") != null ? testData.get("x-hsbc-profile-id") : "")
				.header("product-category", testData.get("product-category") != null ? testData.get("product-category") : "")
				.header("category-version", testData.get("category-version") != null ? testData.get("category-version") : "")
				.header("api-name", testData.get("api-name") != null ? testData.get("api-name") : "")
				.header("api-version", testData.get("api-version") != null ? testData.get("api-version") : "")
				.header("table-name", testData.get("table-name") != null ? testData.get("table-name") : "")
				.header("product-name", testData.get("product-name") != null ? testData.get("product-name") : "")
                .when()
                .post("/v1/sandbox-self-service/data")  
                .then() 
                .extract().response(); 
              JsonPath response;
              String contentType = responseObj.getContentType();

              System.out.printf("Test Case %d: v1SandboxselfserviceDataPost_Test \n", testNumber++);
              System.out.println("Request: POST /v1/sandbox-self-service/data");
              System.out.println("Status Code: " + responseObj.statusCode());
              if (testData.get("statusCode") != null) {
                String statusCodeFromCSV = testData.get("statusCode");
                if (statusCodeFromCSV.contains("X")) {
                  MatcherAssert.assertThat(
                      "Expected a status code of category " + statusCodeFromCSV + ", but got "
                          + Integer.toString(responseObj.statusCode()) + " instead",
                      Integer.toString(responseObj.statusCode()).charAt(0), equalTo(statusCodeFromCSV.charAt(0)));
                } else {
                  MatcherAssert.assertThat(
                      Integer.toString(responseObj.statusCode()), equalTo(statusCodeFromCSV));
                }
              } 
              				else {  
      List<Integer> expectedStatusCodes = Arrays.asList(200);
				MatcherAssert.assertThat(responseObj.statusCode(), is(in(expectedStatusCodes)));
          }
				String stringifiedStatusCode = Integer.toString(responseObj.statusCode());
        switch(responseObj.statusCode()){
        
          case 200:
            stringifiedStatusCode = "200";
            MatcherAssert.assertThat(contentType, equalTo("application/json"));
            break;
         
    }

      switch(Integer.toString(responseObj.statusCode()).charAt(0)){
      
    }

      
              if (contentType.contains("application/xml") || contentType.contains("text/xml")) {
                String xmlResponse = responseObj.asString();
                JSONObject jsonResponse = XML.toJSONObject(xmlResponse);
                JSONObject jsonData = jsonResponse.getJSONObject("xml");
                String jsonString = jsonData.toString();
                response = new JsonPath(jsonString);
        
              } else if(contentType.contains("application/json")){  
                response = responseObj.jsonPath(); 
              } else {
                System.out.println("Response content type found: "+contentType+", but RoostGPT currently only supports the following response content types: application/json,text/xml,application/xml");
                continue;
              }
         
                if(stringifiedStatusCode.equals("200")){					System.out.println("Description: Successful response");
				}


            }  
    }
}
