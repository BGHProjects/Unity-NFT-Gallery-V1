import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { Artwork } from "../../typechain-types";
const { ethers, upgrades } = require("hardhat");

let Deployer: SignerWithAddress;
let Alice: SignerWithAddress;

let ArtworkContract: Artwork;

const deployFixture = async () => {
  [Deployer, Alice] = await ethers.getSigners();

  const Artwork_Contract = await ethers.getContractFactory("Artwork", Deployer);
  ArtworkContract = await upgrades.deployProxy(Artwork_Contract, [
    "ArtworkContract",
    "ART",
  ]);
  await ArtworkContract.deployed();

  return {
    Deployer,
    Alice,
    ArtworkContract,
  };
};

export default deployFixture;
