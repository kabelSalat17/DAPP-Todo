module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", //localhost and port where ganache runs
      port: 7545,
      network_id: "*" // Match any network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}