package com.mokshesh

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class LoadSimulation extends Simulation {

  val protocol = karateProtocol()
  
  // Configure protocol with specific details
  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  
  // CSV feeder for usernames
  val csvFeeder = csv("users.csv").circular

  // Full workflow scenario that includes all API calls
  val fullWorkflowScenario = scenario("Full API Workflow")
    .feed(csvFeeder)
    .exec(karateFeature("classpath:login.feature"))
    .exec(karateFeature("classpath:switch-facility.feature"))
    .exec(karateFeature("classpath:create-job.feature"))

  // Define the load simulation
  setUp(
    fullWorkflowScenario.inject(
      // Start with 1 user and ramp up to 1000 users over 60 seconds
      rampUsers(2).during(10.seconds)
    ).protocols(protocol)
  ).maxDuration(15.seconds) // Maximum test duration
}
