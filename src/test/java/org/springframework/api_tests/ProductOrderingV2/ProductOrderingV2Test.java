
  package org.springframework.api_tests.ProductOrderingV2;

  import com.intuit.karate.Results;
  import com.intuit.karate.Runner;
  // import com.intuit.karate.http.HttpServer;
  // import com.intuit.karate.http.ServerConfig;
  import org.junit.jupiter.api.Test;

  import static org.junit.jupiter.api.Assertions.assertEquals;

  class ProductOrderingV2 {

      @Test
      void testAll() {
          String apiHostServer = System.getenv().getOrDefault("API_HOST", "http://localhost:4010");
          Results results = Runner.path("src/test/java/org/springframework/api_tests/ProductOrderingV2")
                  .systemProperty("url.base", apiHostServer)
                  .reportDir("testReport").parallel(1);
          assertEquals(0, results.getFailCount(), results.getErrorMessages());
      }

  }
