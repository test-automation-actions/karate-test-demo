function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  // Read the YAML configuration file
  var allConfig = karate.read('classpath:examples/config.yaml');

  // Select the configuration for the current environment
  var envConfig = allConfig[env];

  // Initialize the config object with environment-specific values
  // Also, add the 'env' property to the config object
  var config = {
    env: env,
    baseUrl: envConfig.baseUrl,
    myVarName: envConfig.myVarName
  };

  // You can still add or override any specific config variables here if needed
  // For example:
  // if (env == 'dev') {
  //   config.anotherDevSpecificVar = 'devOnlyValue';
  // }

  karate.log('Config loaded for environment:', env, config);

  return config;
}
