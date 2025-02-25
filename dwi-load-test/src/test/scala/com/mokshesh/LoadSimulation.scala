package com.mokshesh

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
import io.gatling.core.controller.inject.open.OpenInjectionStep

class LoadSimulation extends Simulation {

  // Disable Gatling console logging
  System.setProperty("org.slf4j.simpleLogger.defaultLogLevel", "warn")
  
  val protocol = karateProtocol()
  
  // Configure protocol with specific details
  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  
  // CSV feeder for usernames
  val csvFeeder = csv("users.csv").circular

  // Full workflow scenario that includes all API calls
  val fullWorkflowScenario = scenario("Full API Workflow")
    .feed(csvFeeder)
    // Login once
    .exec(karateFeature("classpath:login.feature"))
    // Switch facility once
    .exec(karateFeature("classpath:switch-facility.feature"))
    // Continuously create jobs in a loop
    .forever {
      exec(karateFeature("classpath:create-job.feature"))
    }

  // Define the load simulation
  setUp(
    fullWorkflowScenario.inject(
      // Just 2 users logged in at the start
      atOnceUsers(2)
    ).protocols(protocol)
  ).maxDuration(15.seconds) // Maximum test duration of 90 seconds
}
