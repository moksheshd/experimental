package com.mokshesh;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class LoginLoadTest {

    @Test
    void testLoginPerformance() {
        // Configure the parallel runner
        Results results = Runner.path("classpath:login.feature")
                .outputCucumberJson(true)
                .parallel(5); // Run with 5 threads in parallel
        
        // Assert that there were no failures
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    // This can be used to run the test from the command line
    public static void main(String[] args) {
        Results results = Runner.path("classpath:login.feature")
                .outputCucumberJson(true)
                .parallel(5);
        
        System.out.println("Tests completed. Failed: " + results.getFailCount());
        if (results.getFailCount() > 0) {
            System.out.println("Error messages: " + results.getErrorMessages());
        }
        System.exit(results.getFailCount() > 0 ? 1 : 0);
    }
}
