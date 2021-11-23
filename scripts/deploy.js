const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();
  
    console.log('Deploying contracts with account: ', deployer.address);
    console.log('Account balance: ', accountBalance.toString());
  
    const Token = await hre.ethers.getContractFactory('MyWaveContract');
    const portal = await Token.deploy();
    await portal.deployed();
  
    console.log('Wave Contract address: ', portal.address);
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.error(error);
      process.exit(1);
    }
  };
  
  runMain();

  // contract addy 0x133Dadddc938A30B47FfADa424d79001F97813e0