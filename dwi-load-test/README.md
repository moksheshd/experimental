# Login Load Test

This project demonstrates how to use Karate with Gatling for API load testing.

## Project Structure

- `src/test/resources/users.csv`: CSV file containing usernames for testing
- `src/test/resources/login.feature`: Karate feature file defining the login test
- `src/test/resources/karate-config.js`: Karate configuration file
- `src/test/scala/com/mokshesh/LoginLoadSimulation.scala`: Gatling simulation for load testing
- `src/test/java/com/mokshesh/LoginLoadTest.java`: Alternative Java runner using JUnit (not used for Gatling)

## Running the Load Test

To run the Gatling load test, execute the following command:

```bash
./gradlew gatlingRun
```

This will:
1. Read usernames from the users.csv file
2. Send login requests to the API endpoint with 1000 virtual users
3. Generate detailed Gatling reports in the `build/gatling-results` directory

Alternatively, you can run the JUnit-based test with:

```bash
./gradlew runLoadTest
```

## Configuration

### Load Test Parameters

The load test is configured in `LoginLoadSimulation.scala` with the following parameters:
- Ramps up to 1000 concurrent users over 60 seconds
- Maximum test duration of 120 seconds
- Uses all usernames from the CSV file (with circular feeding if needed)

### API Configuration

- The API endpoint is configured in the `login.feature` file
- All HTTP headers are set up to match the browser request
- The same password is used for all users

## Future Enhancements

The code includes commented sections for future API chaining:
1. Login
2. Switch facility
3. Create job

To implement this chain, you would:
1. Create additional feature files for each step
2. Uncomment and modify the `fullWorkflowScenario` in the simulation file
3. Pass data between steps using Karate's context
