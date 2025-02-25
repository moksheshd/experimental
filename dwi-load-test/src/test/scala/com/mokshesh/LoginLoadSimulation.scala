package com.mokshesh

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class LoginLoadSimulation extends Simulation {

  val protocol = karateProtocol()
  
  // Configure protocol with specific details
  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  
  // CSV feeder for usernames
  val csvFeeder = csv("users.csv").circular

  // This will use all users from the CSV file
  val loginTest = scenario("Login Test")
    .feed(csvFeeder)
    .exec(karateFeature("classpath:login.feature"))

  // Future API chain would look like:
  // val fullWorkflowScenario = scenario("Full API Workflow")
  //   .exec(karateFeature("classpath:login.feature"))
  //   .exec(karateFeature("classpath:switch-facility.feature"))
  //   .exec(karateFeature("classpath:create-job.feature"))

  // Define the load simulation
  setUp(
    loginTest.inject(
      // Start with 1 user and ramp up to 1000 users over 60 seconds
      rampUsers(1000).during(60.seconds)
    ).protocols(protocol)
  ).maxDuration(120.seconds) // Maximum test duration
}
