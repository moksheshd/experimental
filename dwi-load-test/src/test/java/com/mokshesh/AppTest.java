package com.mokshesh;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test
    void appHasGreeting() {
        App classUnderTest = new App();
        assertNotNull(classUnderTest.getGreeting(), "App should have a greeting");
        assertEquals("Hello, Gradle!", classUnderTest.getGreeting(), "Greeting should match expected value");
    }
}
